function [ ] = table( String,Value,latex )
%function [ ] = table( String,Value )
% erzeugt eine Tabelle, mit srting und dem Value dahinter
% latex = 0 erzeugt normale teabelle
% latex = 1 erzeugt eine tabelle im Latex format

if (~latex)
    fprintf('%-70s %e\n',String,Value)
else
    String = strrep(String,'_','\_');
    fprintf('%-70s & %e \\\\\\hline \n',String,Value)
end
    
end

