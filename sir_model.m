% Параметры
A = 0.01;        % Приток новой популяции
beta = 0.3;      % Коэффициент инфицирования
gamma = 0.05;    % Коэффициент потери иммунитета
mu = 0.01;       % Коэффициент естественной убыли
nu = 0.1;        % Коэффициент выздоровления
N0 = 1000;       % Начальный размер популяции

% Начальные условия
I0 = 0.2 * N0;   % Начальное количество инфицированных
R0 = 0;          % Начальное количество выздоровевших
S0 = N0 - I0;    % Начальное количество восприимчивых
initial_conditions = [S0 I0 R0 N0];

% Диапазон времени
tspan = [0 100];  % Время моделирования

% Система дифференциальных уравнений
function dydt = SIR(t, y, A, beta, gamma, mu, nu)
    S = y(1);  % Восприимчивые
    I = y(2);  % Инфицированные
    R = y(3);  % Выздоровевшие
    N = y(4);  % Общая популяция

    dSdt = A - beta*S*I + gamma*R - mu*S;
    dIdt = beta*S*I - nu*I - mu*I;
    dRdt = nu*I - gamma*R - mu*R;
    dNdt = A - mu*N;
    
    dydt = [dSdt; dIdt; dRdt; dNdt];
end

% Решение уравнений с использованием ode45
[t, Y] = ode45(@(t,y) SIR(t, y, A, beta, gamma, mu, nu), tspan, initial_conditions);

% Извлекаем решения для S, I, R, N
S = Y(:,1);
I = Y(:,2);
R = Y(:,3);
N = Y(:,4);

% Построение графиков
figure;
subplot(2,1,1);
plot(t, S, 'b', 'DisplayName', 'S(t)');
hold on;
plot(t, I, 'r', 'DisplayName', 'I(t)');
plot(t, R, 'g', 'DisplayName', 'R(t)');
xlabel('Time');
ylabel('Population');
legend;

subplot(2,1,2);
plot(t, N, 'k', 'DisplayName', 'N(t)');
xlabel('Time');
ylabel('Total Population');
legend;

figure;
plot(t, S, 'b', t, I, 'r', t, R, 'g', 'LineWidth', 2);
xlabel('Time');
ylabel('Population');
legend('S(t) - Susceptible', 'I(t) - Infected', 'R(t) - Recovered');
title('SIR Model Dynamics');
grid on;
