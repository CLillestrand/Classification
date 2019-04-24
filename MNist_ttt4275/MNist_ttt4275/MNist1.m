% x = zeros(28, 28);
% x(:) = trainv(6,:);
% display_image(x);
% 
% d = 0;
% nearest = 0;
% 
% for i = 1:1000 
%     testv()
%     
% end

chunk_size = 1000;
num_chunks = num_test/chunk_size;

nn_distances = zeros(num_test, num_chunks);
nn_indices = zeros(num_test, num_chunks);

for i = 1:num_chunks
    W = trainv((i-1)*chunk_size+1:i*chunk_size,:);
    Z = dist(W,testv');
    for j = 1:num_test
        [nn_dist, nn_index] = min(Z(:,j));
        nn_distances(j, i) = nn_dist;
        nn_indices(j, i) = (i-1)*chunk_size+nn_index;
    end
end

winners = [];

for i = 1:num_test
    [nn_dist, nn_index] = min(nn_distances(i,:));
    nn_label = trainlab(nn_indices(i, nn_index));
    winners = [winners; nn_label];
end

inc = 0;
for i = 1:num_test
    if winners(i) == testlab(i)
        inc = inc + 1;
    end
end