SuperStrict

Import Brl.Stream

Import "source.bmx"

Extern
	Function bmx_create_cmsiohandler:Byte Ptr(handler:TCmsIoHandler)
End Extern


Type TCmsIoHandler

	Field ioHandlerPtr:Byte Ptr
	Field stream:TStream

	Method New(stream:TStream)
		Self.stream = stream
		ioHandlerPtr = bmx_create_cmsiohandler(Self)
	End Method

	Function _Read:UInt(handler:TCmsIoHandler, buffer:Byte Ptr, size:UInt, count:UInt) { nomangle }
		Return handler.Read(buffer, size, count)
	End Function

	Function _Seek:Int(handler:TCmsIoHandler, offset:UInt) { nomangle }
		Return handler.Seek(offset)
	End Function

	Function _Close:Int(handler:TCmsIoHandler) { nomangle }
		Return handler.Close()
	End Function

	Function _Tell:UInt(handler:TCmsIoHandler) { nomangle }
		Return handler.Tell()
	End Function

	Function _Write:Int(handler:TCmsIoHandler, size:Uint, buffer:Byte Ptr) { nomangle }
		Return handler.Write(size, buffer)
	End Function


	Method Read:UInt(buffer:Byte Ptr, size:UInt, count:UInt)
		Return stream.Read(buffer, size * count)
	End Method

	Method Seek:Int(offset:UInt)
		Return stream.Seek(offset)
	End Method

	Method Close:Int()
		stream.Close()
	End Method

	Method Tell:UInt()
		Return stream.Pos()
	End Method

	Method Write:Int(size:Uint, buffer:Byte Ptr)
		Return stream.Write(buffer, size)
	End Method

End Type