function Gy_2d = Gy_2d_op(sigma, dx, dy)
%function Gy_2d = Gy_2d_op(sigma, dx, dy)
%
% dG/dy operator with operator shift
%
% (c) LEMS, Brown University
% Amir Tamrakar (amir_tamrakar@brown.edu)
% October 2007

% the size of the operator
w = ceil(sigma*4 + max(abs(dx), abs(dy)));
[x,y] = meshgrid(-w:w,-w:w);

G_x = exp(-(x-dx).^2/(2*sigma^2))/sqrt(2*pi)/sigma;
dG_y = -(y-dy).*exp(-(y-dy).^2/(2*sigma^2))/sqrt(2*pi)/sigma^3;
Gy_2d = G_x.*dG_y;

% % for debug only
% figure;
% axis([-w w -w w]);
% imagesc([-w:w],[-w:w], Gy_2d); colormap gray;
% hold on;
% th=linspace(0,2*pi,64+1);
% pp=[2.5*Ns*cos(th'), 2.5*Ts*sin(th')];
% pp = pp*[cos(theta+pi/2) sin(theta+pi/2); -sin(theta+pi/2) cos(theta+pi/2)];
% %shift 
% pp(:,1) = pp(:,1)+dx;
% pp(:,2) = pp(:,2)+dy;
% plot(pp(:,1), pp(:,2), 'r', [pp(17,1), pp(49,1)], [pp(17,2), pp(49,2)], 'r', [pp(1,1), pp(33,1)], [pp(1,2), pp(33,2)], 'r');
% axis equal;
% hold off;




