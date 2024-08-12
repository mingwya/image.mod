' Copyright (c) 2022-2024 Bruce A Henderson
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
bbdoc: Image/SVG loader
about:
The SVG loader module provides the ability to load SVG format #pixmaps.
End Rem
Module Image.SVG

ModuleInfo "Version: 1.02"
ModuleInfo "Author: 2013-14 Mikko Mononen"
ModuleInfo "License: ZLib/PNG License"
ModuleInfo "Credit: Adapted for BlitzMax by Bruce A Henderson"

ModuleInfo "History: 1.02"
ModuleInfo "History: Added support for scaling images into a pixmap of a specified size."
ModuleInfo "History: 1.01"
ModuleInfo "History: Update to nanosvg 706eb06"
ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release. nanosvg"

Import BRL.Pixmap

Import "common.bmx"

Rem
bbdoc: An SVG image.
End Rem
Type TSvgImage

	Field svgImage:SNSVGimage Ptr

	Method Free()
		If svgImage Then
			nsvgDelete(svgImage)
			svgImage = Null
		End If
	End Method

	Method Delete()
		Free()
	End Method

	Method Load:TPixmap(stream:TStream, units:String, dpi:Float)
		Local data:Byte[] = LoadByteArray( stream )
		Local u:Byte Ptr = units.ToCString()
		svgImage = nsvgParse(data, u, dpi)
		MemFree(u)

		If Not svgImage Or Not svgImage.shapes Then
			Return Null
		End If

		Return GetPixmap(Int(svgImage.width), Int(svgImage.height))
	End Method

	Rem
	bbdoc: Loads the SVG image from the specified object.
	about: The units and DPI are used to determine the size of the image.
	End Rem
	Function LoadImage:TSvgImage(obj:Object, units:String = "px", dpi:Float = 96)
		Local image:TSvgImage = New TSvgImage()

		Local data:Byte[] = LoadByteArray( obj )
		Local u:Byte Ptr = units.ToCString()
		image.svgImage = nsvgParse(data, u, dpi)
		MemFree(u)

		Return image
	End Function

	Rem
	bbdoc: Returns the dimensions of the SVG image.
	about: The width and height are in the units specified when the SVG image was loaded.
	End Rem
	Method Dimensions(width:Float Var, height:Float Var)
		If svgImage Then
			width = svgImage.width
			height = svgImage.height
		End If
	End Method

	Rem
	bbdoc: Returns the width of the SVG image.
	about: The width is in the units specified when the SVG image was loaded.
	End Rem
	Method Width:Float()
		If svgImage Then
			Return svgImage.width
		End If
		Return 0
	End Method

	Rem
	bbdoc: Returns the height of the SVG image.
	about: The height is in the units specified when the SVG image was loaded.
	End Rem
	Method Height:Float()
		If svgImage Then
			Return svgImage.height
		End If
		Return 0
	End Method

	Rem
	bbdoc: Gets a rasterized representation of the SVG image of the specified size and scale.
	about: A scale of 1 will render the image at the original size - which can be determined by calling the #Width, #Height or #Dimensions methods.
	End Rem
	Method GetPixmap:TPixmap(width:Int, height:Int, scale:Float = 1.0)
		If svgImage Then
			Local pix:TPixmap = CreatePixmap( width, height, PF_RGBA8888, 4 )

			Local raster:Byte Ptr = nsvgCreateRasterizer()

			nsvgRasterize(raster, svgImage, 0, 0, scale, pix.pixels, pix.width, pix.height, pix.pitch);

			nsvgDeleteRasterizer(raster)

			Return pix
		End If
	End Method

	Rem
	bbdoc: Gets a rasterized representation of the SVG image that fits within the specified maximum width and height.
	about: The aspect ratio of the image is maintained.
	If the height is not specified, it will be the same as the width.
	End Rem
	Method FitPixmap:TPixmap(maxWidth:Int, maxHeight:Int = 0)
		Local width:Float
		Local height:Float
		Dimensions(width, height)

		If maxHeight = 0 Then
			maxHeight = maxWidth
		End If

		Local ratio:Float = Min(maxWidth / width, maxHeight / height)

		Return GetPixmap(Int(width * ratio), Int(height * ratio), ratio)
	End Method

End Type

Private


Type TPixmapLoaderSvg Extends TPixmapLoader

	Method LoadPixmap:TPixmap( stream:TStream ) Override
		Local image:TSvgImage = New TSvgImage()
		Local pix:TPixmap = image.Load(stream, "px", 96)
		image.Free()
		Return pix
	End Method

End Type

New TPixmapLoaderSvg

