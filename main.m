clear

X = @(omega,tau) tau*CH7MP1(omega*tau/2);
omega = linspace(-4*pi,4*pi,200); 
plot(omega,X(omega,1),'k-',omega,X(omega,0.5),'k-.',omega,X(omega,2),'k--');
grid; axis tight; xlabel('\omega'); ylabel('X(\omega)'); 
legend('Baseline (\tau = 1)','Compressed (\tau = 0.5)','Expanded (\tau = 2.0)');