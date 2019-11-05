#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
void main()
{
	int len=0,c=0,arr[100],sum=0,var=0;
	float avg=0;
	printf("\nHow many elements ?\n");
	scanf("%d",&len);
	for(c=0;c<len;c++)
	{
		printf("\nEnter the number:\t");
		scanf("%d",&arr[c]);
	}
	c=0;
	asm mov cx,len;
	find:
	var=arr[c];
	asm mov ax,var
	asm add sum,ax
	asm inc c
	asm loop find
	avg=sum/len;
	printf("Average: %f",avg);
}
	