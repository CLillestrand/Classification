function [] = display_image(x)
x = flip(x);
x = rot90(x,3);
image(x);
end

