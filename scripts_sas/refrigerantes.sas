

data refrigerantes;
	infile '/folders/myfolders/data/refrigerantes.csv';
	input C A B desvio;
run;

/*
proc print data = refrigerantes;
run;
*/

title 'Modelo com três fatores fixos';
proc glm data = refrigerantes;
	class A B C;
	model desvio = A|B|C;
run;


title 'Modelo com três fatores aleatórios';
proc glm data = refrigerantes;
	class A B C;
	model desvio = A|B|C;
	random A B C A*B A*C B*C A*B*C / test;
run;


