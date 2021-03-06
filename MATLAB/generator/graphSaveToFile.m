function [] = graphSaveToFile( option, pathFile, m, numberOfEdges )
%GRAPHSAVETOFILE Summary of this function goes here
%   Detailed explanation goes here

if nargin < 1
  error('option :  a is a required input')
end

if nargin < 2
  pathFile = 'matrix_1.txt';
end

if nargin < 3
  m = 10;
end

if nargin < 4
  numberOfEdges = 28;
end



    if option == 1
        % generator grafow o zadanej wielkosci i liczbie wierzcholkow
        [ a ] = graphGenerator( m, numberOfEdges );
    elseif option == 2
        % mozna tez podejsc inaczej do zagadnienia lecz bez mozliwosci
        % uwzglednienia liczby krawedzi
        a = randint(m,m);
        for k = 1 : m
            a(k,k) = 0;
        end
    elseif option == 3
        % mozna tez podejsc do zagadnienia generujac nieintowa macierz by
        % potem ustawic skok zmiany na 0 b�d� 1 , nie uwzglednienia liczby krawedzi
        level = 0.5; % nasz skok
        a = rand(m,m);
        for k = 1 : m
            for j = 1 : m
                if k == j
                    a(k,j) = 0;
                else
                    if a(k,j) > level
                        a(k,j) = 1;
                    else
                        a(k,j) = 0;
                    end
                end
            end
        end
        
    elseif option == 4
        % graf pelny
        a = ones(m,m);
        for k = 1 : m
            a(k,k) = 0;
        end
        
    else
        %graf pusty
        a = zeros(m,m);
        
    end
    
    file = fopen(pathFile,'w');
    fprintf(file,'%i\n',m);
    for j = 1 : m
        for jj = 1 :m
            fprintf(file,'%i\t', a(j,jj) );
        end
        fprintf(file,'\n');
    end
    fclose(file);

end
