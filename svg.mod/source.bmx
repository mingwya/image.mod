' Copyright (c) 2024 Bruce A Henderson
' 
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
' 
' The above copyright notice and this permission notice shall be included in
' all copies or substantial portions of the Software.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
' THE SOFTWARE.
'
SuperStrict

Import "lunasvg/include/*.h"
Import "lunasvg/3rdparty/plutovg/*.h"

Import "lunasvg/source/lunasvg.cpp"
Import "lunasvg/source/element.cpp"
Import "lunasvg/source/property.cpp"
Import "lunasvg/source/parser.cpp"
Import "lunasvg/source/layoutcontext.cpp"
Import "lunasvg/source/canvas.cpp"
Import "lunasvg/source/clippathelement.cpp"
Import "lunasvg/source/defselement.cpp"
Import "lunasvg/source/gelement.cpp"
Import "lunasvg/source/geometryelement.cpp"
Import "lunasvg/source/graphicselement.cpp"
Import "lunasvg/source/maskelement.cpp"
Import "lunasvg/source/markerelement.cpp"
Import "lunasvg/source/paintelement.cpp"
Import "lunasvg/source/stopelement.cpp"
Import "lunasvg/source/styledelement.cpp"
Import "lunasvg/source/styleelement.cpp"
Import "lunasvg/source/svgelement.cpp"
Import "lunasvg/source/symbolelement.cpp"
Import "lunasvg/source/useelement.cpp"

Import "lunasvg/3rdparty/plutovg/plutovg.c"
Import "lunasvg/3rdparty/plutovg/plutovg-paint.c"
Import "lunasvg/3rdparty/plutovg/plutovg-geometry.c"
Import "lunasvg/3rdparty/plutovg/plutovg-blend.c"
Import "lunasvg/3rdparty/plutovg/plutovg-rle.c"
Import "lunasvg/3rdparty/plutovg/plutovg-dash.c"
Import "lunasvg/3rdparty/plutovg/plutovg-ft-raster.c"
Import "lunasvg/3rdparty/plutovg/plutovg-ft-stroker.c"
Import "lunasvg/3rdparty/plutovg/plutovg-ft-math.c"

Import "glue.cpp"
