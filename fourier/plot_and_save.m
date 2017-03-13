function err = plot_and_save(B_entw,B_real,axis,path,pic_name,size,xlable,ylable,y_lim)
    switch nargin
        case 8
            y_lim ='auto';
    end
    fonst_size = 16;
%function err = plot_and_save(B_entw,B_real,axis,path,pic_name,size,xlable,ylable)
    pos = figure;
    set(pos,'defaulttextinterpreter','latex');
    set(gca,'FontSize',fonst_size)
    plot(axis,B_entw,'b',axis,B_real,'r');
    legend({'Entwicklung','reale Werte'})
    xlabel(['\fontsize{' num2str(fonst_size) '}{0}' xlable ''])
    ylabel(['\fontsize{' num2str(fonst_size) '}{0}' ylable ''])
    ylim(y_lim)
    set(pos,'Position',[1 1 size],'PaperUnits', 'points','papersize', size,'PaperPosition', [0 0 size])
    saveas(pos,[path pic_name],'psc2')

    err = sum((B_entw-B_real).^2)/sum((B_real).^2);
end