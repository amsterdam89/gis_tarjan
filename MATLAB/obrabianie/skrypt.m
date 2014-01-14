function [ ] = skrypt( )
%SKRYPT Summary of this function goes here
%   Detailed explanation goes here


pathFile = 'C:/Users/amsterdam/Documents/MATLAB/tarjan/wyniki/w_';
pathSave = 'dane_wykres.txt';

txt = '.txt';

iterator_wierzcholki = [20, 40, 60, 80, 100, 250];
iterator_krawedzie = [10, 20, 30, 40, 50, 60, 70, 90, 100]; %procenty

ilosc = 25;

[m , n] = size(iterator_wierzcholki);
[m_k , n_k] = size(iterator_krawedzie);



fid=fopen(pathSave,'w');
fprintf(fid,'wierzcholki\tprocent_krawedzi\tilosc_krawedzi\tmin_t\t\t\tmax_t\t\t\tsredni_t\t\tsuma_t\n');
for i = 1 : n
    
    num = num2str(iterator_wierzcholki(i));
    
    for j = 1 : n_k
        
        num_k = num2str(iterator_krawedzie(j));
        name = strcat(pathFile,num,'_',num_k,txt);
        %name_save = strcat(pathSave,num,'_',num_k,txt);
        
        [ wierzcholki, krawedzie, min, max, sredni_czas, suma_t ] = loadData( name );
        
        fprintf(fid,'%d\t\t\t%d\t\t\t\t\t%d\t\t\t\t%f\t\t%f\t\t%f\t\t%f\t\t%f', wierzcholki, iterator_krawedzie(j), krawedzie, min, max, sredni_czas, suma_t);
        fprintf(fid,'\n');
    end

    
end

fclose(fid);

end
