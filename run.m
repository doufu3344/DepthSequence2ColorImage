clear;close all;clc;

info = setParams;
if(~exist(info.imagespath,'dir'))
    mkdir(info.imagespath);
end
for i = 12:info.ncls
    idxcls = sprintf('a%02d', i);
    for j = 1:info.nsbj
        idxsbj = sprintf('s%02d', j);
        for k = 1:info.nemp
            idxemp = sprintf('e%02d', k);
            disp(['save depth sequence to color images: ', idxcls, '_', idxsbj, '_', idxemp, ' ......']);
            fileh = fopen([info.vidpath,'\',idxcls, '_', idxsbj, '_', idxemp,'_sdepth.bin']);
            imageDir = [info.imagespath,'\',idxcls, '_', idxsbj, '_', idxemp,'_frame'];
            if(exist(imageDir,'dir'))
                rmdir(imageDir,'s');
            end
            mkdir(imageDir);
            if(fileh<0)
                disp('no such file');
                return;
            end
            filehead = fread(fileh,3,'uint=>uint');
            for f = 1:filehead(1)
                val = fread(fileh,filehead(2)*filehead(3),'uint=>uint');
                val = reshape(val,[filehead(2) filehead(3)]);
                val = val';
                idxframe = sprintf('Frame_%03d',f);
                colorimage = depth2color(val);
                colorimage = uint8(colorimage);
                imagePath = [imageDir,'\',idxframe,'.jpg'];
                imwrite(colorimage,imagePath);
            end
	    fclose(fileh);
        end;
    end;
end;