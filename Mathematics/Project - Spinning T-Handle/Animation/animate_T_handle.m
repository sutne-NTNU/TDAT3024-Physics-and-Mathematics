function animate_T_handle(init_Handle, init_Shaft, X_all, time_interval, filename)

% Calculating how many, and which frames to render for the animation 
% to match the "real speed" of the T-handle at the desired FPS 
% this means that the length of the animation is equal to the time_interval
FILE = strcat('./Animation/Rendered/', filename);
PLAYBACK_SPEED = 5;
FPS = 24;

% number of calculated positions
n = length(X_all); 
% time for animation
time = time_interval(2) - time_interval(1);
% number of frames we need to render to get correct FPS
numberOfFrames = FPS * time;
% that means the gap bewtween each calulcated position we need is
frameGap = 1/(numberOfFrames/n);

% render the frames evenly distributed among the available ones
frameNR = 0;
figure('visible','on')
set(gcf, 'Position',  [100, 100, 600, 600])
for i=0: frameGap : n-1
	frameNR = frameNR + 1;
	
	% Find index of X_all for this frame
	index = round(i) + 1;
	
	% Draw t-handle in current position
	current_position = X_all{index};
	draw_T_handle_animated(init_Handle, init_Shaft,  current_position);
	
	% save the frame
	frames(frameNR) = getframe();

	saveTo_Gif(frames(frameNR), frameNR);
end
% saveTo_MP4(frames);


function saveTo_Gif(frame, frameNR)
% Write rendered frames to .gif
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 
if frameNR == 1 
    imwrite(imind, cm, strcat(FILE, '.gif'),'gif', 'DelayTime',1/(FPS*PLAYBACK_SPEED),'Loopcount',inf); 
else 
    imwrite(imind, cm, strcat(FILE, '.gif'),'gif','DelayTime',1/(FPS*PLAYBACK_SPEED), 'WriteMode','append'); 
end 
end

function saveTo_MP4(frames)
% Write rendered frames to .mp4
movieWriter = VideoWriter(FILE,'MPEG-4');
movieWriter.FrameRate = FPS * PLAYBACK_SPEED;
movieWriter.Quality = 100;
open(movieWriter);
writeVideo(movieWriter, frames);
end

end
