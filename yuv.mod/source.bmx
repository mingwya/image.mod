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

Import "libyuv/include/*.h"

Import "libyuv/source/compare.cc"
Import "libyuv/source/compare_common.cc"
Import "libyuv/source/compare_gcc.cc"
Import "libyuv/source/compare_msa.cc"
Import "libyuv/source/compare_neon.cc"
Import "libyuv/source/compare_neon64.cc"
Import "libyuv/source/compare_win.cc"
Import "libyuv/source/convert.cc"
Import "libyuv/source/convert_argb.cc"
Import "libyuv/source/convert_from.cc"
Import "libyuv/source/convert_from_argb.cc"
Import "libyuv/source/convert_jpeg.cc"
Import "libyuv/source/convert_to_argb.cc"
Import "libyuv/source/convert_to_i420.cc"
Import "libyuv/source/cpu_id.cc"
Import "libyuv/source/mjpeg_decoder.cc"
Import "libyuv/source/mjpeg_validate.cc"
Import "libyuv/source/planar_functions.cc"
Import "libyuv/source/rotate.cc"
Import "libyuv/source/rotate_any.cc"
Import "libyuv/source/rotate_argb.cc"
Import "libyuv/source/rotate_common.cc"
Import "libyuv/source/rotate_gcc.cc"
Import "libyuv/source/rotate_lsx.cc"
Import "libyuv/source/rotate_msa.cc"
Import "libyuv/source/rotate_neon.cc"
Import "libyuv/source/rotate_neon64.cc"
Import "libyuv/source/rotate_win.cc"
Import "libyuv/source/row_any.cc"
Import "libyuv/source/row_common.cc"
Import "libyuv/source/row_gcc.cc"
Import "libyuv/source/row_lasx.cc"
Import "libyuv/source/row_lsx.cc"
Import "libyuv/source/row_msa.cc"
Import "libyuv/source/row_neon.cc"
Import "libyuv/source/row_neon64.cc"
Import "libyuv/source/row_rvv.cc"
Import "libyuv/source/row_sve.cc"
Import "libyuv/source/row_win.cc"
Import "libyuv/source/scale.cc"
Import "libyuv/source/scale_any.cc"
Import "libyuv/source/scale_argb.cc"
Import "libyuv/source/scale_common.cc"
Import "libyuv/source/scale_gcc.cc"	
Import "libyuv/source/scale_lsx.cc"
Import "libyuv/source/scale_msa.cc"
Import "libyuv/source/scale_neon.cc"
Import "libyuv/source/scale_neon64.cc"
Import "libyuv/source/scale_rgb.cc"
Import "libyuv/source/scale_rvv.cc"
Import "libyuv/source/scale_uv.cc"
Import "libyuv/source/scale_win.cc"
Import "libyuv/source/video_common.cc"
