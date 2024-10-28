function [] = PlotPhotonTrajecetories(traj,Ntraj,p0,p1)
%PLOTPHOTONTRAJECTORIES Plot the photon trajectories of MMC
%   INPUT:
%           traj:   outpt structure of mmclab
%           Ntraj:      number of trajectories to plot
%           p0,p1:  bounding box
% Author: Andrea Farina Polimi/CNR         October 2024

%Ntraj = double(max(traj.id));
colormap = jet;%(NtrajPlot + 1);
% init plot
figure(100),
subplot(1,2,1),axis image, grid on, hold on,
xlim([p0(1),p1(1)]),ylim([p0(2),p1(2)]),zlim([p0(3),p1(3)]),view([-43,55]),
xlabel('x'), ylabel('y'), zlabel('z'),
figure(100),
subplot(1,2,2),axis image, grid on, hold on
xlim([p0(1),p1(1)]),ylim([p0(3),p1(3)]),
xlabel('x'), ylabel('z'),
% plot
for it = 0:Ntraj
    pos = traj.pos(traj.id == it,:);
    %plotmesh(cfg.node,face,'x>0','facecolor','white')
    color = colormap(ceil(rand*255), :);
    for i = 1:size(pos,1)-1
        subplot(1,2,1),plot3([pos(i,1);pos(i+1,1)],[pos(i,2);pos(i+1,2)],[pos(i,3);pos(i+1,3)],'.-','Color',color),
        subplot(1,2,2),plot([pos(i,1);pos(i+1,1)],[pos(i,3);pos(i+1,3)],'.-','Color',color),
        drawnow;
    end
end
end