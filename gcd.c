#include<conio.h>
#include <stdio.h>
void main()
{
	int num1,num2,gcd;
	printf("Enter the first number \n");
	scanf("%d",&num1);
	printf("Enter the second number \n");
	scanf("%d",&num2);
	asm mov ax,num1
	asm mov bx,num2
	find:
	asm cmp ax,bx
	asm jc label1
	asm sub ax,bx
	asm jmp label2
	label1:
	asm sub bx,ax
	label2:
	asm cmp ax,bx
	asm jnz find
	
	asm mov gcd,ax
	printf("\n GCD For two given nos. is : %d",gcd);
}
