
N = 300; % number of cells
M =100; % number of time-slices for output 

m = 20; % number of time-steps between slices
         % total number of time-steps = T = m * M

s       = zeros(1,N);  % lattice configuration before and after the time-step
snew    = zeros(1,N);  % lattice configuration intermediate to make one time-step
s_aver  = zeros(M+1,N);% averaged lattice configuration
v_aver  =  zeros(M+1,N);
randval = zeros(1,N+1); % array of random values



delta_t =1/100; 
q=3*delta_t; % Input rate 
p=4*delta_t; % The rate of transfer of one single data between cells 
MC=1000;     % The number of samples (trajectories)1
T = M*m;    % total number of steps

for j=1:MC
    
    s = zeros(1,N);
    num_nonzero = 1; % number of non-zero cells
    
    
    for num_slice = 1:M    
        for i = 1:m
            
            % BEGIN one time-step
            snew = s;
            randval = rand(1,num_nonzero+2);
            
            % boundary condition
             if randval(1) <=q 
%             if randval(1) <=(sin(((num_slice -1)*m+i)*delta_t)+2)*delta_t
                snew(1)=s(1)+1;
            end
            
            % transition k -> k+1
            for k=1:num_nonzero
%                 z(k)=sum(s(k+1:N));
                %if (s(k) > 0)&(randval(k+1) < p*s(k)) 
                if randval(k+1) <= p*v(s(k))
                       snew(k)   = snew(k)-1;
                        snew(k+1)= snew(k+1)+1;
%                          snew(k+1) = snew(k+1) + s(k);
%                          snew(k)   = 0;
%                         
                end;
            end;
        
            s = snew;
            if s(num_nonzero+1) > 0
                num_nonzero = num_nonzero + 1;
            end;
            
        end;
        % it changes s, m times and then after that it puts in a matrix called: s_aver and on row : num_slice+1
      
 
        s_aver(num_slice+1,:) = s_aver(num_slice+1,:) + s;
        v_aver(num_slice+1,:) = v_aver(num_slice+1,:) + v(s);
        

    end;
    
end; 
    
s_aver = s_aver / MC;  
  v_aver = v_aver / MC;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = linspace(0, T*delta_t,M+1);
x = linspace(0, N, N);
 y0 = zeros(N,1);
 [t,y] = ode23(@(t,y) odefun(t,y), t, y0);
 
clf;
subplot(3,1,1)
plot(t,s_aver(:,1))
hold on
plot(t,y(:,1))
title('\rho(1),p=4,q=3,sigma_*=4,S=4.5283')
ax = gca;
ax.TitleFontSizeMultiplier = 2;

subplot(3,1,2)
plot(t,s_aver(:,5))
hold on
plot(t,y(:,5))
title('\rho(5)),p=4,q=3,sigma_*=4,S=4.5283')
ax = gca;
ax.TitleFontSizeMultiplier = 2;

subplot(3,1,3)
plot(t,s_aver(:,10))
hold on
plot(t,y(:,10))
title('\rho(10),p=4,q=3,sigma_*=4,S=4.5283')
ax = gca;
ax.TitleFontSizeMultiplier = 2;



%%%%%%%%% Finding limit point for mean
sum1=0;
sum2=0;
   for i=1:100
       prod=1;
       for k=1:i
           prod=prod*v(k);
       end
       sum1=sum1+i*((q/p)^i)/prod;
       sum2=sum2+((q/p)^i)/prod;
       
   end
   S=sum1/(1+sum2) % limit of density as t goes to infinity which is the same for all sites
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
