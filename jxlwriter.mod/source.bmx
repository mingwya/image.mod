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

Import "../jxl.mod/libjxl/*.h"
Import "../jxl.mod/libjxl/lib/include/*.h"
Import "../jxl.mod/highway/*.h"
Import "../jxl.mod/brotli/c/include/*.h"
Import "../cms.mod/libcms2/include/*.h"

Import "../jxl.mod/libjxl/lib/jxl/butteraugli/butteraugli.cc"
Import "../jxl.mod/libjxl/lib/jxl/butteraugli_wrapper.cc"

Import "../jxl.mod/libjxl/lib/jxl/enc_ac_strategy.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_adaptive_quantization.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_ans.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_ar_control_field.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_butteraugli_comparator.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_butteraugli_pnorm.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_cache.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_chroma_from_luma.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_cluster.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_coeff_order.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_color_management.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_comparator.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_context_map.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_detect_dots.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_dot_dictionary.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_entropy_coder.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_external_image.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_fast_heuristics.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_file.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_frame.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_group.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_heuristics.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_huffman.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_icc_codec.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_image_bundle.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_modular.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_noise.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_patch_dictionary.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_photon_noise.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_quant_weights.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_splines.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_toc.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_transforms.cc"
Import "../jxl.mod/libjxl/lib/jxl/enc_xyb.cc"
Import "../jxl.mod/libjxl/lib/jxl/encode.cc"
Import "../jxl.mod/libjxl/lib/jxl/gaborish.cc"
Import "../jxl.mod/libjxl/lib/jxl/huffman_tree.cc"
Import "../jxl.mod/libjxl/lib/jxl/jpeg/enc_jpeg_data.cc"
Import "../jxl.mod/libjxl/lib/jxl/jpeg/enc_jpeg_data_reader.cc"
Import "../jxl.mod/libjxl/lib/jxl/jpeg/enc_jpeg_huffman_decode.cc"
Import "../jxl.mod/libjxl/lib/jxl/linalg.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/encoding/enc_debug_tree.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/encoding/enc_encoding.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/encoding/enc_ma.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/transform/enc_palette.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/transform/enc_rct.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/transform/enc_squeeze.cc"
Import "../jxl.mod/libjxl/lib/jxl/modular/transform/enc_transform.cc"
Import "../jxl.mod/libjxl/lib/jxl/optimize.cc"
Import "../jxl.mod/libjxl/lib/jxl/progressive_split.cc"

Import "../jxl.mod/brotli/c/enc/backward_references.c"
Import "../jxl.mod/brotli/c/enc/backward_references_hq.c"
Import "../jxl.mod/brotli/c/enc/bit_cost.c"
Import "../jxl.mod/brotli/c/enc/block_splitter.c"
Import "../jxl.mod/brotli/c/enc/brotli_bit_stream.c"
Import "../jxl.mod/brotli/c/enc/cluster.c"
Import "../jxl.mod/brotli/c/enc/command.c"
Import "../jxl.mod/brotli/c/enc/compound_dictionary.c"
Import "../jxl.mod/brotli/c/enc/compress_fragment.c"
Import "../jxl.mod/brotli/c/enc/compress_fragment_two_pass.c"
Import "../jxl.mod/brotli/c/enc/dictionary_hash.c"
Import "../jxl.mod/brotli/c/enc/encode.c"
Import "../jxl.mod/brotli/c/enc/encoder_dict.c"
Import "../jxl.mod/brotli/c/enc/entropy_encode.c"
Import "../jxl.mod/brotli/c/enc/fast_log.c"
Import "../jxl.mod/brotli/c/enc/histogram.c"
Import "../jxl.mod/brotli/c/enc/literal_cost.c"
Import "../jxl.mod/brotli/c/enc/memory.c"
Import "../jxl.mod/brotli/c/enc/metablock.c"
Import "../jxl.mod/brotli/c/enc/static_dict.c"
Import "../jxl.mod/brotli/c/enc/utf8_util.c"

Import "glue.c"
