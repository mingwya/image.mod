' Copyright (c) 2021 Bruce A Henderson
' 
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
' 
' The above copyright notice and this permission notice shall be included in
' all copies or substantial portions of the Software.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
' THE SOFTWARE.
'
SuperStrict

Import "source.bmx"

Extern

	Function bmx_svg_loadFromData:Byte Ptr(data:Byte Ptr, length:Int)
	Function bmx_svg_free(handle:Byte Ptr)
	Function bmx_svg_width:Double(handle:Byte Ptr)
	Function bmx_svg_height:Double(handle:Byte Ptr)

	Function bmx_svg_renderToPixmap(handle:Byte Ptr, pixels:Byte Ptr, width:Int, height:Int, pitch:Int)
	Function bmx_svg_setDimensions(handle:Byte Ptr, width:Double, height:Double)
End Extern
