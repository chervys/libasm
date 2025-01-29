/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: chervy <chervy@student.42lyon.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/29 08:03:29 by chervy            #+#    #+#             */
/*   Updated: 2025/01/29 08:23:03 by chervy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>


size_t      ft_strlen(const char *s);
char        *ft_strcpy(char *dest, const char *src);
int         ft_strcmp(const char *s1, const char *s2);
ssize_t     ft_write(int fd, const void *buf, size_t count);
ssize_t     ft_read(int fd, void *buf, size_t count);
char        *ft_strdup(const char *s);

void test_strlen(void)
{
    printf("=== ft_strlen ===\n");
    const char *str = "Hello World !";
    printf("strlen      : %zu\n", strlen(str));
    printf("ft_strlen   : %zu\n", ft_strlen(str));
    printf("\n");
}

void test_strcpy(void)
{
    printf("=== ft_strcpy ===\n");
    const char  *src = "Hello World !";
    char        dest[42];
    printf("strcpy      : %s\n", strcpy(dest, src));
    printf("ft_strcpy   : %s\n", ft_strcpy(dest, src));
    printf("\n");
}

void test_strcmp(void)
{
    printf("=== ft_strcmp ===\n");
    const char *s1 = "Hello World ???";
    const char *s2 = "Hello World !!!";
    printf("strcmp      : %d\n", strcmp(s1, s2));
    printf("ft_strcmp   : %d\n", ft_strcmp(s1, s2));
    printf("\n");
}

void test_write(void)
{
    printf("=== ft_write ===\n");
    const int fd = 1;
    const char *str = "Hello World !\n";
    const size_t count = ft_strlen(str);
    printf("write       : %zd\n", write(fd, str, count));
    printf("ft_write    : %zd\n", ft_write(fd, str, count));
    printf("\n");
}

void test_read(void)
{
    printf("=== ft_read ===\n");
    int     fd = open("test.txt", O_RDONLY);
    char    buffer[100];
    if (fd != -1) {
        ssize_t bytes_read = ft_read(fd, buffer, sizeof(buffer) - 1);
        if (bytes_read != -1) { 
            buffer[bytes_read] = '\0';
        }
        close(fd);
        printf("Read %zd bytes  : %s", bytes_read, buffer);
    }
    printf("\n");
}

void test_strdup(void)
{
    printf("=== ft_strdup ===\n");
    const char  *original = "Hello World !";
    char        *duplicate = ft_strdup(original);
    if (duplicate) {
        printf("strdup      : %s\n", original);
        printf("ft_strdup   : %s\n", duplicate);
        free(duplicate);
    }
    printf("\n");
}

int main(void)
{
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_write();
    test_read();
    test_strdup();
    return 0;
}