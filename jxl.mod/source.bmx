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

Import "libjxl/*.h"
Import "libjxl/lib/include/*.h"
Import "highway/*.h"
Import "brotli/c/include/*.h"

Import "libjxl/lib/jxl/ac_strategy.cc"
Import "libjxl/lib/jxl/alpha.cc"
Import "libjxl/lib/jxl/ans_common.cc"
Import "libjxl/lib/jxl/aux_out.cc"
Import "libjxl/lib/jxl/base/cache_aligned.cc"
Import "libjxl/lib/jxl/base/data_parallel.cc"
Import "libjxl/lib/jxl/base/padded_bytes.cc"
Import "libjxl/lib/jxl/base/random.cc"
Import "libjxl/lib/jxl/blending.cc"
Import "libjxl/lib/jxl/box_content_decoder.cc"
Import "libjxl/lib/jxl/chroma_from_luma.cc"
Import "libjxl/lib/jxl/coeff_order.cc"
Import "libjxl/lib/jxl/color_encoding_internal.cc"
Import "libjxl/lib/jxl/color_management.cc"
Import "libjxl/lib/jxl/compressed_dc.cc"
Import "libjxl/lib/jxl/convolve.cc"
Import "libjxl/lib/jxl/dct_scales.cc"
Import "libjxl/lib/jxl/dec_ans.cc"
Import "libjxl/lib/jxl/dec_cache.cc"
Import "libjxl/lib/jxl/dec_context_map.cc"
Import "libjxl/lib/jxl/dec_external_image.cc"
Import "libjxl/lib/jxl/dec_frame.cc"
Import "libjxl/lib/jxl/dec_group_border.cc"
Import "libjxl/lib/jxl/dec_group.cc"
Import "libjxl/lib/jxl/dec_huffman.cc"
Import "libjxl/lib/jxl/dec_modular.cc"
Import "libjxl/lib/jxl/dec_noise.cc"
Import "libjxl/lib/jxl/dec_patch_dictionary.cc"
Import "libjxl/lib/jxl/dec_xyb.cc"
Import "libjxl/lib/jxl/decode_to_jpeg.cc"
Import "libjxl/lib/jxl/decode.cc"
Import "libjxl/lib/jxl/enc_bit_writer.cc"
Import "libjxl/lib/jxl/entropy_coder.cc"
Import "libjxl/lib/jxl/epf.cc"
Import "libjxl/lib/jxl/exif.cc"
Import "libjxl/lib/jxl/fast_dct.cc"
Import "libjxl/lib/jxl/fields.cc"
Import "libjxl/lib/jxl/frame_header.cc"
Import "libjxl/lib/jxl/gauss_blur.cc"
Import "libjxl/lib/jxl/headers.cc"
Import "libjxl/lib/jxl/huffman_table.cc"
Import "libjxl/lib/jxl/icc_codec_common.cc"
Import "libjxl/lib/jxl/icc_codec.cc"
Import "libjxl/lib/jxl/image_bundle.cc"
Import "libjxl/lib/jxl/image_metadata.cc"
Import "libjxl/lib/jxl/image.cc"
Import "libjxl/lib/jxl/jpeg/dec_jpeg_data_writer.cc"
Import "libjxl/lib/jxl/jpeg/dec_jpeg_data.cc"
Import "libjxl/lib/jxl/jpeg/jpeg_data.cc"
Import "libjxl/lib/jxl/loop_filter.cc"
Import "libjxl/lib/jxl/luminance.cc"
Import "libjxl/lib/jxl/memory_manager_internal.cc"
Import "libjxl/lib/jxl/modular/encoding/dec_ma.cc"
Import "libjxl/lib/jxl/modular/encoding/encoding.cc"
Import "libjxl/lib/jxl/modular/modular_image.cc"
Import "libjxl/lib/jxl/modular/transform/rct.cc"
Import "libjxl/lib/jxl/modular/transform/squeeze.cc"
Import "libjxl/lib/jxl/modular/transform/transform.cc"
Import "libjxl/lib/jxl/opsin_params.cc"
Import "libjxl/lib/jxl/passes_state.cc"
Import "libjxl/lib/jxl/quant_weights.cc"
Import "libjxl/lib/jxl/quantizer.cc"
Import "libjxl/lib/jxl/render_pipeline/low_memory_render_pipeline.cc"
Import "libjxl/lib/jxl/render_pipeline/render_pipeline.cc"
Import "libjxl/lib/jxl/render_pipeline/simple_render_pipeline.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_blending.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_chroma_upsampling.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_epf.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_from_linear.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_gaborish.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_noise.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_patches.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_splines.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_spot.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_to_linear.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_tone_mapping.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_upsampling.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_write.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_xyb.cc"
Import "libjxl/lib/jxl/render_pipeline/stage_ycbcr.cc"
Import "libjxl/lib/jxl/splines.cc"
Import "libjxl/lib/jxl/toc.cc"
Import "libjxl/lib/threads/resizable_parallel_runner.cc"

Import "highway/hwy/aligned_allocator.cc"
Import "highway/hwy/per_target.cc"
Import "highway/hwy/targets.cc"

Import "brotli/c/common/constants.c"
Import "brotli/c/common/context.c"
Import "brotli/c/common/dictionary.c"
Import "brotli/c/common/platform.c"
Import "brotli/c/common/shared_dictionary.c"
Import "brotli/c/common/transform.c"
Import "brotli/c/dec/bit_reader.c"
Import "brotli/c/dec/decode.c"
Import "brotli/c/dec/huffman.c"
Import "brotli/c/dec/state.c"

Import "glue.c"
