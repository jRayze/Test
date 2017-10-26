#include <stdio.h>
#include "../get_next_line/get_next_line.h"

/*
int		main(int argc, char **argv)
{
	int		i;
	int		fd;
	char	*line;
	int		j;

	j = 0;
	if (argc < 2)
	{
		printf("Error !\n");
		return (0);
	}
	i = 1;
	while (i < argc)
	{
		fd = open(argv[i], O_RDONLY);
		if (fd <= 0)
			return (-1);
		while ((j = get_next_line(fd, &line)) > 0)
			printf("return : %d\nline %d = %s\n", j,  i++, line);
		j = get_next_line(fd, &line);
		printf("return : %d\nline %d = %s\n", j, i, line);
	}
	return (0);
}*/

int main(void)
{
	char	*line;
	int	out;
	int	p[2];
	char*str;
	int	len =50;

	str = (char *)malloc(1000 * 1000);
	*str = '\0';
	while (len--)
		strcat(str, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in leo dignissim, gravida leo id, imperdiet urna. Aliquam magna nunc, maximus quis eleifend et, scelerisque non dolor. Suspendisse augue augue, tempus");
	out = dup(1);
	pipe(p);
	dup2(p[1], 1);
	if (str)
		write(1, str, strlen(str));
	close(p[1]);
	dup2(out, 1);
	get_next_line(p[0], &line);
	ft_putstr(str);
	ft_putstr(line);
	ft_putchar('\n');
	ft_putstr("Strcmp(str, line) =");
	ft_putnbr(strcmp(line, str));
	get_next_line(p[0], &line);
	ft_putstr(str);
	ft_putstr("fini\n");
	return (0);
}
