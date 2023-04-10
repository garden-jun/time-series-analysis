/** EXAMPLE 2.2 : 지시함수를 이용한 계절모형 적합 **/

data dept;
	infile 'C:\data\depart.txt'; input dept @@;
	lndept= log(dept); t+1;
	date=intnx('month', '1JAN84'D,_n_-1); format data Monyy.;
		mon=month(data);
		if mon=1 then i1=1; else i1=0;
		if mon=2 then i1=1; else i1=0;
		if mon=3 then i1=1; else i1=0;
		if mon=4 then i1=1; else i1=0;
		if mon=5 then i1=1; else i1=0;
		if mon=6 then i1=1; else i1=0;
		if mon=7 then i1=1; else i1=0;
		if mon=8 then i1=1; else i1=0;
		if mon=9 then i1=1; else i1=0;
		if mon=10 then i1=1; else i1=0;
		if mon=11 then i1=1; else i1=0;
		if mon=12 then i1=1; else i1=0; run;

proc sgplot;
	series x=date y=dept / markers markerattrs=(symbol=dot); run;

proc sgplot;
	series x=date y=lndept / markers markerattrs=(symbol=dot); run;

proc reg;
	model lndept=t i1-i12/noint dw;
	output out=deptout r=residual; run;

proc sgplot data=deptout;	
	series x=date y=residual / markers markerattrs=(symbol=circlefilled);
	refline 0 / axis=y; run;

proc arima data=deptout; identify var=residual; run;
