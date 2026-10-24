#include <stdio.h>

#define DATA_STR "#include <stdio.h>%c%c#define DATA_STR %c%s%c%c#define SELF_REPRODUCTION(fptr) fprintf(fptr, DATA_STR, 10,10, 34, DATA_STR, 34, 10, 10, 10, 34, 34, 34, 34, 10, 10, 10, 9, 10, 10, 10);%c%c#define FT(x) int main() { FILE* fptr = fopen(%cGrace_kid.c%c, %cw%c); SELF_REPRODUCTION(fptr) fclose(fptr); return (0);}%c%c/*%c%cHere's a comment as per the subject..%c*/%c%cFT()"
#define SELF_REPRODUCTION(fptr) fprintf(fptr, DATA_STR, 10,10, 34, DATA_STR, 34, 10, 10, 10, 34, 34, 34, 34, 10, 10, 10, 9, 10, 10, 10);

#define FT(x) int main() { FILE* fptr = fopen("Grace_kid.c", "w"); SELF_REPRODUCTION(fptr) fclose(fptr); return (0);}

/*
	Here's a comment as per the subject..
*/

FT()