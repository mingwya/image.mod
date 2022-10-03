#include "lcms2_plugin.h"

#include "brl.mod/blitz.mod/blitz.h"

extern BBUINT image_cms_common_TCmsIoHandler__Read(BBObject * handler, void * buffer, BBUINT size, BBUINT count);
extern BBINT image_cms_common_TCmsIoHandler__Seek(BBObject * handler, BBUINT offset);
extern BBINT image_cms_common_TCmsIoHandler__Close(BBObject * handler);
extern BBUINT image_cms_common_TCmsIoHandler__Tell(BBObject * handler);
extern BBINT image_cms_common_TCmsIoHandler__Write(BBObject * handler, BBUINT size, void * buffer);


static cmsUInt32Number cms_read(cmsIOHANDLER* iohandler, void *buffer, cmsUInt32Number size, cmsUInt32Number count) {
    return image_cms_common_TCmsIoHandler__Read((BBObject*)iohandler->stream, buffer, size, count);
}

static cmsBool cms_seek(cmsIOHANDLER* iohandler, cmsUInt32Number offset) {
    return image_cms_common_TCmsIoHandler__Seek((BBObject*)iohandler->stream, offset);
}

static cmsBool cms_close(cmsIOHANDLER* iohandler) {
    return image_cms_common_TCmsIoHandler__Close((BBObject*)iohandler->stream);
}

static cmsUInt32Number cms_tell(cmsIOHANDLER* iohandler) {
    return image_cms_common_TCmsIoHandler__Tell((BBObject*)iohandler->stream);
}

static cmsBool cms_write(cmsIOHANDLER* iohandler, cmsUInt32Number size, const void* buffer) {
    return image_cms_common_TCmsIoHandler__Write((BBObject*)iohandler->stream, size, buffer);
}

cmsIOHANDLER * bmx_create_cmsiohandler(BBObject * handler) {

    cmsIOHANDLER * iohandler = (cmsIOHANDLER*) _cmsMallocZero(NULL, sizeof(cmsIOHANDLER));

    iohandler->stream = (void*)handler;

    iohandler->Read = cms_read;
    iohandler->Seek = cms_seek;
    iohandler->Close = cms_close;
    iohandler->Tell = cms_tell;
    iohandler->Write = cms_write;

    return iohandler;
}
