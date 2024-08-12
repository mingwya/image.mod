SuperStrict

Framework SDL.SDLRenderMax2D
Import Image.SVG

Local w:Int = DesktopWidth() * .75
Local h:Int = DeskTopHeight() * .75

Graphics w, h, 0

AutoMidHandle(True)

Local svg:TSvgImage = TSvgImage.LoadImage("planet.svg")

Local pix:TPixmap = svg.FitPixmap(DesktopWidth(), DesktopHeight())

Local img:TImage = LoadImage(pix)


If Not img Then
	Throw "Failed to load image"
End If

Local image:Int

Local scale:Float = 0.5

While Not KeyDown(Key_ESCAPE)

	Cls

	If KeyDown(Key_UP) Then
		scale = Min(1, scale + 0.01)
	End If

	If KeyDown(Key_DOWN) Then
		scale = Max(0.1, scale - 0.01)
	End If

	SetScale scale, scale
	DrawImage img, w / 2, h / 2

	Flip

Wend
