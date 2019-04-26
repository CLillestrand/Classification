conf_matrix = zeros(num_classes);
for i = 1:num_test
    conf_matrix(nn_labels(i)+1, testlab(i)+1) = conf_matrix(nn_labels(i)+1, testlab(i)+1) + 1;
end
eer = 1 - trace(conf_matrix)/num_test;

disp('Confusion matrix: ');
disp(conf_matrix);
disp('Error rate: ');
disp(eer);

x = zeros(28, 28);
x(:) = testv(17,:); % classified as 4, was 9
display_image(x);

x(:) = testv(44,:); % classified as 1, was 2
display_image(x);

x(:) = testv(74,:); % classified as 7, was 9
display_image(x);