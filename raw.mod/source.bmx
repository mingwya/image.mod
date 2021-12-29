' Copyright (c) 2021 Bruce A Henderson
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

Import "libraw/*.h"

Import "libraw/src/libraw_c_api.cpp"
Import "libraw/src/libraw_datastream.cpp"
Import "libraw/src/decoders/canon_600.cpp"
Import "libraw/src/decoders/crx.cpp"
Import "libraw/src/decoders/decoders_dcraw.cpp"
Import "libraw/src/decoders/decoders_libraw_dcrdefs.cpp"
Import "libraw/src/decoders/decoders_libraw.cpp"
Import "libraw/src/decoders/dng.cpp"
Import "libraw/src/decoders/fp_dng.cpp"
Import "libraw/src/decoders/fuji_compressed.cpp"
Import "libraw/src/decoders/generic.cpp"
Import "libraw/src/decoders/kodak_decoders.cpp"
Import "libraw/src/decoders/load_mfbacks.cpp"
Import "libraw/src/decoders/smal.cpp"
Import "libraw/src/decoders/unpack_thumb.cpp"
Import "libraw/src/decoders/unpack.cpp"
Import "libraw/src/demosaic/aahd_demosaic.cpp"
Import "libraw/src/demosaic/ahd_demosaic.cpp"
Import "libraw/src/demosaic/dcb_demosaic.cpp"
Import "libraw/src/demosaic/dht_demosaic.cpp"
Import "libraw/src/demosaic/misc_demosaic.cpp"
Import "libraw/src/demosaic/xtrans_demosaic.cpp"
Import "libraw/src/integration/dngsdk_glue.cpp"
Import "libraw/src/integration/rawspeed_glue.cpp"
Import "libraw/src/metadata/adobepano.cpp"
Import "libraw/src/metadata/canon.cpp"
Import "libraw/src/metadata/ciff.cpp"
Import "libraw/src/metadata/cr3_parser.cpp"
Import "libraw/src/metadata/epson.cpp"
Import "libraw/src/metadata/exif_gps.cpp"
Import "libraw/src/metadata/fuji.cpp"
Import "libraw/src/metadata/identify_tools.cpp"
Import "libraw/src/metadata/identify.cpp"
Import "libraw/src/metadata/kodak.cpp"
Import "libraw/src/metadata/leica.cpp"
Import "libraw/src/metadata/makernotes.cpp"
Import "libraw/src/metadata/mediumformat.cpp"
Import "libraw/src/metadata/minolta.cpp"
Import "libraw/src/metadata/misc_parsers.cpp"
Import "libraw/src/metadata/nikon.cpp"
Import "libraw/src/metadata/hasselblad_model.cpp"
Import "libraw/src/metadata/normalize_model.cpp"
Import "libraw/src/metadata/olympus.cpp"
Import "libraw/src/metadata/p1.cpp"
Import "libraw/src/metadata/pentax.cpp"
Import "libraw/src/metadata/samsung.cpp"
Import "libraw/src/metadata/sony.cpp"
Import "libraw/src/metadata/tiff.cpp"
Import "libraw/src/postprocessing/aspect_ratio.cpp"
Import "libraw/src/postprocessing/dcraw_process.cpp"
Import "libraw/src/postprocessing/mem_image.cpp"
Import "libraw/src/postprocessing/postprocessing_aux.cpp"
Import "libraw/src/postprocessing/postprocessing_utils_dcrdefs.cpp"
Import "libraw/src/postprocessing/postprocessing_utils.cpp"
Import "libraw/src/preprocessing/raw2image.cpp"
Import "libraw/src/preprocessing/ext_preprocess.cpp"
Import "libraw/src/preprocessing/subtract_black.cpp"
Import "libraw/src/tables/cameralist.cpp"
Import "libraw/src/tables/colorconst.cpp"
Import "libraw/src/tables/colordata.cpp"
Import "libraw/src/tables/wblists.cpp"
Import "libraw/src/utils/curves.cpp"
Import "libraw/src/utils/decoder_info.cpp"
Import "libraw/src/utils/init_close_utils.cpp"
Import "libraw/src/utils/open.cpp"
Import "libraw/src/utils/phaseone_processing.cpp"
Import "libraw/src/utils/read_utils.cpp"
Import "libraw/src/utils/thumb_utils.cpp"
Import "libraw/src/utils/utils_dcraw.cpp"
Import "libraw/src/utils/utils_libraw.cpp"
Import "libraw/src/write/apply_profile.cpp"
Import "libraw/src/write/file_write.cpp"
Import "libraw/src/write/tiff_writer.cpp"
Import "libraw/src/x3f/x3f_parse_process.cpp"
Import "libraw/src/x3f/x3f_utils_patched.cpp"

Import "glue.cpp"
