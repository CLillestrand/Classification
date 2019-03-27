%Iris
%% Init variables
D = 4;  % Dimension of input vectors
C = 3;  % Number of classes
train_size_c = 30;
train_size = train_size_c * C;
test_size_c = 20;
test_size = test_size_c * C;

W_0 = zeros(C, D);
w_0 = zeros(C, 1);
W = [W_0 w_0];
alpha = 0.02;


%% Load data
x1 = load('class_1','-ascii');
x2 = load('class_2','-ascii');
x3 = load('class_3','-ascii');
x = [x1; x2; x3];

x1_train = x1(1:train_size_c,:);
x2_train = x2(1:train_size_c,:);
x3_train = x3(1:train_size_c,:);
x_train = [x1_train; x2_train; x3_train]; 

x1_test = x1(train_size_c+1:end,:);
x2_test = x2(train_size_c+1:end,:);
x3_test = x3(train_size_c+1:end,:);
x_test = [x1_test; x2_test; x3_test];


%% Do the shit
for m = 1:100  % TODO: test for convergence
    MSE_grad = 0;
    for k = 1:train_size
        c = floor((k-1)/train_size * C) + 1;
        t_k = zeros(C, 1);
        t_k(c) = 1;
        
        x_k = [x_train(k,:)'; 1];
        z_k = W*x_k + w_0;
        g_k = sigmoid(z_k);
        MSE_grad = MSE_grad + ((g_k - t_k).*(g_k).*(1-g_k))*x_k';
    end
    W = W - alpha*MSE_grad;
    disp(norm(alpha*MSE_grad))
end


%% Plot the shit
% figure(1);
% subfigure(2)
% hist(x1);
% figure(2);
% hist(x2);
% figure(3);
% hist(x3);
