function [ wierzcholki, krawedzie, min, max, sredni_czas, suma_t ] = loadData( fileToRead )
%OBRABIANIE Summary of this function goes here
%   Detailed explanation goes here




rawData = importdata(fileToRead);

[unused,name] = fileparts(fileToRead); %#ok
newData.(genvarname(name)) = rawData;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData);
for i = 1:length(vars)
    assignin('base', vars{i}, newData.(vars{i}));
end

B = newData.(vars{1});

[m n] = size(B);

min = B(1,1);
max = B(1,1);
wierzcholki = B(1,2);
krawedzie = B(1,3);
ilosc = 1;
suma_t = B(1,1);


for i = 2 : m
    
    if wierzcholki == B(i,2) && krawedzie == B(i,3)
        ilosc = ilosc + 1;
        suma_t = suma_t + B(i,1);
        
        if B(i,1) > max
            max = B(i,1);
        end
        
        if B(i,1) < min
            min = B(i,1);
        end
            
    end
    
    
end

sredni_czas = suma_t / ilosc;

end