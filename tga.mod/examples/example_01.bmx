SuperStrict

Framework SDL.SDLRenderMax2D
Import Image.TGA

Local w:Int = DesktopWidth() * .75
Local h:Int = DeskTopHeight() * .75

Graphics w, h, 0

AutoMidHandle(True)

Local img:TImage = LoadImage("earth.tga")

If Not img Then
	Throw "Failed to load image"
End If

While Not KeyDown(Key_ESCAPE)

	Cls

	DrawImage img, w / 2, h / 2

	Flip

Wend
