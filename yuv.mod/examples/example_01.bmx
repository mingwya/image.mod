SuperStrict

Framework SDL.SDLRenderMax2D
Import Image.YUV


Local yuv:Byte[] = LoadByteArray("code_build_play.yuv")
Local width:Int = 1024
Local height:Int = 768


Local pix:TPixmap = CreatePixmap(width, height, PF_RGBA)

Local yuvPtr:Byte Ptr = yuv
ConvertI420ToABGR(yuvPtr, width, yuvPtr + width * height, width / 2, yuvPtr + width * height * 5 / 4, width / 2, pix)

Local img:TImage = LoadImage(pix)

Graphics 1024, 768, 0

While Not KeyHit(KEY_ESCAPE)
	Cls

	DrawImage img, 0, 0

	Flip
Wend
