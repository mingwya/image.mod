'
' Copyright (c) 2024 Bruce A Henderson
' All rights reserved.
'
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions are met:
'     * Redistributions of source code must retain the above copyright
'       notice, this list of conditions and the following disclaimer.
'     * Redistributions in binary form must reproduce the above copyright
'       notice, this list of conditions and the following disclaimer in the
'       documentation and/or other materials provided with the distribution.
'     * Neither the name of the author nor the
'       names of its contributors may be used to endorse or promote products
'       derived from this software without specific prior written permission.
'
' THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY
' EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
' WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
' DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
' (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
' LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
' ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Import "source.bmx"

Extern

	Function I420ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function I420ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function J420ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function J420ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function H420ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function H420ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function U420ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function U420ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function I422ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function I422ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function J422ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function J422ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function H422ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function H422ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function U422ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function U422ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function I444ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function I444ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function J444ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function J444ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function H444ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function H444ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

	Function U444ToARGB:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)
	Function U444ToABGR:Int(srcY:Byte Ptr, strideY:Int, srcU:Byte Ptr, strideU:Int, srcV:Byte Ptr, strideV:Int, dst:Byte Ptr, dstStride:Int, width:Int, height:Int)

End Extern
