' Copyright (c) 2023 Bruce A Henderson
' 
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions
' are met:
' 1. Redistributions of source code must retain the above copyright
'    notice, this list of conditions and the following disclaimer.
' 2. Redistributions in binary form must reproduce the above copyright
'    notice, this list of conditions and the following disclaimer in the
'    documentation and/or other materials provided with the distribution.
' 
' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS `AS IS'
' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
' IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
' ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
' LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
' CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
' SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
' INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
' CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
' ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
' POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Import BRL.Pixmap

Import "glue.c"

Import "include/*.h"
Import "openjpeg/src/lib/openjp2/*.h"
Import "openjpeg/src/lib/openjp2/thread.c"
Import "openjpeg/src/lib/openjp2/bio.c"
Import "openjpeg/src/lib/openjp2/cio.c"
Import "openjpeg/src/lib/openjp2/dwt.c"
Import "openjpeg/src/lib/openjp2/event.c"
Import "openjpeg/src/lib/openjp2/ht_dec.c"
Import "openjpeg/src/lib/openjp2/image.c"
Import "openjpeg/src/lib/openjp2/invert.c"
Import "openjpeg/src/lib/openjp2/j2k.c"
Import "openjpeg/src/lib/openjp2/jp2.c"
Import "openjpeg/src/lib/openjp2/mct.c"
Import "openjpeg/src/lib/openjp2/mqc.c"
Import "openjpeg/src/lib/openjp2/openjpeg.c"
Import "openjpeg/src/lib/openjp2/opj_clock.c"
Import "openjpeg/src/lib/openjp2/pi.c"
Import "openjpeg/src/lib/openjp2/t1.c"
Import "openjpeg/src/lib/openjp2/t2.c"
Import "openjpeg/src/lib/openjp2/tcd.c"
Import "openjpeg/src/lib/openjp2/tgt.c"
Import "openjpeg/src/lib/openjp2/function_list.c"
Import "openjpeg/src/lib/openjp2/opj_malloc.c"
Import "openjpeg/src/lib/openjp2/sparse_array.c"
