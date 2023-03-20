data fig1_1;
do t=1 to 100;
z = 5000 + 20*rannor(1234);
output;
end;run;

data fig1_1;
set fig1_1;
date=intnx('month', '1jan80'd, _n_-1);
format date monyy.; run;        /** .�� �̷��� �������� �ٲ��ְڴٴ� �ǹ� **/
proc sgplot;
series x=date y=z;
refline 5000/ axis=y; run;

/** FIGURE 1.1: Zt = 5000 + et, et ~ N(0, 20)�� ������  �ð迭�ڷ� �׸� **/
data fig1_1;
do t=1 to 100;
z = 5000 + 20*rannor(1234); * ���ױ��? �ùķ��̼�;
output;
end;run;

data fig1_1;
set fig1_1;
date=intnx('month', '1jan80'd, _n_-1);
format date monyy.; run;		/** .�� �̷��� �������� �ٲ��ְڴٴ� �ǹ� **/
proc sgplot;
series x=date y=z;
refline 5000/ axis=y; run;


/** FIGURE 1.2 : Zt = 0.5t + et, et ~ N(0, 1)�� ������ �ð迭�ڷ� �׸� **/
data fig1_2;
	do t=1 to 100;
		x = 0.5 * t;
		z = 0.5 * t + rannor(1234);
		output;
	end; run;
data fig1_2;set fig1_2;
	date=intnx('month', '1jan80'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z/ lineattrs=(color=blue);
	series x=date y=x/ lineattrs=(color=black); run;


/** FIGURE 1.3 **/
data fig1_3;
	do t=1 to 120;
		a=rannor(2483);
		z=10+3*sin((2*3.14*t)/12)+0.8*a;
		output;
	end; run;
data fig1_3; set fig1_3;
	date=intnx('month', '1jan85'd, _n_-1);
	format date monyy.;run;
proc sgplot;
	series x=date y=z; run;


/** FIGURE 1.4 : ��ȭ������ �ڷ��� �ð迭�׸��� ������ ���� �׸���  **/
data fig1_4;
	infile 'c:\data\depart.txt';
	input z @@;
	logz = log(z);
	date = intnx('month', '1jan81'd, _n_-1);	* �ڷᰳ��, �ڵ�����(SAS �Ǳ��);
	format date monyy.;
	x=2.701573+0.000409*date; run;

proc print data = fig1_4; run;

proc sgplot;
	series x=date y=logz/ lineattrs=(color=blue);
	series x=date y=x/ lineattrs=(color=black); run;


/** FIGURE 1.5 : �����°� �ڷ��� �ð迭�׸� �׸��� **/
data fig1_5;
	infile 'c:\data\koreapass.txt';
	input z @@;
	date = intnx('month', '1jan81'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z; run;

/** FIGURE 1.6 : �߼��� �޶����� �ڷ��� �ð迭�׸� �׸��� **/ 
data fig1_6;
	do t=1 to 120;
		a=rannor(4321);
		if t le 60 then x=0.5*t;
		else x=2*(t-46);
		z=x+a; output;
	end; run;
data fig1_6;
	set fig1_6;
	date=intnx('month', '1jan85'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z;
	refline '1jan90'd/ axis=x; run;


/** ���� **/
/** female_hw1 **/
data fig1_71;
	infile 'c:\data\female_hw1.txt';
	input z ;
	date = intnx('month', '1jan83'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z; run;


/** ���� **/
/** build_hw1 **/
data fig1_72;
	infile 'c:\data\build_hw1.txt';
	input z ;	
	date = intnx('month', '1jan80'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z; run;

/** ���� **/
/** export_hw1 **/
data fig1_73;
	infile 'c:\data\export_hw1.txt';
	input z ;
	date = intnx('month', '1jan00'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z; run;

/** ���� **/
/** usapass_hw1 **/
data fig1_74;
	infile 'c:\data\usapass_hw1.txt';
	input z ;
	date = intnx('month', '1jan49'd, _n_-1);
	format date monyy.; run;
proc sgplot;
	series x=date y=z; run;


/** 1.7(1) female �׸��� �׸��� ���� 4���߿� �ִٰ� �����ϴ� �� (�ұ�Ģ, �߼� ��)
	(2) 



	���ڿ� �ڿ� ���ڸ� �ְ������
	$
	input id name $ height;

	cards; << �׳� ���� ������ �Է�
	infile << �ܺε����� �Է�.
	**/




	/** FIGURE 1.4 : ���� ������ �������� ���   **/
data fig1_4;
	infile 'c:\data\depart.txt';
	input z @@;
	t = _n_;

/*	logz = log(z);*/
/*	date = intnx('month', '1jan81'd, _n_-1);	* �ڷᰳ��, �ڵ�����(SAS �Ǳ��);*/
/*	format date monyy.;*/
/*	x=2.701573+0.000409*date; */
	run;

proc print data=fig1_4; run;

proc sgplot;
	series x=t y=logz/ lineattrs=(color=blue);
	series x=date y=x/ lineattrs=(color=black); run;
