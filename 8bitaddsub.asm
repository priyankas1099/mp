data segment
msg1 db 10,13, "Enter your choice: $"
msg2 db 10,13, "1.Addition $"
msg3 db 10,13, "2.Subtraction $"
msg4 db 10,13, "3.Exit $"
msg5 db 10,13, "Enter the first number: $"
msg6 db 10,13, "Enter the second number: $"
msg7 db 10,13, "The result is: $"
msg8 db 10,13, "$"
result db ?
choice db ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

menu:
mov dx,offset msg1
mov ah,09h
int 21h
mov dx,offset msg2
mov ah,09h
int 21h
mov dx,offset msg3
mov ah,09h
int 21h
mov dx,offset msg4
mov ah,09h
int 21h
mov dx,offset msg8
mov ah,09h
int 21h

takechoice:
call input
mov bl,al
rol bl,04h
call input
add bl,al
mov choice,bl

check_exit:
cmp bl,03h
jnz addition
exit:
mov ah,4ch
int 21h

addition:
mov bl,choice
cmp bl,01h
jnz subtraction

;inputting numbers
mov dx,offset msg5 ;1st number
mov ah,09h
int 21h
call input
mov bl,al
rol bl,04h
call input
add bl,al

mov dx,offset msg6 ;second number
mov ah,09h
int 21h
call input
mov cl,al
rol cl,04h
call input
add cl,al

add bl,cl
mov result,bl

;displaying result
mov dx,offset msg7
mov ah,09h
int 21h
and bl,0F0h
ror bl,04h
call output
mov bl,result
and bl,0Fh
call output
jmp menu

subtraction:
mov bl,choice
cmp bl,02h
jnz exit

;inputting numbers
mov dx,offset msg5 ;1st number
mov ah,09h
int 21h
call input
mov bl,al
rol bl,04h
call input
add bl,al

mov dx,offset msg6 ;second number
mov ah,09h
int 21h
call input
mov cl,al
rol cl,04h
call input
add cl,al

sub bl,cl
mov result,bl

;displaying result
mov dx,offset msg7
mov ah,09h
int 21h
and bl,0F0h
ror bl,04h
call output
mov bl,result
and bl,0Fh
call output
jmp menu

input proc
mov ah,01h
int 21h
cmp al,41h
jc label1
sub al,07h
label1:sub al,30h
ret
endp

output proc
cmp bl,41h
jc label2
add bl,07h
label2:add bl,30h
mov dl,bl
mov ah,02h
int 21h
ret
endp

code ends
end start