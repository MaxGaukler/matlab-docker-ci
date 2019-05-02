disp('This is an example')

% compute pi very inefficiently
x=0.1;
for i=1:12345678
    x = x + sin(x)*0.5;
end

disp(x);

save output/workspace.mat