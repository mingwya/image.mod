SuperStrict

?win32
Framework SDL.d3d9sdlmax2d
?Not win32
Framework SDL.gl2sdlmax2d
?
Import Image.Raw
Import BRL.Standardio

Local pix:TPixmap = LoadPixmap("gh2.rw2")

If pix Then
	Print pix.width + ", " + pix.height
Else
	Print "Unable to load file"
	End
End If

Graphics 1024, 768, 0

local resized:TPixmap = ResizePixmap(pix, 1024, 768)
Local img:TImage = LoadImage( resized )

While Not KeyDown(KEY_ESCAPE)
	Cls

	if img Then
		DrawImage img, 0, 0
	End If


	Flip
Wend
