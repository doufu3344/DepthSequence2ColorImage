function colorimage = depth2color( grayimage )
%GRAY2COLOR 此处显示有关此函数的摘要
%   此处显示详细说明
    [col,row]=size(grayimage);
    colorimage = zeros(col,row,3);
	maxd = max(max(grayimage));
    mind = mean(grayimage(grayimage>=400))-48;
    for m = 1:col
        for n = 1:row
            depth = grayimage(m,n);
%             gray = (double(depth)/double(maxdepth))*double(255);
            gray = (double(depth-mind))/double((maxd-mind))*double(255);
            colorimage(m,n,:) = pixel(gray);
        end
    end
end

function value = pixel(gray)
% if gray == 0
%     r = 0; g = 0; b = 130;
% elseif 0<gray && gray<=15
%     r = 1; g = 8; b = 255;
% elseif 16<=gray && gray<=31
%     r = 2; g = 48; b = 254;
% elseif 32<=gray && gray<=47
%     r = 4; g = 112; b = 252;
% elseif 48<=gray && gray<=63
%     r = 8; g = 160; b = 248;
% elseif 64<=gray && gray<=79
%     r = 16; g = 192; b = 240;
% elseif 80<=gray && gray<=95
%     r = 32; g = 224; b = 224;
% elseif 96<=gray && gray<=111
%     r = 64; g = 248; b = 192;
% elseif 112<=gray && gray<=127
%     r = 128; g = 255; b = 160;
% elseif 128<=gray && gray<=143
%     r = 160;g = 255; b = 128;
% elseif 144<=gray && gray<=159
%     r = 192; g = 248; b = 64;
% elseif 160<=gray && gray<=175
%     r = 224; g = 224; b = 32;   
% elseif 176<=gray && gray<=191
%     r = 240; g = 192; b =16;
% elseif 192<=gray && gray<=207
%     r = 248;g = 160; b = 8;
% elseif 208<=gray && gray<=223
%     r = 252; g = 112; b = 4;
% elseif 224<=gray && gray<=239
%     r = 254; g = 48; b = 2;
% elseif 240<=gray && gray<=255
%     r = 255; g = 8; b = 1;
% end

tmp2 = gray;
if tmp2 == 0
    b = 130;
    g = 0;
    r = 0;
elseif tmp2 <= 51
    b = 255;
    g = tmp2*5;
    r = 0;
elseif tmp2 <= 102
    tmp2 = tmp2 - 51;
    b = 255-tmp2*5;
    g = 255;
    r = 0;
elseif tmp2 <= 153
    tmp2 = tmp2 - 102;
    b = 0;
    g = 255;
    r = tmp2*5;
elseif tmp2 <= 204
    tmp2 = tmp2 - 153;
    b = 0;
    g = 255-(128.0*tmp2/51.0+0.5);
    r = 255;
else
    tmp2 = tmp2 - 204;
    b = 0;
    g = 127-(127.0*tmp2/51.0+0.5);
    r = 255;
end;

value = [r;g;b];
return;
end
