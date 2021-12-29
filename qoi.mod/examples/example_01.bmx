SuperStrict

?win32
Framework SDL.d3d9sdlmax2d
?Not win32
Framework SDL.gl2sdlmax2d
?
Import Image.Qoi
Import BRL.Standardio

Local pix:TPixmap = LoadPixmap("kodim23.qoi")

If pix Then
	Print pix.width + ", " + pix.height
Else
	Print "Unable to load file"
	End
End If

Graphics 1024, 768, 0

Local img:TImage = LoadImage( pix )

While Not KeyDown(KEY_ESCAPE)
	Cls

	if img Then
		DrawImage img, 0, 0
	End If


	Flip
Wend
