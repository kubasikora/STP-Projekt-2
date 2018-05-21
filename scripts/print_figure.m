function [] = print_figure(name, d)
    % Wyjdz z folderu scripts
    folder = pwd();
    cd('../')
    
    % Stwórz folder na wykresy jeœli jeszcze nie istnieje
    if(exist('figures', 'dir') == 0)
        mkdir('figures'); 
    end
    
    if(exist(d, 'dir') == 0)
        mkdir(d); 
    end
    
    % Zapis wykresu do pliku
    set(gcf, 'Units','Inches');
    pos = get(gcf, 'Position');
    set(gcf, 'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
    print(gcf, name,'-dpdf','-r400');
    hold off;
    
    cd(folder) 
    
end

