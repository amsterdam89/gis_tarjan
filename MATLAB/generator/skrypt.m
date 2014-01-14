function [ ] = skrypt( )
%SKRYPT Summary of this function goes here
%   Detailed explanation goes here


pathFile = 'grafy/m_';

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
        
        krawedzie = ( iterator_wierzcholki(i) * iterator_wierzcholki(i) - iterator_wierzcholki(i) ) * (iterator_krawedzie(j) / 100 ) ; 
        krawedzie = floor(krawedzie);
        
        for k = 1 : ilosc
            
            nr = num2str(k);
            name = strcat(pathFile,num,'_',num_k,'_',nr,txt);
            
            graphSaveToFile( 1, name, iterator_wierzcholki(i), krawedzie );
            
        end

    end
    
end




end
