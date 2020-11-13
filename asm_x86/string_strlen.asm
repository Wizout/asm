data segment
	STRING db 'Harbin Institude of Technology, Weihai'
	STRLEN db equ $ - STRING
data ends

code segment
assume cs:code, ds:data
main:
		mov ax, data
		mov ds, ax
		xor ax, ax
		mov al, STREND - STRING
		;shr al, 1
		;8位十六进制转十进制 开始
		
		;8位十六进制转十进制 结束
		mov STRLEN, al
		
		mov ax, 4c00h
		int 21h
code ends
end main