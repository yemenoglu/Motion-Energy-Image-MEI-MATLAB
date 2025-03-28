img_fld = "All_frames_1";
img_url = dir(fullfile(img_fld ,"*.png"));
          clr = [240 10 10];
I_sil = zeros(270,480);
cnt = 1;
num = length(img_url);
    for   i = 40:num-20
    I = imread(fullfile(img_url(i).folder , img_url(i).name));
    Ix = imresize(I , [270,480 ]);
    [L,centers] = imsegkmeans(Ix,15);
    dist = sum(( double(centers) - clr).^2,2);
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


