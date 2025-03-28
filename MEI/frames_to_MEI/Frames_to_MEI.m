img_fld = "All_frames_1"; # image folder
img_url = dir(fullfile(img_fld ,"*.png")); # We get the frames as "png".
          clr = [240 10 10]; # Which color do you want to track? Write its RGB color code. We write the RGB color code of the red color.
I_sil = zeros(270,480);
cnt = 1;
num = length(img_url);
    for   i = 40:num-20 # How many frames do you want to use for merging and tracking, set it from here.
    I = imread(fullfile(img_url(i).folder , img_url(i).name));
    Ix = imresize(I , [270,480 ]); # Make it resize 
    [L,centers] = imsegkmeans(Ix,15); # Get binary image using L mask.
    dist = sum(( double(centers) - clr).^2,2); # Take all as binary.
    [~,min_ind] = min(dist);
    I_sil = I_sil + double(L == min_ind);
        if mod(i,10) == 0
        disp(i)
        end
    cnt = cnt + 1;
    end
I_sil = I_sil / cnt;
figure,
imshow( I_sil , [] )
imwrite(I_sil,'1.png');


