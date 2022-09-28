'
' Copyright (c) 2022 Bruce A Henderson
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

Import BRL.Pixmap

Import "source.bmx"

Extern
	Function JxlSignatureCheck:EJxlSignature(data:Byte Ptr, size:Size_T)
	Function JxlDecoderCreate:Byte Ptr(mem:Byte Ptr)
	Function JxlDecoderDestroy(handle:Byte Ptr)
	Function JxlDecoderSetKeepOrientation:Int(handle:Byte Ptr, skipReorientation:Int)
	Function JxlDecoderSubscribeEvents:Int(handle:Byte Ptr, events:Int)
	Function JxlDecoderProcessInput:Int(handle:Byte Ptr)
	Function JxlDecoderReleaseInput:Size_T(handle:Byte Ptr)
	Function JxlDecoderSetInput:Int(handle:Byte Ptr, data:Byte Ptr, size:Size_T)
	Function JxlDecoderCloseInput(handle:Byte Ptr)
	Function JxlDecoderGetBasicInfo:Int(handle:Byte Ptr, info:SJxlBasicInfo Var)
	Function JxlDecoderGetExtraChannelInfo:Int(handle:Byte Ptr, index:Size_T, info:SJxlExtraChannelInfo Var)
	Function JxlDecoderImageOutBufferSize:Int(handle:Byte Ptr, format:SJxlPixelFormat Var, size:Size_T Var)
	Function JxlDecoderSetImageOutBuffer:Int(handle:Byte Ptr, format:SJxlPixelFormat Var, buffer:Byte Ptr, size:Size_T)
	Function JxlResizableParallelRunnerCreate:Byte Ptr(mem:Byte Ptr)
	Function JxlResizableParallelRunnerSetThreads(runner:Byte Ptr, numThreads:Size_T)
	Function JxlResizableParallelRunnerDestroy(runner:Byte Ptr)

	Function bmx_jxl_JxlDecoderSetParallelRunner:Int(handle:Byte Ptr, runner:Byte Ptr)


End Extern

Const JXL_DEC_SUCCESS:Int = 0
Const JXL_DEC_ERROR:Int = 1
Const JXL_DEC_NEED_MORE_INPUT:Int = 2
Const JXL_DEC_NEED_PREVIEW_OUT_BUFFER:Int = 3
Const JXL_DEC_NEED_DC_OUT_BUFFER:Int = 4
Const JXL_DEC_NEED_IMAGE_OUT_BUFFER:Int = 5
Const JXL_DEC_JPEG_NEED_MORE_OUTPUT:Int = 6
Const JXL_DEC_BOX_NEED_MORE_OUTPUT:Int = 7
Const JXL_DEC_BASIC_INFO:Int = $40
Const JXL_DEC_EXTENSIONS:Int = $80
Const JXL_DEC_COLOR_ENCODING:Int = $100
Const JXL_DEC_PREVIEW_IMAGE:Int = $200
Const JXL_DEC_FRAME:Int = $400
Const JXL_DEC_DC_IMAGE:Int = $800
Const JXL_DEC_FULL_IMAGE:Int = $1000
Const JXL_DEC_JPEG_RECONSTRUCTION:Int = $2000
Const JXL_DEC_BOX:Int = $4000
Const JXL_DEC_FRAME_PROGRESSION:Int = $8000

Enum EJxlOrientation:Int
	JXL_ORIENT_IDENTITY = 1
	JXL_ORIENT_FLIP_HORIZONTAL = 2
	JXL_ORIENT_ROTATE_180 = 3
	JXL_ORIENT_FLIP_VERTICAL = 4
	JXL_ORIENT_TRANSPOSE = 5
	JXL_ORIENT_ROTATE_90_CW = 6
	JXL_ORIENT_ANTI_TRANSPOSE = 7
	JXL_ORIENT_ROTATE_90_CCW = 8
End Enum

Enum EJxlExtraChannelType
	JXL_CHANNEL_ALPHA
	JXL_CHANNEL_DEPTH
	JXL_CHANNEL_SPOT_COLOR
	JXL_CHANNEL_SELECTION_MASK
	JXL_CHANNEL_BLACK
	JXL_CHANNEL_CFA
	JXL_CHANNEL_THERMAL
	JXL_CHANNEL_RESERVED0
	JXL_CHANNEL_RESERVED1
	JXL_CHANNEL_RESERVED2
	JXL_CHANNEL_RESERVED3
	JXL_CHANNEL_RESERVED4
	JXL_CHANNEL_RESERVED5
	JXL_CHANNEL_RESERVED6
	JXL_CHANNEL_RESERVED7
	JXL_CHANNEL_UNKNOWN
	JXL_CHANNEL_OPTIONAL
End Enum

