/*
 Copyright (c) 2024 Bruce A Henderson
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/
#include "lunasvg.h"

class MaxDocument
{
    public:
    MaxDocument(std::unique_ptr<lunasvg::Document> document ) : document(std::move(document)) {}

    double width() const { return document->width(); }
    double height() const { return document->height(); }
    void render(lunasvg::Bitmap & bitmap) const { document->render(bitmap); }
    void render(lunasvg::Bitmap & bitmap, lunasvg::Matrix & matrix) const { document->render(bitmap, matrix); }

    lunasvg::DomElement rootElement() const { return document->rootElement(); }
    void updateLayout() { document->updateLayout(); }

    private:
    std::unique_ptr<lunasvg::Document> document;

};

extern "C" {

    MaxDocument * bmx_svg_loadFromData(void * data, int length);
    void bmx_svg_free(MaxDocument * doc);

    double bmx_svg_width(MaxDocument * doc);
	double bmx_svg_height(MaxDocument * doc);
    void bmx_svg_renderToPixmap(MaxDocument * doc, std::uint8_t * pixels, int width, int height, int pitch);
    void bmx_svg_setDimensions(MaxDocument * doc, double width, double height);
}

MaxDocument * bmx_svg_loadFromData(void * data, int length) {
    auto document = lunasvg::Document::loadFromData(static_cast<const char*>(data), length);
    if (document) {
        return new MaxDocument(std::move(document));
    }
    return nullptr;
}

double bmx_svg_width(MaxDocument * doc) {
    return doc->width();
}

double bmx_svg_height(MaxDocument * doc) {
    return doc->height();
}

void bmx_svg_renderToPixmap(MaxDocument * doc, std::uint8_t * pixels, int width, int height, int pitch) {
    lunasvg::Bitmap bitmap(pixels, width, height, pitch);
    lunasvg::Matrix matrix(width / doc->width(), 0, 0, height / doc->height(), 0, 0);
    doc->render(bitmap, matrix);
    bitmap.convertToRGBA();
}

void bmx_svg_free(MaxDocument * doc) {
    delete doc;
}

void bmx_svg_setDimensions(MaxDocument * doc, double width, double height) {
    auto root = doc->rootElement();
    root.setAttribute("width", std::to_string(width));
    root.setAttribute("height", std::to_string(height));

    doc->updateLayout();
}
