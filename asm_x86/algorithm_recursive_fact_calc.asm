;阶乘计算
;创建：wizout@2017/10/23
;修改：wizout@2017/10/23

data segment
	NUMBER db 5					;计算5!
	RESULT db ?					;存放计算结果
data ends

stack1 segment stack
	db 100 dup(?)				;栈
stack1 ends

code segment
assume cs:code, ds:data;, ss:stack
main:
	mov ax, data
	mov ds, ax
	
	xor ax, ax					;ax=0
	mov al, NUMBER				;al=NUMBER
	call FACT
	mov RESULT, al				;RESULT=al
	
	mov ah, 4ch
	int 21h						;exit()
;下述汇编代码段穿插有c语言语句注释
;ax存放计算结果，bx存放1,2,3,...，dx没啥用
FACT proc near
;int fact(int ax)
;{
	push ax
	push bp
	mov bp, sp
	;if(ax>0)
	cmp ax, 0
	jle GO
	;	return ax * fact(ax - 1);
	dec ax
	call FACT
	mov bx, word ptr[bp+2]
	mul bx
	pop bp
	pop dx
	ret
GO:
	;else
	;	return 1;
	pop bp
	pop ax
	mov ax, 1
	ret
;}
FACT endp

code ends
end main