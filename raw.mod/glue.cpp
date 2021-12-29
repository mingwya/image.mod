/*
 Copyright (c) 2021 Bruce A Henderson

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
#include "libraw/libraw.h"

#include "brl.mod/blitz.mod/blitz.h"

extern "C" {
    int image_raw__stream_seek(BBObject *stream, BBInt64 offset, int origin);
    int image_raw__stream_read(BBObject *stream, void * buf, size_t count);
    BBInt64 image_raw__stream_tell(BBObject *stream);
    BBInt64 image_raw__stream_size(BBObject *stream);
    int image_raw__stream_eof(BBObject * stream);

    BBObject * image_raw_TRawImage__NewPixmap(BBINT width,BBINT height);
    void * image_raw_TRawImage__PixmapPtr(BBObject * pix);
    void image_raw_TRawImage__PixmapVar(BBObject* bbt_pix, void** pixels,BBINT* pitch);

    BBObject * bmx_image_raw_load(libraw_data_t *lr, BBObject * stream);
}

class LibRaw_Max_datastream : public LibRaw_abstract_datastream
{
private: 

    BBObject * stream;

public:

    LibRaw_Max_datastream(BBObject * _stream) : stream(_stream) {}

	~LibRaw_Max_datastream() {
	}

    int valid()
    {
        return stream != 0 && stream != &bbNullObject;
    }

    int read(void *buffer, size_t size, size_t count)
    {
        return image_raw__stream_read(stream, buffer, size * count);
    }

    int seek(INT64 offset, int origin)
    {
        return image_raw__stream_seek(stream, offset, origin);
    }

    INT64 tell()
    {
        return image_raw__stream_tell(stream);
    }

    INT64 size()
    {
        return image_raw__stream_size(stream);
    }

    int get_char()
    {
        unsigned char c;
        int r = read(&c, 1, 1);
        return r > 0 ? c : r;
    }

    char *gets(char *buffer, int length)
    {
        memset(buffer, 0, length);
		for (int i = 0; i < length; i++) {
			if (!read(&buffer[i], 1, 1)) {
				return NULL;
            }
			if (buffer[i] == 10) {
				break;
            }
		}
		return buffer;
    }

    int scanf_one(const char *fmt, void* val)
    {
        std::string buf;
		char c = 0;
		do {
			if (read(&c, 1, 1) == 1) {
                if ( c == '0' || c == '\n' || c == ' ' || c == '\t') {
                    break;
                }
				buf.append(&c, 1);
			} else {
				return 0;
			}
		} while(true);

		return sscanf(buf.c_str(), fmt, val);
    }

    int eof()
    {
        return image_raw__stream_eof(stream);
    }
};

// --------------------------------------------------------

BBObject * bmx_image_raw_load(libraw_data_t *lr, BBObject * stream) {

    BBObject * pixmap = &bbNullObject;

    LibRaw *ip = (LibRaw *)lr->parent_class;
    LibRaw_Max_datastream datastream(stream);

    ip->imgdata.rawparams.shot_select = 0;
	ip->imgdata.params.use_camera_wb = 1;
	ip->imgdata.params.use_camera_matrix = 1;
	ip->imgdata.params.half_size = 0;

    if (ip->open_datastream(&datastream) != LIBRAW_SUCCESS) {
        return pixmap;
    }

    ip->imgdata.params.output_bps = 8;
    ip->imgdata.params.gamm[0] = 1/2.222;
	ip->imgdata.params.gamm[1] = 4.5;
    ip->imgdata.params.no_auto_bright = 1;
    ip->imgdata.params.use_auto_wb = 1;
    ip->imgdata.params.user_qual = 3;

    if (ip->unpack() != LIBRAW_SUCCESS) {
        return pixmap;
    }

    if (ip->dcraw_process() != LIBRAW_SUCCESS) {
        return pixmap;
    }

    int width, height, cols, bpp;
    ip->get_mem_image_format(&width, &height, &cols, &bpp);

    pixmap = image_raw_TRawImage__NewPixmap(width, height);
 
    void * ptr;
    int pitch;
    image_raw_TRawImage__PixmapVar(pixmap, &ptr, &pitch);

    if (ip->copy_mem_image(ptr, pitch, 0) != LIBRAW_SUCCESS) {
        return &bbNullObject;
    }

    return pixmap;
}
