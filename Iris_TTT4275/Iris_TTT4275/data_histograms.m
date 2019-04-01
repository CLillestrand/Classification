bins = 8;
y = [0 30];
x = [0 8];

figure(3);
subplot(3,1,1);
histogram(x1(:, 1), bins);
hold on;
histogram(x1(:, 2), bins);
histogram(x1(:, 3), bins);
histogram(x1(:, 4), bins);
ylim(y);
xlim(x);
grid on;
title('Data class 1');

subplot(3,1,2);
histogram(x2(:, 1), bins);
hold on;
histogram(x2(:, 2), bins);
histogram(x2(:, 3), bins);
histogram(x2(:, 4), bins);
ylim(y);
xlim(x);
grid on;
title('Data class 2');

subplot(3,1,3);
histogram(x3(:, 1), bins);
hold on;
histogram(x3(:, 2), bins);
histogram(x3(:, 3), bins);
histogram(x3(:, 4), bins);
ylim(y);
xlim(x);
grid on;
title('Data class 3');
