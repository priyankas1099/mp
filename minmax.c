#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
int main()
{
	int c=0,len=0,var=0,min,max,arr[100];
	printf("Enter the length of the array: \n");
	scanf("%d",&len);
	printf("Enter the elements of the array: \n");
	for(c=0;c<len;c++)
	{
		printf("Enter the number: ");
		scanf("%d",&arr[c]);
		printf("\n");
	}
	min=arr[0];
	max=arr[0];
	len=len-1;
	c=0;
	asm mov cx,len;
	find:
	c=c+1;
	var=arr[c];
	asm mov ax,var
	asm cmp ax,min
	asm jnc label1
	asm mov min,ax
	label1:
	asm cmp ax,max
	asm jc label2:
	asm mov max,ax
	label2:
	asm loop find
	printf("\n Minimum Value among numbers is : %d\n",min);
	printf("\n Maximum Value among numbers is : %d\n",max);
	return 0;
}
	