/** EXAMPLE 2.1 : 선형추세모형 적합**/

data pop;
	infile 'C:\data\population.txt';
	input pop@@; 
	pop=round(pop/10000);
	lnpop = log(pop);
	t+1; t2=t*t; year=1959+t; run;

proc print data=pop;run;	/** 데이터 잘 들어왔는지 확인하는 코드 **/

proc sgplot data=pop;
	series x=year y=pop / markers markerattrs=(symbol=asterisk);
	xaxis values=(1960 to 1995 by 5); run;
proc reg data=pop;
	model pop=t / dw;
	output out=out1 p=pred1 r=residual1; run;	
	/**잔차 분석 pred1. residual1이라는 것을 만들어 이들을 이용하여 out1이라는데이터 셋을 만들어서 만들어줘*/
	/* 파란부분은 sas에서 정한 명령어, 검정부분은 사용자가 한것*/
/** Zt = b0 + b1t+ 입실론t. t=1,..., 36 **/
/**모형에 대해 anova를 한 결과를 보여줌.*/
/** 잔차의 모양이 맘에 들지 않으므로 Zt = b0 + b1t+ b2t^2 + 입실론t. t=1,..., 36 */

proc print data=out1;run;	/** 데이터 잘 들어왔는지 확인하는 코드 **/





proc sgplot data=out1;
	series x=year y=residual1/ markers markerattrs=(symbol=square);
	xaxis values=(1960 to 1995 by 5);
	refline 0/axis=y;run;


proc reg data=pop;
	model pop=t t2/ dw;
	output out=out2 p=pred2 r=residual2; run;
proc sgplot data=out2;
	series x=year y=pop/ markers markerattrs=(symbol=circle);
	scatter x=year y=pred2 / markerattrs=(symbol=plus);
	xaxis values=(1960 to 1995 by 5);
	yaxis label="pop"; run;
proc sgplot data=out2; /* residual 을 그리면 이분산성이 확실히 느껴짐 */
	series x=year y=residual2/lineattrs=(pattern=1 color=black thickness=1)
		markers markerattrs=(symbol=star color=black size=5);
	xaxis values=(1960 to 1955 by 5);
	refline 0 / axis=y; run;

/* log씌운것임 <- 이분산성은 잡았음. 하지만 양의 자기상관을 가지고 있음*/
/* 더빈왓슨값이 조금씩 증가하고 있다. <- 이게 무슨의미를 가질까  */
proc reg data=pop;
	model lnpop=t t2/ dw;
	output out=out3 r=residual3; run;
proc sgplot data=out3;
	series x=year y=residual3 /lineattrs=(pattern=1 color=black thickness=1)
		markers markerattrs=(symbol=diamondfilled color=black size=5);
	xaxis values=(1960 to 1995 by 5);
	refline 0 / axis=y; run;

