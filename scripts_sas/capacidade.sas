

data capacidade;
	infile '/folders/myfolders/data/capacidade.csv';
	input peca operador medida;
run;

/*
proc print data = capacidade;
run;
*/

title 'Modelo com dois fatores fixos';
proc glm data = capacidade;
	class peca operador;
	model medida = operador|peca;
run;


title 'Modelo com dois fatores aleatórios';
proc glm data = capacidade;
	class peca operador;
	model medida = operador|peca;
	random peca operador peca*operador / test;
run;


title 'Modelo misto';
proc glm data = capacidade;
	class peca operador;
	model medida = operador|peca;
	random peca peca*operador / test;
run;




title 'Modelo com dois fatores aleatórios - proc varcomp';
proc varcomp data = capacidade method=type1;
	class peca operador;
	model medida = operador|peca;
run;


title 'Modelo misto - proc varcomp';
proc varcomp data = turbinas method=type1;
	class peca operador;
	model medida = operador|peca / fixed=2;
run;
