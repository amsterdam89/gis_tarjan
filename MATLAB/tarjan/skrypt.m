function [ ] = skrypt( )
%SKRYPT Summary of this function goes here
%   Detailed explanation goes here


pathFile = 'C:/Users/amsterdam/Documents/MATLAB/gis/grafy/m_';
pathSave = 'wyniki/w_';

txt = '.txt';

iterator_wierzcholki = [20, 40, 60, 80, 100, 250];
iterator_krawedzie = [10, 20, 30, 40, 50, 60, 70, 90, 100]; %procenty

ilosc = 25;

[m , n] = size(iterator_wierzcholki);
[m_k , n_k] = size(iterator_krawedzie);


for i = 1 : n
    
    num = num2str(iterator_wierzcholki(i));
    
    for j = 1 : n_k
        
        num_k = num2str(iterator_krawedzie(j));
        name = strcat(pathFile,num,'_',num_k,'_');
        name_save = strcat(pathSave,num,'_',num_k,txt);
        
        start( name, ilosc, name_save )

    end
    
end


end
