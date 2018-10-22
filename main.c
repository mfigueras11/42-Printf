#include "ft_printf.h"
#include <stdio.h>
#include <limits.h>
#include <locale.h>

int		main(void)
{
	int a;
	int b;

	//setlocale(LC_ALL, "");
	a = ft_printf("me%C\n", 0x11fffe);
	b = printf("he%C\n", 0x11fffe);
	ft_printf("O:%d M:%d\n", b, a);
	return (0);
}

//sS
