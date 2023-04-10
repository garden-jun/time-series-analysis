/** EXAMPLE 2.1 : 선형추세모형 적합**/

data pop;
	infile 'C:\data\population.txt';
	input pop@@;
	pop=round(pop/10000);
	lnpop = log(pop);
	t+1; t2=t*t; year=1959+t; run;
proc sgplot data=pop;
	series x=year y=pop / markers markerattrs=(symbol=asterisk);
	xaxis values=(1960 to 1995 by 5); run;
proc reg data=pop;
	model pop=t; / dw;
	output out=out1 p=pred1 r=residual1; run;
proc sgplot data=out1;
	series x=year y=residual1/ markers markerattrs=(symbol=square);
	xaxis values=(1960 to 1995 by 5);
	refline 0/axis=y;run;
proc reg data=pop;
	model pop=t t2/dw;
	output out=out2 p=pred2 r=residual2; run;
proc sgplot data=out2;
	series x=year y=pop/ markers markerattrs=(symbol=circle);
	scatter x=year y=pred2 / markerattrs=(symbol=plus);
	xaxis values=(1960 to 1995 by 5);
	yaxis label="pop"; run;
proc sgplot data=out2;
	series x=year y=residual2/lineattrs=(pattern=1 color=black thickness=1)
		markers markerattrs=(symbol=star color=black size=5);
	xaxis values=(1960 to 1955 by 5);
	refline 0 / axis=y; run;
proc reg data=pop;
	model lnpop=t t2/dw;
	output out=out3 r=residual3; run;
proc sgplot data=out3;
	series x=year y=residual3 /lineattrs=(pattern=1 color=black thickness=1)
		markers markerattrs=(symbol=diamondfilled color=black size=5);
	xaxis values=(1960 to 1995 by 5);
	refline 0 / axis=y; run;

