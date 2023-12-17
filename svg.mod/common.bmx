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

Import "nanosvg/src/*.h"
Import "glue.c"

Extern
	Function nsvgParse:SNSVGimage Ptr(input:Byte ptr, units:Byte Ptr, dpi:Float)
	Function nsvgDelete(handle:SNSVGimage Ptr)

	Function nsvgCreateRasterizer:Byte Ptr()
	Function nsvgRasterize(handle:Byte Ptr, image:SNSVGimage Ptr, tx:Float, ty:Float, scale:Float, dst:Byte Ptr, w:Int, h:Int, stride:Int)
	Function nsvgDeleteRasterizer(handle:Byte Ptr)
End Extern

Struct SNSVGimage
	Field width:Float
	Field height:Float
	Field shapes:Byte Ptr
End Struct
