data segment
	STR1 db 'Welcome to Hit.'
	STRNAY db 'NOT FOUND', 0dh, 0ah, '$'
	STRYEA db 'FOUND', 0dh, 0ah, '$'
data ends
stack segment STACK 'STACK'
	db 100 dup(?)
stack ends
code segment
assume cs:code, ds:data, ss:stack
main:
	mov ax, data
	mov es, ax
	mov di, offset STR1
	mov ax, 'a'
	mov cx, 0fh
	repnz scasb
	jz FOUND
NOTFOUND:
	clc
	mov dx, offset STRNAY
	jmp DISPLAY
FOUND:
	stc
	mov dx, offset STRYEA
DISPLAY:
	mov ax, data
	mov ds, ax
	mov ah, 09h
	int 21h
EXIT:
	mov ah, 4ch
	int 21h
code ends
end main