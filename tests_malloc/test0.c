
#include <stdio.h>

int main()
{
	int i = 0;

	printf("sizeof(void*) = %zu\n", sizeof(void*));
	while (i < 1024)
	{
		i++;
	}
	return (0);
}
