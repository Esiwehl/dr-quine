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

	char *str = "int i = %d;%c#include <stdio.h>%c#include <stdlib.h>%c#include <string.h>%c%cint main(){%c%cif (strcmp(__FILE__, %cSully.c%c))%c%c%c--i;%c%cif (i < 0)%c%c%creturn (0);%c%cchar filename[10];%c%csprintf(filename, %cSully_%%d.c%c, i);%c%cFILE *fptr = fopen(filename, %cw%c);%c%c%cchar *str = %c%s%c;%c%c%cfprintf(fptr, str, i, 10, 10, 10, 10, 10, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 9, 34, str, 34, 10, 10, 9, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 10, 10);%c%cfclose(fptr);%c%c%cif (i >= 0) {%c%c%cchar command[80];%c%c%csprintf(command, %cgcc -Wall -Werror -Wextra %%s -o Sully_%%d && ./Sully_%%d%c, filename, i, i);%c%c%csystem(command);%c%c}%c%creturn (0);%c}%c";

	fprintf(fptr, str, i, 10, 10, 10, 10, 10, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 9, 34, 34, 10, 9, 34, 34, 10, 10, 9, 34, str, 34, 10, 10, 9, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 10, 10);
	fclose(fptr);

	if (i >= 0) {
		char command[80];
		sprintf(command, "gcc -Wall -Werror -Wextra %s -o Sully_%d && ./Sully_%d", filename, i, i);
		system(command);
	}
	return (0);
}