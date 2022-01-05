SuperStrict

Framework SDL.SDLRenderMax2D
Import Image.GIF

Local w:Int = DesktopWidth() * .75
Local h:Int = DeskTopHeight() * .75

Graphics w, h, 0

SetClsColor 33, 208, 231
AutoMidHandle(True)

Local clouds:TAnimatedImage = New TAnimatedImage(TGifImage.LoadImage("clouds.gif"))
Local scale:Float = Max(Float(w) / clouds.image.width, Float(h) / clouds.image.height)
Local dragon:TAnimatedImage = new TAnimatedImage(TGifImage.LoadImage("animated-dragon-image-0056.gif"))

While Not KeyDown(Key_ESCAPE)

	Cls

	SetScale scale, scale
	clouds.Draw(w/2, h/2)
	SetScale 1, 1
	dragon.Draw(w/2, h/2)

	Local now:Int = Millisecs()

	clouds.Update(now)
	dragon.Update(now)

	Flip

Wend

Type TAnimatedImage
	Field image:TImage
	Field frame:Int
	Field last:Int
	Field wait:Int
	Field count:Int
	
	Method New(image:TImage)
		Self.image = image
		wait = image.frameDuration[0]
		count = image.frames.Length
	End Method

	Method Draw(x:Int, y:Int)
		DrawImage image, x, y, frame
	End Method

	Method Update(now:Int)
		If now - last > wait Then
			last = now
			frame :+ 1

			If frame = count Then
				frame = 0
			End If

			wait = image.frameDuration[frame]
		End If	
	End Method
End Type