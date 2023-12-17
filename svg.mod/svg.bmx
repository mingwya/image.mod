' Copyright (c) 2022-2023 Bruce A Henderson
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

ModuleInfo "Version: 1.01"
ModuleInfo "Author: 2013-14 Mikko Mononen"
ModuleInfo "License: ZLib/PNG License"
ModuleInfo "Credit: Adapted for BlitzMax by Bruce A Henderson"

ModuleInfo "History: 1.01"
ModuleInfo "History: Update to nanosvg 706eb06"
ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release. nanosvg"

Import BRL.Pixmap

Import "common.bmx"

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

	Rem
	bbdoc: 
	End Rem
	Method Load:TPixmap(stream:TStream, units:String, dpi:Float)
		Local data:Byte[] = LoadByteArray( stream )
		Local u:Byte Ptr = units.ToCString()
		svgImage = nsvgParse(data, u, dpi)
		MemFree(u)

		If Not svgImage Or Not svgImage.shapes Then
			Return Null
		End If

		Local pix:TPixmap = CreatePixmap( Int(svgImage.width), Int(svgImage.height), PF_RGBA8888, 4 )

		Local raster:Byte Ptr = nsvgCreateRasterizer()

		nsvgRasterize(raster, svgImage, 0, 0, 1, pix.pixels, pix.width, pix.height, pix.pitch);

		nsvgDeleteRasterizer(raster)

		Return pix
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

