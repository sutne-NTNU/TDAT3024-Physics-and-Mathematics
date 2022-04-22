f = @(t,y) t^2 * y;
f_exact = @(t) exp(t^3 / 3);
interval = [0, 1];
initialY = 1;

h = 0.1; n = 1/h;
[t_01, approximation_01] = RungeKutta_4th_order(interval, initialY, n, f);

h = 0.05; n = 1/h;
[t_005, approximation_005] = RungeKutta_4th_order(interval, initialY, n, f);

h = 0.025; n = 1/h;
[t_0025, approximation_0025] = RungeKutta_4th_order(interval, initialY, n, f);

% plotting results in graph
hold on
fplot(f_exact, interval,'color','green', 'LineWidth',2) 
plot(t_01, approximation_01,'--',  'color','blue', 'LineWidth',2) 
plot(t_005, approximation_005,':',  'color','red', 'LineWidth',2) 
plot(t_0025, approximation_0025,'-.',  'color','cyan', 'LineWidth',2) 
legend('exact', 'h = 0.1', 'h = 0.05', 'h = 0.025','Location','northwest')
xlabel('t')
ylabel('y')
hold off
