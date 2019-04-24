conf_matrix = zeros(C);
for i = 1:num_test
    conf_matrix(nn_labels(i)+1, testlab(i)+1) = conf_matrix(nn_labels(i)+1, testlab(i)+1) + 1;
end
eer = 1 - trace(conf_matrix)/num_test;

disp('Confusion matrix: ');
disp(conf_matrix);
disp('Error rate: ');
disp(eer);

% x = zeros(28, 28);
% x(:) = trainv(6,:);
% display_image(x);
    