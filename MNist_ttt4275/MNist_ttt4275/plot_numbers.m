figure(1);
x = zeros(28, 28);
x(:) = C(15,:);
subplot(2,5,1);
display_image(x);

x(:) = C(70,:);
subplot(2,5,2);
display_image(x);

x(:) = C(152,:);
subplot(2,5,3);
display_image(x);

x(:) = C(200,:);
subplot(2,5,4);
display_image(x);

x(:) = C(300,:);
subplot(2,5,5);
display_image(x);

x(:) = C(351,:);
subplot(2,5,6);
display_image(x);

x(:) = C(402,:);
subplot(2,5,7);
display_image(x);

x(:) = C(503,:);
subplot(2,5,8);
display_image(x);

x(:) = C(551,:);
subplot(2,5,9);
display_image(x);

x(:) = C(600,:);
subplot(2,5,10);
display_image(x);

sgtitle('Example clusters from each class');