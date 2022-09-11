/*
 Copyright (c) 2022 Bruce A Henderson

 This software is provided 'as-is', without any express or implied
 warranty. In no event will the authors be held liable for any damages
 arising from the use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
*/
#include "tiffiop.h"
#include "brl.mod/blitz.mod/blitz.h"

extern BBULONG image_tiff__stream_seek(BBObject * stream, BBLONG pos, int whence);
extern int image_tiff__stream_read(BBObject * stream, void * buf, size_t count);
extern void image_tiff__stream_close(BBObject * stream);
extern BBLONG image_tiff__stream_size(BBObject * stream);

static tmsize_t bmx_readProc(thandle_t handle, void *buf, tmsize_t size) {
	return image_tiff__stream_read((BBObject*)handle, buf, size);
}

static tmsize_t bmx_writeProc(thandle_t handle, void *buf, tmsize_t size) {
	return 0;
}

static toff_t bmx_seekProc(thandle_t handle, toff_t off, int whence) {
    return image_tiff__stream_seek((BBObject*)handle, off, whence);
}

static int bmx_closeProc(thandle_t handle) {
    image_tiff__stream_close((BBObject*)handle);
	return 0;
}

static toff_t bmx_sizeProc(thandle_t handle) {
    return image_tiff__stream_size((BBObject*)handle);
}

static int bmx_mapProc(thandle_t handle, void** base, toff_t* size) {
	return 0;
}

static void bmx_unmapProc(thandle_t handle, void* base, toff_t size) {
}

TIFF * bmx_tiff_clientOpen(BBObject * stream) {
    return TIFFClientOpen("image.tif", "r", stream, bmx_readProc, bmx_writeProc, bmx_seekProc, bmx_closeProc, bmx_sizeProc, bmx_mapProc, bmx_unmapProc);
}

void bmx_tiff_dimensions(TIFF * tiff, BBUINT * width, BBUINT * height) {
    TIFFGetField(tiff, TIFFTAG_IMAGEWIDTH, width);
	TIFFGetField(tiff, TIFFTAG_IMAGELENGTH, height);
}

int bmx_tiff_readRGBAImage(TIFF * tiff, BBUINT width, BBUINT height, void * pixels, int stopOnError) {
    return TIFFReadRGBAImageOriented(tiff, width, height, pixels, ORIENTATION_TOPLEFT, stopOnError);
}

void bmx_tiff_close(TIFF * tiff) {
    TIFFClose(tiff);
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void * _TIFFmalloc(tmsize_t s) {
	return malloc(s);
}

void * _TIFFcalloc(tmsize_t nmemb, tmsize_t siz) {
	if (nmemb == 0 || siz == 0) {
		return ((void *)NULL);
	}
	return calloc((size_t)nmemb, (size_t)siz);
}

void * _TIFFrealloc(void * p, tmsize_t s) {
	return realloc(p, s);
}

void _TIFFmemset(void * p, int v, tmsize_t c) {
	memset(p, v, (size_t)c);
}

void _TIFFmemcpy(void * d, const void * s, tmsize_t c) {
	memcpy(d, s, (size_t)c);
}

int _TIFFmemcmp(const void * p1, const void * p2, tmsize_t c) {
	return (memcmp(p1, p2, (size_t)c));
}

void _TIFFfree(void *p) {
	free(p);
}

static void bmx_tiff_handler(const char* module, const char* fmt, va_list ap) {
    //printf(fmt, ap);fflush(stdout);
}

TIFFErrorHandler _TIFFwarningHandler = bmx_tiff_handler;
TIFFErrorHandler _TIFFerrorHandler = bmx_tiff_handler;
