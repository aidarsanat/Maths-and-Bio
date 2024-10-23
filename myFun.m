function F = myFun(x)
F = [2*x(1) - x(2) - exp(-x(1)); -x(1) + 2*x(2) - exp(-x(2))];
%x0 = [-5; -5]; % Сделать начальное предположение решения 
%options=optimset('Display','iter');  Опция для отображения вывода 
%[x,fval] = fsolve(@myfun,x0,options)  Вызвать решатель
end