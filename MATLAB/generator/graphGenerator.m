function [ matrix ] = graphGenerator( m, numberOfEdges )
%GRAPHGENERATOR Summary of this function goes here
%   Detailed explanation goes here



maxCountOfEdges = m*m - m;


if maxCountOfEdges < numberOfEdges
    
    matrix = ones(m);
    
    for i = 1 : m
        matrix(i,i) = 0;
    end
   
elseif maxCountOfEdges == numberOfEdges
    
    matrix = ones(m);
    
    for i = 1 : m
        matrix(i,i) = 0;
    end
    
else
    
    matrix = zeros(m);
    A = [];
    for i = 1 : m
        for j = 1 : m
            
            if i ~= j
               A = [A  [i ; j]];
            end
            
        end
    end
    
    low = 1;
    for k = 1 : numberOfEdges
       [notUse hight] = size(A);
       randCol = round( low + (hight - low) * rand() );
       x = A(1,randCol);
       y = A(2,randCol);
       matrix(x,y) = 1;
       A(:,randCol) = [];
        
    end
    
end


end
