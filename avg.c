#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
void main()
{
	int len=0,i=0,arr[100],sum=0,var=0;
	float avg=0;
	printf("\nHow many elements ?\n");
	scanf("%d",&len);
	for(i=0;i<len;i++)
	{
		printf("\nEnter the number:\t");
		scanf("%d",&arr[i]);
	}
	i=0;
	asm mov cx,len;
	find:
	var=arr[i];
	asm mov ax,var
	asm add sum,ax
	asm inc i
	asm loop find
	avg=sum/len;
	printf("Average: %f",avg);
}
	
