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
	char *str = "#include <stdio.h>%1$c%1$c/*%1$c%2$cComment%1$c*/%1$c%1$cchar *strRetForSubject(char *str){%1$c%2$c/*%1$c%2$c%2$cComment 2%1$c%2$c*/%1$c%2$creturn (str);%1$c}%1$c%1$cint main(){%1$c%2$cchar *str = %3$c%4$s%3$c;%1$c%2$cprintf(str,10,9,34,strRetForSubject(str));%1$c%2$creturn (0);%1$c}";
	printf(str,10,9,34,strRetForSubject(str));
	return (0);
}