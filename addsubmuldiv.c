#include<conio.h>
#include <stdio.h>
void main()
{
	int num1,num2,quotient,rem,choice,result;
	do
	{
		printf("Enter your choice: ");
		printf("1.Addition")
		printf("2.Subtraction");
		printf("3.Multiplication");
		printf("4.Division")
		scanf("%d",&choice);
		printf("Enter the first number");
		scanf("%d",&num1);
		printf("Enter the second number");
		scanf("%d",&num2);
		switch(choice)
		{
			case 1:
				asm mov ax,num1
				asm mov bx,num2
				asm add ax,bx
				mov result,ax
				printf("The addition is: %d",result);
				break;
			case 2:
				asm mov ax,num1
				asm mov bx,num2
				asm sub ax,bx
				mov result,ax
				printf("The subtraction is: %d",result);
				break;
			case 3:
				asm mov ax,num1
				asm mov bx,num2
				asm mul bx
				mov result,ax
				printf("The multiplication is: %d",result);
				break;
			case 4:
				asm mov ax,num1
				asm mov bx,num2
				asm div bx
				mov quotient,ax
				mov rem,dx
				printf("The quotient is is: %d",quotient);
				printf("The remainder is is: %d",rem);
				break;
			case 5:
				default:printf("Invalid choice \n");
				break;
		}
	}while(choice!=5);
}
			}