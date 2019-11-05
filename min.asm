Data segment
msg1 db 0dh,0ah, "Enter the length of the array: $"
msg2 db 0dh,0ah, "Enter the elements of the array: $"
msg3 db 0dh,0ah, "The minimum number is: $"
min db ?
len db ?
Data ends

Code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h
call input
mov bl,al
rol bl,04h
call input
add bl,al
mov len,bl

mov cl,len
mov si,1000h
arrayinput:
mov dx,offset msg2
mov ah,09h
int 21h
call input
mov [si],al
inc si
loop arrayinput

mov si,1000h
mov bl,[si]
mov min,bl
mov cl,len
findmin:
mov bl,[si]
mov al,min
cmp bl,al
jc label1
mov min,al
jmp label2
label1:mov min,bl
label2:inc si
loop findmin

mov bl,min
mov dx,offset msg3
mov ah,09h
int 21h
call output

input proc
mov ah,01h
int 21h
cmp al,41h
jc label3
sub al,07h
label3:sub al,30h
ret
endp

output proc
cmp bl,41h
jc label4
add bl,07h
label4: add bl,30h
mov dl,bl
mov ah,02h
int 21h
ret
endp

code ends
end start
