;***************************************************
;画一条水平线（BIOS功能调用10h：0C ）
;***************************************************
code segment 
	assume cs:code,ds:code,ss:code
start:

;设置图形方式
	mov ah,0
	mov al,12h
	int 10h	

;设置像素点行列数
	mov dx,200	;行
	mov cx,250	;列

;画一条水平线（宽度为50个像素点）
draw:	mov bh,0		;设置显示页
	mov al,2		;绿色（00000010）
	mov ah,0ch	;功能号
	int 10h		;BIOS功能调用
	inc cx
	cmp cx,400
	jnz draw

	mov ah,01h	;等待键盘输入
	int 21h		;DOS功能调用

	mov ax,4c00h
	int 21h		;DOS功能调用

;**************************************************
code ends
end start                