function [ ] = tarjan( A )
%TARJAN Summary of this function goes here
%   Detailed explanation goes here

[m m] = size(A);

cursor = 1;
index = 1;
STACK_SIZE = m * 100;
stack = zeros(STACK_SIZE,1);

%	int **G;//[SIZE][2];
TAB_SIZE_0 = ones(m,1) .* -1;
TAB_SIZE_1 = ones(m,1) .* -1;


for i = 1 : m
    
   if TAB_SIZE_0(i) == -1
        [A, TAB_SIZE_0, TAB_SIZE_1, stack, index, cursor] = strongConnect(i, A, TAB_SIZE_0, TAB_SIZE_1, stack, index, cursor, m, STACK_SIZE);
   end
    
end

end

    
function [A, TAB_SIZE_0, TAB_SIZE_1, stack, index, cursor] = strongConnect(i, A, TAB_SIZE_0, TAB_SIZE_1, stack, index, cursor, m, STACK_SIZE)

TAB_SIZE_0(i) = index;
TAB_SIZE_1(i) = index;

index = index + 1;

[stack, cursor] = push(i, stack, cursor);

for j = 1 : m
    
    if A(i,j) == 1
       if TAB_SIZE_0(j) == -1

           [A, TAB_SIZE_0, TAB_SIZE_1, stack, index, cursor] = strongConnect(j, A, TAB_SIZE_0, TAB_SIZE_1, stack, index, cursor, m, STACK_SIZE);
           TAB_SIZE_1(i) = min( TAB_SIZE_1(j) , TAB_SIZE_1(i) );
           
       else    
           
           found = 0;
           
           for k = 1 : STACK_SIZE
                if stack(k) == j
                    found = 1;
                    break;
                end
           end
           
           if found == 1
               TAB_SIZE_1(i) = min(TAB_SIZE_0(j) , TAB_SIZE_1(i) );
           end
           
       end
        
    end
    
end

	if  TAB_SIZE_0(i) == TAB_SIZE_1(i)
                          
        not_done = 1;
        
        disp('---silne skladowe spojne---');
        
        while not_done
            
            [p, stack, cursor] = pop(stack, cursor);
            disp(p);
            not_done = p ~= i;
            
        end
        
        disp('----------------------------');
               
	end

end


function [stack, cursor] = push(i, stack, cursor)

    stack(cursor) = i;
    cursor = cursor + 1;

end

function [val, stack, cursor] = pop(stack, cursor)

    if cursor > 1
        cursor = cursor - 1;
        val = stack(cursor);
        stack(cursor) = -1;
    else
        val = 999999999;
    end

end
