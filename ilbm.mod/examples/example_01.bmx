SuperStrict

Framework SDL.SDLRenderMax2D
Import Image.ILBM

Local w:Int = DesktopWidth() * .75
Local h:Int = DeskTopHeight() * .75

Graphics w, h, 0

AutoMidHandle(True)

Local img1:TImage = Loader("Kickstart11.iff", w, h)
Local img2:TImage = Loader("PLANE02.RGB", w, h)

If Not img1 Or Not img2 Then
	Throw "Failed to load image"
End If

Local image:Int
Local img:TImage = img1

While Not KeyDown(Key_ESCAPE)

	Cls

	If KeyHit(KEY_SPACE) Then
		image = Not image
		If image Then
			img = img2
		Else
			img = img1
		End If
	End If

	DrawImage img, w / 2, h / 2

	Flip

Wend

Function Loader:TImage(path:String, maxWidth:Int, maxHeight:Int)
	Local pix:TPixmap = LoadPixmap( path )
	If pix Then
		If pix.width > maxWidth Or pix.height > maxHeight Then
			Local ratio:Float = Min(maxWidth / Float(pix.width), maxHeight / Float(pix.height))
			pix = ResizePixmap(pix, Int(pix.width * ratio), Int(pix.height * ratio))
		End If
		Return LoadImage(pix)
	End If
End Function

