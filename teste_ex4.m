clc
syms Pg1 P1;
syms Pg2 P2;
syms Pg3 P3;
Pg3 = 0;
P2=0;
P = [Pg1 - P1; Pg2 - P2; Pg3 - P3];
P(1)=[];

syms x12 x13 x23;
syms a11 a12 a13;
syms a21 a22 a23;
syms a31 a32 a33;

a11 = inv(x12) + inv(x13);
a22 = inv(x12) + inv(x23);
a33 = inv(x13) + inv(x23);

a12 = -inv(x12);
a13 = -inv(x13);
a23 = -inv(x23);

a21 = a12;
a31 = a13;
a32 = a23;
B = [a11 a12 a13   ;
         a21 a22 a23   ;
         a31 a32 a33   ];
% B(1,:)=[];
% B(:,1)=[];
syms teta1 teta2 teta3;

teta=[0;teta2;teta3]
P = B*teta;
P(1)=[]
% teta = inv(B)*P;
% teta = [teta1;teta]


