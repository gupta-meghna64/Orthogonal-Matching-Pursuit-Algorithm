%MEGHNA GUPTA
%2016056
%PS-ASSIGNMENT 2
%FUNCTION algo_omp solves y = Ax, takes the input parameters y, A, k where
%y is the output field, A is the dataset field and k is the sparsity. It
%return the solution of x.

function  x = algo_omp(k, A, y)
    xbeg = zeros(size(A,2),1);
    support=[];
    temp=y;
    count = 1;
    while count < k+1
        ST = abs(A' * temp);
        [a, b] = max(ST);
        support = [support b];
        xfinal = A(:, support)\y;
        temp = y-A(:,support) * xfinal;
        count = count + 1;
    end
    x = xbeg;
    t = support';
    x(t) = xfinal;
end