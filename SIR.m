%function F = SIR(a,b,c,d)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms S(t) I(t) R(t) A N(t) b y m v ;
I(0) = 0.2*N;
R(0) = 0;
N(0) = No;
F = dsolve(diff(N) == A - m*N, diff(S) == A - b*S*I + y*R - m*S, diff(I) == b*S*I - v*I - m*I, diff(R) == v*I - y*R- m*I);
%end