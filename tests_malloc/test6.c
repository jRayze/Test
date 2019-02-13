#include "../includes/malloc.h"

int main()
{
	char *str;
	unsigned int i;

	i = 0;
	str = (char *)malloc(sizeof(char) * 94);
	while (i < 93)
	{
		str[i] = 33 + i;
		i++;
	}
	str[93] = 0;
	show_alloc_mem_ex();
	return(0);
}
