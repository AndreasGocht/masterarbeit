function teleprompt(s)
%TELEPROMPT prints to the command window, over-writing the last message
%
%       TELEPROMPT(S)
%       TELEPROMPT()      % Terminate
%
%       Input S is a string.
%QUELLE: http://stackoverflow.com/questions/15828361/matlab-how-to-remove-a-line-break-when-printing-to-screen


persistent lastMsg

if isempty(lastMsg)
    lastMsg = '';
end

if nargin == 0
    lastMsg = [];
    fprintf('\n');
    return
end

fprintf(repmat('\b', 1, numel(sprintf(lastMsg))));
fprintf(s);

lastMsg = s;
