/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/04 14:47:11 by odhazzar          #+#    #+#             */
/*   Updated: 2020/09/04 21:20:20 by odhazzar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/errno.h>

int	main()
{
	char	dest[500];
	int		ans_int;
	char	*ans_str;
	int		fd;
	char	buff[100];
	ssize_t	ret;

	printf("\n----------ft_strlen--------\n");
	printf("01)standard: %d\n", (int)strlen(""));
	ans_int = ft_strlen("");
	printf("01)      my: %d\n", ans_int);
	printf("02)standard: %d\n", (int)strlen("I think a shell could separately open the terminal for read-only and for write-only, instead of running programs with all 3 standard file descriptors being duplicates of the same read-write file description. (set up with dup2). But that's not how bash (or the terminal emulator that started bash) is designed."));
	ans_int = ft_strlen("I think a shell could separately open the terminal for read-only and for write-only, instead of running programs with all 3 standard file descriptors being duplicates of the same read-write file description. (set up with dup2). But that's not how bash (or the terminal emulator that started bash) is designed.");
	printf("02)      my: %d\n", ans_int);
	
	printf("\n----------ft_strcpy--------\n");
	printf("01)standard: %s\n", strcpy(dest, ""));
	ans_str = ft_strcpy(dest, "");
	printf("01)      my: %s\n", ans_str);
	printf("02)standard: %s\n", strcpy(dest, "qwerty"));
	ans_str = ft_strcpy(dest, "qwerty");
	printf("02)      my: %s\n", ans_str);
	printf("03)standard: %s\n", strcpy(dest, "I think a shell could separately open the terminal for read-only and for write-only, instead of running programs with all 3 standard file descriptors being duplicates of the same read-write file description. (set up with dup2). But that's not how bash (or the terminal emulator that started bash) is designed."));
	ans_str = ft_strcpy(dest, "I think a shell could separately open the terminal for read-only and for write-only, instead of running programs with all 3 standard file descriptors being duplicates of the same read-write file description. (set up with dup2). But that's not how bash (or the terminal emulator that started bash) is designed.");
	printf("03)      my: %s\n", ans_str);

	printf("\n----------ft_strcmp--------\n");
	printf("01)standard: %d\n", strcmp("", ""));
	ans_int = ft_strcmp("", "");
	printf("01)      my: %d\n", ans_int);
	printf("02)standard: %d\n", strcmp("qwerty", "qwerty"));
	ans_int = ft_strcmp("qwerty", "qwerty");
	printf("02)      my: %d\n", ans_int);
	printf("03)standard: %d\n", strcmp("qwerty", ""));
	ans_int = ft_strcmp("qwerty", "");
	printf("03)      my: %d\n", ans_int);
	printf("04)standard: %d\n", strcmp("", "qwerty"));
	ans_int = ft_strcmp("", "qwerty");
	printf("04)      my: %d\n", ans_int);
	printf("05)standard: %d\n", strcmp("qwer", "qwerty"));
	ans_int = ft_strcmp("qwer", "qwerty");
	printf("05)      my: %d\n", ans_int);
	printf("06)standard: %d\n", strcmp("qwertyu", "qwertyt"));
	ans_int = ft_strcmp("qwertyu", "qwertyt");
	printf("06)      my: %d\n", ans_int);
 
	printf("\n----------ft_write---------\n");
	printf("\n01)standard: %zd\n", write(1, "", 0));
	ans_int = ft_write(1, "", 0);
	printf("01)      my: %d\n", ans_int);
	fd = open("test.txt", O_WRONLY);
	printf("\n02)standard: %zd\n", write(fd, "qwerty", 6));
	ans_int = ft_write(fd, "qwerty", 6);
	printf("02)      my: %d\n", ans_int);
	close(fd);
	printf("\n03)standard: %zd\n", write(1, "qwerty", 6));
	ans_int = ft_write(1, "qwerty", 6);
	printf("\n03)      my: %d\n", ans_int);
	printf("\n04)standard: %zd\n", write(1, "qwerty", 3));
	printf("errno = %d \n", errno);
	ans_int = ft_write(1, "qwerty", 3);
	printf("\n04)      my: %d\n", ans_int);
	printf("errno = %d \n", errno);
	printf("\n05)standard: %zd\n", write(-1, "", 6));
	printf("errno = %d \n", errno);
	ans_int = ft_write(-1, "", 6);
	printf("\n05)      my: %d\n", ans_int);
	printf("errno = %d \n", errno);
	printf("\n06)standard: %zd\n", write(1, NULL, 6));
	printf("errno = %d \n", errno);
	ans_int = ft_write(1, NULL, 6);
	printf("\n06)      my: %d\n", ans_int);
	printf("errno = %d \n", errno);

	printf("\n----------ft_read----------\n");
	errno = 0;
	//ret = ft_read(0, buff, 50);
	//printf("STDIN: %s\n", buff);
	fd = open("test.txt", O_RDONLY);
	ret = read(fd, buff, 10);
	printf("01)standard: %zd - %s\n", ret, buff);
	printf("errno = %d \n", errno);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	ret = ft_read(fd, buff, 10);
	printf("01)      my: %zd - %s\n", ret, buff);
	printf("errno = %d \n", errno);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	ret = read(fd, buff, 50);
	printf("02)standard: %zd - %s\n", ret, buff);
	printf("errno = %d \n", errno);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	ret = ft_read(fd, buff, 50);
	printf("02)      my: %zd - %s\n", ret, buff);
	printf("errno = %d \n", errno);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	ret = read(fd, NULL, 50);
	printf("03)standard: %zd\n", ret);
	printf("errno = %d \n", errno);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	ret = ft_read(fd, NULL, 50);
	printf("03)      my: %zd\n", ret);
	printf("errno = %d \n", errno);
	close(fd);
	ret = read(-1, buff, 50);
	printf("04)standard: %zd\n", ret);
	printf("errno = %d \n", errno);
	ret = ft_read(-1, buff, 50);
	printf("04)      my: %zd\n", ret);
	printf("errno = %d \n", errno);
	
	printf("\n----------ft_strdup---------\n");
	printf("01)standart: %s\n", strdup(""));
	ans_str = ft_strdup("");
	printf("01)      my: %s\n", ans_str);
	printf("02)standart: %s\n", strdup("qwerty"));
	ans_str = ft_strdup("qwerty");
	printf("02)      my: %s\n", ans_str);
	printf("03)standart: %s\n", strdup("I think a shell could separately open the terminal for read-only and for write-only, instead of running programs with all 3 standard file descriptors being duplicates of the same read-write file description. (set up with dup2). But that's not how bash (or the terminal emulator that started bash) is designed."));
	ans_str = ft_strdup("I think a shell could separately open the terminal for read-only and for write-only, instead of running programs with all 3 standard file descriptors being duplicates of the same read-write file description. (set up with dup2). But that's not how bash (or the terminal emulator that started bash) is designed.");
	printf("03)      my: %s\n", ans_str);
	return(0);
}