Enum EJxlDataType
	JXL_TYPE_FLOAT = 0
	JXL_TYPE_UINT8 = 2
	JXL_TYPE_UINT16 = 3
	JXL_TYPE_FLOAT16 = 5
End Enum

Enum EJxlEndianness
	JXL_NATIVE_ENDIAN = 0
	JXL_LITTLE_ENDIAN = 1
	JXL_BIG_ENDIAN = 2
End Enum

Enum EJxlSignature
	JXL_SIG_NOT_ENOUGH_BYTES = 0
	JXL_SIG_INVALID = 1
	JXL_SIG_CODESTREAM = 2
	JXL_SIG_CONTAINER = 3
End Enum

Enum EJxlWhitePoint
	JXL_WHITE_POINT_D65 = 1
	JXL_WHITE_POINT_CUSTOM = 2
	JXL_WHITE_POINT_E = 10
	JXL_WHITE_POINT_DCI = 11
End Enum

Enum EJxlPrimaries
	JXL_PRIMARIES_SRGB = 1
	JXL_PRIMARIES_CUSTOM = 2
	JXL_PRIMARIES_2100 = 9
	JXL_PRIMARIES_P3 = 11  
End Enum

Enum EJxlColorSpace
	JXL_COLOR_SPACE_RGB
	JXL_COLOR_SPACE_GRAY
	JXL_COLOR_SPACE_XYB
	JXL_COLOR_SPACE_UNKNOWN
End Enum

Enum EJxlTransferFunction
	JXL_TRANSFER_FUNCTION_709 = 1
	JXL_TRANSFER_FUNCTION_UNKNOWN = 2
	JXL_TRANSFER_FUNCTION_LINEAR = 8
	JXL_TRANSFER_FUNCTION_SRGB = 13
	JXL_TRANSFER_FUNCTION_PQ = 16
	JXL_TRANSFER_FUNCTION_DCI = 17
	JXL_TRANSFER_FUNCTION_HLG = 18
	JXL_TRANSFER_FUNCTION_GAMMA = 65535
End Enum

Enum EJxlRenderingIntent
	JXL_RENDERING_INTENT_PERCEPTUAL = 0
	JXL_RENDERING_INTENT_RELATIVE
	JXL_RENDERING_INTENT_SATURATION
	JXL_RENDERING_INTENT_ABSOLUTE
End Enum

Struct SJxlPreviewHeader
	Field xsize:UInt
	Field ysize:UInt
End Struct

Struct SJxlAnimationHeader
	Field tps_numerator:UInt
	Field tps_denominator:UInt
	Field num_loops:UInt
	Field have_timecodes:Int
End Struct

Struct SJxlBasicInfo
	Field have_container:Int
	Field xsize:UInt
	Field ysize:UInt
	Field bits_per_sample:UInt
	Field exponent_bits_per_sample:UInt
	Field intensity_target:Float
	Field min_nits:Float
	Field relative_to_max_display:Int
	Field linear_below:Float
	Field uses_original_profile:Int
	Field have_preview:Int
	Field have_animation:Int
	Field orientation:EJxlOrientation
	Field num_color_channels:UInt
	Field num_extra_channels:UInt
	Field alpha_bits:UInt
	Field alpha_exponent_bits:UInt
	Field alpha_premultiplied:Int
	Field preview:SJxlPreviewHeader
	Field animation:SJxlAnimationHeader
	Field intrinsic_xsize:UInt
	Field intrinsic_ysize:UInt
	Field StaticArray padding:Byte[100]
End Struct

Struct SJxlExtraChannelInfo
	Field channel_type:EJxlExtraChannelType
	Field bits_per_sample:UInt
	Field exponent_bits_per_sample:UInt
	Field dim_shift:UInt
	Field name_length:UInt
	Field alpha_premultiplied:Int
	Field StaticArray spot_color:Float[4]
	Field cfa_channel:UInt
End Struct

Struct SJxlPixelFormat
	Field num_channels:UInt
	Field data_type:EJxlDataType
	Field endianness:EJxlEndianness
	Field align:Size_T

	Method New(channels:UInt, dataType:EJxlDataType, endianness:EJxlEndianness, align:Size_T)
		Self.num_channels = channels
		Self.data_type = dataType
		Self.endianness = endianness
		Self.align = align
	End Method
End Struct

Struct SJxlColorEncoding
	Field color_space:EJxlColorSpace
	Field white_point:EJxlWhitePoint
	Field StaticArray white_point_xy:Double[2]
	Field primaries:EJxlPrimaries
	Field StaticArray primaries_red_xy:Double[2]
	Field StaticArray primaries_green_xv:Double[2]
	Field StaticArray primaries_blue_xy:Double[2]
	Field transfer_function:EJxlTransferFunction
	Field gamma:Double
	Field rendering_intent:EJxlRenderingIntent
End Struct
