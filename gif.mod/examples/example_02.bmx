SuperStrict

Framework SDL.SDLRenderMax2D
Import Image.GIF

Local w:Int = DesktopWidth() * .75
Local h:Int = DeskTopHeight() * .75

Graphics w, h, 0

SetClsColor 33, 208, 231
AutoMidHandle(True)

Local img:TImage = TGifImage.LoadImage("animated-dragon-image-0056.gif")
Local count:Int = img.frames.Length
Local frame:Int = 0
Local wait:Int = img.frameDuration[0]
Local last:Int = MilliSecs()

While Not KeyDown(Key_ESCAPE)

	Cls

	DrawImage img, w / 2, h / 2, frame

	Local now:Int = Millisecs()
	If now - last > wait Then
		last = now

		frame :+ 1

		If frame = count Then
			frame = 0
		End If
	
		wait = img.frameDuration[frame]
	End If

	Flip

Wend
