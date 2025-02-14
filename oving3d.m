%% d)

t = [0, 0.4, 0.8, 1.2, 1.6, 2];
u = [0, 0.32, 1.28, 2.88, 5.12, 8.0];
y = [0, 0.064, 0.384, 1.216, 2.816, 5.44];
v = [0, 0.8, 2.4, 4, 5.6, 7.2];

figure
subplot(3,1,1)
plot(t,y,'bo:')
xticks(t)
subplot(3,1,2)
plot(t,u,'ko:')
xticks(t)
subplot(3,1,3)
plot(t,v,'ro:')
xticks(t)
