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

Import "qoi/*.h"
Import "glue.c"


Extern
	Function qoi_decode:Byte Ptr(data:byte Ptr, size:Int, desc:SQoiDesc Var, channels:Int)
	Function qoi_encode:Byte Ptr(data:Byte Ptr, desc:SQoiDesc Var, outLen:Int Var)
End Extern


Rem
bbdoc: Describes the format of the Qoi image.
End Rem
Struct SQoiDesc
	Field width:UInt
	Field height:UInt
	Field channels:Byte
	Field colorspace:EQoiColorspace
End Struct

Enum EQoiColorspace : Byte
	SRGB
	LINEAR
End Enum
