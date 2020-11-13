assume cs:code,ds:data
data segment
	db 'welcome to masm!'
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov ax,0b882h
	mov es,ax
	mov bx,0
	mov di,0			;di存储要显示的字母
	mov si,71h			;si存储颜色信息
	mov cx,10h			;显示字符数量
	lo:
	mov dx,bx			;dx保存bx原始数值
	mov di,ds:[bx]		;取得字母
	add bx,bx			;bx=bx*2
	
	mov es:[bx+60],di	;写入字母
	mov es:[bx+61],si	;写入颜色（蓝底白色）
	
	mov ax,0b878h
	mov es,ax
	mov si,24h
	mov es:[bx+60],di	;写入字母
	mov es:[bx+61],si	;写入颜色	

	mov ax,0b86eh
	mov es,ax
	mov si,82h
	mov es:[bx+60],di	;写入字母
	mov es:[bx+61],si	;写入颜色
	
	mov ax,0b882h
	mov es,ax
	mov si,71h
	mov bx,dx			;恢复原始bx值
	inc bx				;bx自增
	loop lo
	mov ax,4c00h
	int 21h
code ends
end start
;11001010b
;绿色：10000010b,2h
;绿底红色：00100100b,24h
;白底蓝色：01110001b,71h