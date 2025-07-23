function v = getNearestVertex(mbvq, r, g, b)
% getNearestVertex: find nearst vertex in the given MBVQ for a target pixel
% 
% INPUT:
% mbvq (char array): the mbvq the target pixel is related to
% R, G, B (range:0~1): the R, G, B channel value of the target pixel
% 
% OUPUT:
% vertex (char array): the name of the closest vertex
% 
% Ref: "Color Diffusion: Error-Diffusion for Color Halftones
% by Shaked, Arad, Fitzhugh, and Sobel -- HP Labs
% Hewlett-Packard Laboratories TR 96-128
% and Electronic Imaging, Proc. SPIE 3648, 1999
% Adapted from Halftoning Toolbox Version 1.2 released July 2005 (Univ. of Texas)
% No.1 for CMYW
    if (mbvq == 'CMYW')
        vertex = 'white';
        if (b < 0.5)
            if (b <= r)
                if (b <= g)
                    vertex = 'yellow';
                end
            end
        end
        if (g < 0.5)
            if (g <= b)
                if (g <= r)
                    vertex = 'magenta';
                end
            end
        end
        if (r < 0.5)
            if (r <= b)
                if (r <= g)
                    vertex = 'cyan';
                end
            end
        end
    end


% No.2 for MYGC
    if (mbvq == 'MYGC')
        vertex = 'magenta'; 
        if (g >= b)
            if (r >= b)
                if (r >= 0.5)
                    vertex = 'yellow';
                else
                    vertex = 'green';
                end
            end
        end
        if (g >= r)
            if (b >= r)
                if (b >= 0.5)
                    vertex = 'cyan'; 
                else
                    vertex = 'green';
                end
            end
        end
    end


% No.3 for RGMY
    if (mbvq == 'RGMY')
        if (b > 0.5)
            if (r > 0.5)
                if (b >= g)
                    vertex = 'magenta';
                else
                    vertex = 'yellow';
                end
            else
                if (g > b + r)
                    vertex = 'green';
                else 
                    vertex = 'magenta';
                end
            end
        else
            if (r >= 0.5)
                if (g >= 0.5)
                    vertex = 'yellow';
                else
                    vertex = 'red';
                end
            else
                if (r >= g)
                    vertex = 'red';
                else
                    vertex = 'green';
                end
            end
        end
    end


% No.4 for KRGB
    if (mbvq == 'KRGB')
        vertex = 'black';
        if (b > 0.5)
            if (b >= r)
                if (b >= g)
                    vertex = 'blue';
                end
            end
        end
        if (g > 0.5)
            if (g >= b)
                if (g >= r)
                    vertex = 'green';
                end
            end
        end
        if (r > 0.5)
            if (r >= b)
                if (r >= g)
                    vertex = 'red';
                end
            end
        end
    end


% No.5 for RGBM
    if (mbvq == 'RGBM')
        vertex = 'green';
        if (r > g)
            if (r >= b)
                if (b < 0.5)
                    vertex = 'red';
                else
                    vertex = 'magenta';
                end
            end
        end
        if (b > g)
            if (b >= r)
                if (r < 0.5)
                    vertex = 'blue';
                else
                    vertex = 'magenta';
                end
            end
        end
    end


% No.6 for CMGB
    if (mbvq == 'CMGB')
        if (b > 0.5)
            if ( r > 0.5)
                if (g >= r)
                    vertex = 'cyan';
                else
                    vertex = 'magenta';
                end
            else
                if (g > 0.5)
                    vertex = 'cyan';
                else
                    vertex = 'blue';
                end
            end
        else
            if ( r > 0.5)
                if (r - g + b >= 0.5)
                    vertex = 'magenta';
                else
                    vertex = 'green';
                end
            else
                if (g >= b)
                    vertex = 'green';
                else
                    vertex = 'blue';
                end
            end
        end
    end
R=255*[1;0;0]; G=255*[0;1;0]; B=255*[0;0;1];
C=255-R; M=255-G; Y=255-B;
W=255*[1;1;1];K=[0;0;0];

if strcmp(vertex,'red')
    v=R;
elseif strcmp(vertex,'green')
    v=G;
elseif strcmp(vertex,'blue')
    v=B;
elseif strcmp(vertex,'magenta')
    v=M;
elseif strcmp(vertex,'cyan')
    v=C;
elseif strcmp(vertex,'yellow')
    v=Y;
elseif strcmp(vertex,'white')
    v=W;
else
    v=K;
end
v=reshape(v,[1,1,3]);
end %function