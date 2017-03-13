function [ h ] = plot3c(X,Y,Z,B)
%Plot X,Y,Z colored, depending on B
% X,Y,Z,B have to be vectors
h = figure;
hold on

hig = max(B);
low = min(B);

caxis([min(B) max(B)])
colors=colormap('jet');
m = length(colors);

s=size(X);

k=0;
for i=1:s(1)
    for j=1:s(2)
        k = k+1;
        
        %Zylindrisch
        P(k,1) = X(i,j);
        P(k,2) = Y(i,j);
        P(k,3) = Z(i,j);
    end
end

for i=1:k
    ind = fix((B(i)-low)/(hig-low)*m)+1;
    ind(ind<1) = 1;
    ind(ind>m) = m; 
    c = colors(ind,:);
    plot3(P(i,1),P(i,2),P(i,3),'LineStyle','none','Marker','.','MarkerEdgeColor',c,'MarkerFaceColor',c);
end

end
