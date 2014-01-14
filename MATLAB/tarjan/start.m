function [  ] = start( pathFile, count, pathSave )
%START Summary of this function goes here
%   Detailed explanation goes here


txt = '.txt';

if nargin < 1
    pathFile = 'matrix_';
end

if nargin < 2
  count = 1;
end

if nargin < 3
  pathSave = 'wyniki.txt';
end

fid=fopen(pathSave,'w');


for k = 1 : count

    DELIMITER = '\t';
    HEADERLINES = 1;

    
    num = num2str(k);
    name = strcat(pathFile,num,txt);

    % Import the file
    newData = importdata(name, DELIMITER, HEADERLINES);

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(newData);
    
    
    for i = 1:length(vars)
        assignin('base', vars{i}, newData.(vars{i}));
    end
    
    % Run algorithm
    val =  newData.(vars{1});
    [m m] = size(val);
    liczba_krawedzi = sum(sum(val));

    tic;
    tarjan(val);
    time = toc;
    disp(time);
    
    % zapis do pliku
    
    fprintf(fid,'%f\t%d\t%d\n',time, m, liczba_krawedzi);
    

end    

fclose(fid);


end
