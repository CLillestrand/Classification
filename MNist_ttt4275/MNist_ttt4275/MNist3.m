%% Initialisation:
tic

M = 64;
L = 784;
num_classes = 10;

% Sort training data into classes
[trainlab_sorted, sort_index] = sort(trainlab);
trainv_sorted = zeros(num_train, L);
for i = 1:num_train
    trainv_sorted(i,:) = trainv(sort_index(i),:);
end


%% Clustering:
C = zeros(M*num_classes,L);
j = 1;
k = 1;
for i = 0:(num_classes-1)
    % Get all samples from class i
    k = j;
    while j < num_train && trainlab_sorted(j+1) == i
        j = j + 1;
    end
    trainv_i = trainv_sorted(k:j,:);
    
    % Do clustering:
    [idxi,Ci] = kmeans(trainv_i,M);
    fprintf('Class %d clustered\n',i);
    C((i*M+1):((i+1)*M),:) = Ci;
end

%% Find K nearest neighbour for each test sample:

nn_labels = zeros(num_test, 1);
K = 7;
Z = dist(C,testv');

for i = 1:10
    [knn_distances, knn_indices] = mink(Z(:,i),K);
    knn_labels = zeros(K,1);
    for j = 1:K
        knn_labels(j) = floor((knn_indices(j)-1)/M);
    end
   
    %sortrows(A, [2 3]) sorts first in col 2 then 3
    % fix tie with fucked up code
    
    nn_labels(i) = mode(knn_labels);
end

toc