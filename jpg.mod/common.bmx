' Copyright (c) 2022 Bruce A Henderson
' Copyright (c) 2007- Blitz Research Ltd
'
' This software is provided 'as-is', without any express or implied
' warranty. In no event will the authors be held liable for any damages
' arising from the use of this software.
'
' Permission is granted to anyone to use this software for any purpose,
' including commercial applications, and to alter it and redistribute it
' freely, subject to the following restrictions:
'
'    1. The origin of this software must not be misrepresented; you must not
'    claim that you wrote the original software. If you use this software
'    in a product, an acknowledgment in the product documentation would be
'    appreciated but is not required.
'
'    2. Altered source versions must be plainly marked as such, and must not be
'    misrepresented as being the original software.
'
'    3. This notice may not be removed or altered from any source
'    distribution.
'
SuperStrict

Import "libjpeg/*.h"

Import "libjpeg/jcapimin.c" 
Import "libjpeg/jcapistd.c" 
Import "libjpeg/jccoefct.c" 
Import "libjpeg/jccolor.c" 
Import "libjpeg/jcdctmgr.c" 
Import "libjpeg/jchuff.c" 
Import "libjpeg/jcinit.c" 
Import "libjpeg/jcmainct.c" 
Import "libjpeg/jcmarker.c" 
Import "libjpeg/jcmaster.c" 
Import "libjpeg/jcomapi.c" 
Import "libjpeg/jcparam.c" 
Import "libjpeg/jcphuff.c" 
Import "libjpeg/jcprepct.c" 
Import "libjpeg/jcsample.c" 
Import "libjpeg/jctrans.c" 
Import "libjpeg/jdapimin.c" 
Import "libjpeg/jdapistd.c" 
Import "libjpeg/jdatadst.c" 
Import "libjpeg/jdatasrc.c" 
Import "libjpeg/jdcoefct.c" 
Import "libjpeg/jdcolor.c" 
Import "libjpeg/jddctmgr.c" 
Import "libjpeg/jdhuff.c" 
Import "libjpeg/jdinput.c" 
Import "libjpeg/jdmainct.c" 
Import "libjpeg/jdmarker.c" 
Import "libjpeg/jdmaster.c" 
Import "libjpeg/jdmerge.c" 
Import "libjpeg/jdphuff.c" 
Import "libjpeg/jdpostct.c" 
Import "libjpeg/jdsample.c" 
Import "libjpeg/jdtrans.c" 
Import "libjpeg/jerror.c" 
Import "libjpeg/jfdctflt.c" 
Import "libjpeg/jfdctfst.c" 
Import "libjpeg/jfdctint.c" 
Import "libjpeg/jidctflt.c" 
Import "libjpeg/jidctfst.c" 
Import "libjpeg/jidctint.c" 
Import "libjpeg/jidctred.c" 
Import "libjpeg/jmemmgr.c" 
Import "libjpeg/jmemnobs.c" 
Import "libjpeg/jquant1.c" 
Import "libjpeg/jquant2.c" 
Import "libjpeg/jutils.c" 
Import "libjpeg/loadjpeg.c"

Extern

	Function loadjpg:Int(stream:Object,readfunc:Byte Ptr,width:Int Var,height:Int Var,depth:Int Var,pix:Byte Ptr Var)="int loadjpg(void *,void *,int *,int *,int *,char **)"
	Function savejpg:Int(stream:Object,writefunc:Byte Ptr,width:Int,height:Int,pitch:Int,pix:Byte Ptr,quality:Int)="int savejpg(void *,void *,int ,int ,int ,char *,int)"

End Extern
