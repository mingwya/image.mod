' Copyright (c) 2022 Bruce A Henderson
' 
' This software is provided 'as-is', without any express or implied
' warranty. In no event will the authors be held liable for any damages
' arising from the use of this software.
' 
' Permission is granted to anyone to use this software for any purpose,
' including commercial applications, and to alter it and redistribute it
' freely, subject to the following restrictions:
' 
' 1. The origin of this software must not be misrepresented; you must not
'    claim that you wrote the original software. If you use this software
'    in a product, an acknowledgment in the product documentation would be
'    appreciated but is not required.
' 2. Altered source versions must be plainly marked as such, and must not be
'    misrepresented as being the original software.
' 3. This notice may not be removed or altered from any source distribution.
' 
SuperStrict

Rem
bbdoc: Image/GIF loader
about:
The GIF loader module provides the ability to load GIF format #pixmaps.
End Rem
Module Image.GIF

Import BRL.Max2D
Import Image.Stb

Rem
bbdoc: A GIF image.
End Rem
Type TGifImage

	Rem
	bbdoc: Loads a GIF image as a #TImage.
	returns: A #TImage, or #Null if the image could not be loaded.
	about: For animated GIF images, the #TImage will be created with the appropriate frames and frame durations.
	End Rem
	Function LoadImage:TImage(url:Object, flags:Int = -1)

		Local stream:TStream=ReadStream( url )
		If Not stream Throw New TStreamReadException

		Local cb:TStbioCallbacks = New TStbioCallbacks
		cb.stream = stream

		Local delays:Int Ptr
		Local w:Int
		Local h:Int
		Local layers:Int
		Local comp:Int

		Local imgPtr:Byte Ptr = bmx_stbi_load_gif(cb, varptr delays, w, h, layers, comp, 0)
		If Not imgPtr Then
			Return Null
		End If

		Local pitch:Int = w * comp
		Local size:Size_T = w * h * comp

		Local image:TImage = CreateImage(w, h, layers, flags)

		For Local i:Int = 0 until layers
			Local pixmap:TPixmap = CreatePixmap( w, h, PF_RGBA8888, 4 )
			MemCopy( pixmap.pixels, imgPtr + pitch * h * i, size )
			image.SetPixmap(i, pixmap, delays[i])
		Next

		stbi_image_free(imgPtr)
		bmx_stbi_free_delays(varptr delays)

		Return image
	End Function

End Type
