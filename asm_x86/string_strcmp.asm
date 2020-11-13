data segment 
	STRING1 db 'hitwh', '$'
	STRING2 db 'hitsz', '$'
	STRMATCH	db 'MATCH',0dh, 0ah, '$'
	STRNOTMATCH	db 'NO MATCH', 0dh, 0ah, '$'
data ends

code segment
assume cs:code, ds:data
main:
	mov ax, data
	mov ds, ax
	lea ax, STRING1
	lea bx, STRING2
	sub bx, ax			;计算string1长度,bx=bx-ax
	lea dx, STRMATCH
	lea ax, STRING2
	sub dx, ax			;计算string2长度,dx=dx-ax
	cmp bx, dx
	jnz NOTMATCH		;若长度不相等则两个字符串不同
	mov cx, bx
	lea di, STRING1
	lea si, STRING2
SCANSTR:
	mov ah, [di]
	mov al, [si]
	cmp ah, al
	jnz NOTMATCH
	inc di
	inc si
	loop SCANSTR
MATCH:
	lea dx, STRMATCH
	jmp DISP
NOTMATCH:
	lea dx, STRNOTMATCH
DISP:
	mov ah, 09h
	int 21h
EXIT:	
	mov ah, 4ch
	int 21h
code ends
end main
