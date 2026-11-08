int i = 5;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
	if (strcmp(__FILE__, "Sully.c"))
		--i;
	if (i < 0)
		return (0);
	char filename[10];
	sprintf(filename, "Sully_%d.c", i);
	FILE *fptr = fopen(filename, "w");
	if (!fptr)
		return (1);

	char *str = "int i = %1$d;%2$c#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <string.h>%2$c%2$cint main(){%2$c%3$cif (strcmp(__FILE__, %4$cSully.c%4$c))%2$c%3$c%3$c--i;%2$c%3$cif (i < 0)%2$c%3$c%3$creturn (0);%2$c%3$cchar filename[10];%2$c%3$csprintf(filename, %4$cSully_%%d.c%4$c, i);%2$c%3$cFILE *fptr = fopen(filename, %4$cw%4$c);%2$c%3$cif (!fptr)%2$c%3$c%3$creturn (1);%2$c%2$c%3$cchar *str = %4$c%5$s%4$c;%2$c%2$c%3$cfprintf(fptr, str, i, 10, 9, 34, str);%2$c%3$cfclose(fptr);%2$c%2$c%3$cif (i >= 0) {%2$c%3$c%3$cchar command[80];%2$c%3$c%3$csprintf(command, %4$cgcc -Wall -Werror -Wextra %%s -o Sully_%%d && ./Sully_%%d%4$c, filename, i, i);%2$c%3$c%3$csystem(command);%2$c%3$c}%2$c%3$creturn (0);%2$c}%2$c";

	fprintf(fptr, str, i, 10, 9, 34, str);
	fclose(fptr);

	if (i >= 0) {
		char command[80];
		sprintf(command, "gcc -Wall -Werror -Wextra %s -o Sully_%d && ./Sully_%d", filename, i, i);
		system(command);
	}
	return (0);
}
