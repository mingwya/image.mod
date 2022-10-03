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

Import Image.JXL
Import Image.CMS

Import "source.bmx"

Extern

	Function JxlEncoderVersion:UInt()
	Function JxlEncoderCreate:Byte Ptr(mem:Byte Ptr)
	Function JxlEncoderReset(handle:Byte Ptr)
	Function JxlEncoderDestroy(handle:Byte Ptr)
	Function JxlEncoderInitBasicInfo(info:SJxlBasicInfo Var)
	Function JxlEncoderSetBasicInfo:Int(handle:Byte Ptr, info:SJxlBasicInfo Var)
	Function JxlColorEncodingSetToSRGB(encoding:SJxlColorEncoding Var, isGrey:Int)
	Function JxlEncoderSetColorEncoding:Int(handler:Byte Ptr, color:SJxlColorEncoding Var)
	Function JxlEncoderAddImageFrame:Int(settings:Byte Ptr, pixel_format:SJxlPixelFormat Var, pixels:Byte Ptr, size:Size_T)
	Function JxlEncoderProcessOutput:Int(handle:Byte Ptr, next_out:Byte Ptr Ptr, avail_out:Size_T Var)
	Function JxlEncoderCloseInput(handle:Byte Ptr)

	Function JxlEncoderFrameSettingsCreate:Byte Ptr(handler:Byte Ptr, source:Byte Ptr)
	Function JxlEncoderSetFrameDistance:Int(frame_settings:Byte Ptr, distance:Float)
	Function JxlEncoderFrameSettingsSetOption:Int(frame_settings:Byte Ptr, option:EJxlEncoderFrameSettingId, value:Int)
	Function JxlEncoderSetFrameLossless:Int(frame_settings:Byte Ptr, lossless:Int)

	Function bmx_jxl_JxlEncoderSetParallelRunner:Int(handle:Byte Ptr, runner:Byte Ptr)

End Extern

Const JXL_ENC_SUCCESS:Int = 0
Const JXL_ENC_ERROR:Int = 1
Const JXL_ENC_NEED_MORE_OUTPUT:Int = 2

Enum EJxlEncoderFrameSettingId
	JXL_ENC_FRAME_SETTING_EFFORT = 0
	JXL_ENC_FRAME_SETTING_DECODING_SPEED = 1
	JXL_ENC_FRAME_SETTING_RESAMPLING = 2
	JXL_ENC_FRAME_SETTING_EXTRA_CHANNEL_RESAMPLING = 3
	JXL_ENC_FRAME_SETTING_ALREADY_DOWNSAMPLED = 4
	JXL_ENC_FRAME_SETTING_PHOTON_NOISE = 5
	JXL_ENC_FRAME_SETTING_NOISE = 6
	JXL_ENC_FRAME_SETTING_DOTS = 7
	JXL_ENC_FRAME_SETTING_PATCHES = 8
	JXL_ENC_FRAME_SETTING_EPF = 9
	JXL_ENC_FRAME_SETTING_GABORISH = 10
	JXL_ENC_FRAME_SETTING_MODULAR = 11
	JXL_ENC_FRAME_SETTING_KEEP_INVISIBLE = 12
	JXL_ENC_FRAME_SETTING_GROUP_ORDER = 13
	JXL_ENC_FRAME_SETTING_GROUP_ORDER_CENTER_X = 14
	JXL_ENC_FRAME_SETTING_GROUP_ORDER_CENTER_Y = 15
	JXL_ENC_FRAME_SETTING_RESPONSIVE = 16
	JXL_ENC_FRAME_SETTING_PROGRESSIVE_AC = 17
	JXL_ENC_FRAME_SETTING_QPROGRESSIVE_AC = 18
	JXL_ENC_FRAME_SETTING_PROGRESSIVE_DC = 19
	JXL_ENC_FRAME_SETTING_CHANNEL_COLORS_GLOBAL_PERCENT = 20
	JXL_ENC_FRAME_SETTING_CHANNEL_COLORS_GROUP_PERCENT = 21
	JXL_ENC_FRAME_SETTING_PALETTE_COLORS = 22
	JXL_ENC_FRAME_SETTING_LOSSY_PALETTE = 23
	JXL_ENC_FRAME_SETTING_COLOR_TRANSFORM = 24
	JXL_ENC_FRAME_SETTING_MODULAR_COLOR_SPACE = 25
	JXL_ENC_FRAME_SETTING_MODULAR_GROUP_SIZE = 26
	JXL_ENC_FRAME_SETTING_MODULAR_PREDICTOR = 27
	JXL_ENC_FRAME_SETTING_MODULAR_MA_TREE_LEARNING_PERCENT = 28
	JXL_ENC_FRAME_SETTING_MODULAR_NB_PREV_CHANNELS = 29
	JXL_ENC_FRAME_SETTING_JPEG_RECON_CFL = 30
	JXL_ENC_FRAME_INDEX_BOX = 31
	JXL_ENC_FRAME_SETTING_BROTLI_EFFORT = 32
End Enum
