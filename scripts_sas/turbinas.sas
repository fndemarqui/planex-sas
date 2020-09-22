

data turbinas;
	infile '/folders/myfolders/data/turbinas.csv';
	input A B C desvio;
run;


proc print data = turbinas;
run;


title 'Modelo com três fatores aleatórios';
proc glm data = turbinas;
	class A B C;
	model desvio = A|B|C;
	random A B C A*B A*C B*C A*B*C / test;
run;


title 'Modelo com um fator fixo e dois fatores aleatórios';
proc glm data = turbinas;
	class A B C;
	model desvio = A|B|C;
	lsmeans A / adjust = tukey;
	random B C A*B A*C B*C A*B*C / test;
run;




title 'Modelo com três fatores aleatórios - proc varcomp';
proc varcomp data = turbinas method=type1;
	class A B C;
	model desvio = A|B|C;
run;


title 'Modelo misto - proc varcomp';
proc varcomp data = turbinas method=type1;
	class A B C;
	model desvio = A|B|C / fixed = 1;
run;