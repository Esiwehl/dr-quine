#include <stdio.h>

/*
	Comment
*/

char *strRetForSubject(char *str){
	/*
		Comment 2
	*/
	return (str);
}

int main(){
	char *str = "#include <stdio.h>%c%c/*%c%cComment%c*/%c%cchar *strRetForSubject(char *str){%c%c/*%c%c%cComment 2%c%c*/%c%creturn (str);%c}%c%cint main(){%c%cchar *str = %c%s%c;%c%cprintf(str,10,10,10,9,10,10,10,10,9,10,9,9,10,9,10,9,10,10,10,10,9,34,strRetForSubject(str),34,10,9,10,9,10);%c%creturn (0);%c}";
	printf(str,10,10,10,9,10,10,10,10,9,10,9,9,10,9,10,9,10,10,10,10,9,34,strRetForSubject(str),34,10,9,10,9,10);
	return (0);
}