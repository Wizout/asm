;***************************************************
;��һ��ˮƽ�ߣ�BIOS���ܵ���10h��0C ��
;***************************************************
code segment 
	assume cs:code,ds:code,ss:code
start:

;����ͼ�η�ʽ
	mov ah,0
	mov al,12h
	int 10h	

;�������ص�������
	mov dx,200	;��
	mov cx,250	;��

;��һ��ˮƽ�ߣ����Ϊ50�����ص㣩
draw:	mov bh,0		;������ʾҳ
	mov al,2		;��ɫ��00000010��
	mov ah,0ch	;���ܺ�
	int 10h		;BIOS���ܵ���
	inc cx
	cmp cx,400
	jnz draw

	mov ah,01h	;�ȴ���������
	int 21h		;DOS���ܵ���

	mov ax,4c00h
	int 21h		;DOS���ܵ���

;**************************************************
code ends
end start                