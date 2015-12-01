%while(1)
for i=1:1:1000
    file = importdata('messages.log');
    %file = importdata('messageb.log');
    magdata = file.data;
    figure(1);
    
    plot3(magdata(:,1), magdata(:,2), magdata(:,3),'r*');
    xlabel('magX');
    ylabel('magY');
    zlabel('magZ');
    axis equal;
    x = round(rand(1) + 0.3);
    y = round(rand(1) + 0.3);
    z = round(rand(1) + 0.3);
    if( (x==0) && (y==0) && (z==0))
        x = 1;
        y = 1;
        z = 1;
    end
    view([ x, y, z]);
    %disp(i);
    pause(1);
end

%end
