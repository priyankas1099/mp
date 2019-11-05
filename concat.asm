data segment
msg1 db 0dh,0ah, "Enter the string: $"
msg2 db 0dh,0ah, "The concatenated string is: $"
len1 db ?
len2 db ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

mov si,1000h
mov cx,0000h

string1:
mov ah,01h
int 21h
cmp al,0Dh
jz label1
mov [si],al
inc si
inc cx
jmp string1
label1:mov len1,cl

mov dx,offset msg1
mov ah,09h
int 21h

mov cx,0000h
string2:
mov ah,01h
int 21h
cmp al,0Dh
jz label2
mov [si],al
inc si
inc cx
jmp string2
label2:mov len2,cl

mov al,len1
mov cl,len2
add cl,al
mov si,1000h

mov dx,offset msg2
mov ah,09h
int 21h
print:
mov dx,[si]
mov ah,02h
int 21h
inc si
loop print

mov ah,4ch
int 21h

code ends
end start


