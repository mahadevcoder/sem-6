data = load('modified_iris.txt');
desired_out=data(1:100)';
input=data(:,2:5);
num=100;
bias=-1;
coeff=0.7;
rand('state',sum(100*clock));
weights=-1*2.*rand(5,1);

for i=1:100
	out=zeros(100,1);
	for j=1:num
		y = bias*weights(1,1)+input(j,1)*weights(2,1)+input(j,2)*weights(3,1)+input(j,3)*weights(4,1)+input(j,4)*weights(5,1);
		out(j)=1/(1+exp(-y));
		delta = desired_out(j)-out(j);
		weights(1,1) = weights(1,1)+coeff*bias*delta;
		weights(2,1) = weights(2,1)+coeff*input(j,1)*delta;
		weights(3,1) = weights(3,1)+coeff*input(j,2)*delta;
		weights(4,1) = weights(4,1)+coeff*input(j,3)*delta;
		weights(5,1) = weights(5,1)+coeff*input(j,4)*delta;
	endfor
endfor

display(weights)
