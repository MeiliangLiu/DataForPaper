
s20520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s2-0520\timefreq_psd_231021_1240.mat';
s40520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s4-0520\timefreq_psd_231021_1245.mat';
s50520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s5-0520\timefreq_psd_231021_1248.mat';
s80520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s8-0520\timefreq_psd_231021_1249.mat';
s100520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s10-0520\timefreq_psd_231021_1252.mat';
s120520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s12-0520\timefreq_psd_231021_1253.mat';
s140520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s14-0520\timefreq_psd_231021_1254.mat';
s160520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s16-0520\timefreq_psd_231021_1255.mat';




s10520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s1-0520\timefreq_psd_231021_1237.mat';
s30520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s3-0520\timefreq_psd_231021_1244.mat';
s70520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s7-0520\timefreq_psd_231119_2249.mat';
s90520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s9-0520\timefreq_psd_231021_1250.mat';
s110520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s11-0520\timefreq_psd_231119_2319.mat';
s130520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s13-0520\timefreq_psd_231021_1254.mat';
s150520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s15-0520\timefreq_psd_240109_1023.mat';
s170520 = 'D:\brainstorm-db\Protocol01\data\eyeopen\s17-0520\timefreq_psd_240109_1026.mat';






PowerSpectralDensity_s20520 = load(s20520).TF;
PowerSpectralDensity_s40520 = load(s40520).TF;
PowerSpectralDensity_s50520 = load(s50520).TF;
PowerSpectralDensity_s80520 = load(s80520).TF;
PowerSpectralDensity_s100520 = load(s100520).TF;
PowerSpectralDensity_s120520 = load(s120520).TF;
PowerSpectralDensity_s140520 = load(s140520).TF;
PowerSpectralDensity_s160520 = load(s160520).TF;



PowerSpectralDensity_s10520 = load(s10520).TF;
PowerSpectralDensity_s30520 = load(s30520).TF;
PowerSpectralDensity_s70520 = load(s70520).TF;
PowerSpectralDensity_s90520 = load(s90520).TF;
PowerSpectralDensity_s110520 = load(s110520).TF;
PowerSpectralDensity_s130520 = load(s130520).TF;
PowerSpectralDensity_s150520 = load(s150520).TF;
PowerSpectralDensity_s170520 = load(s170520).TF;



for i=1:126
    c_s20520=10^12*PowerSpectralDensity_s20520(:,:,i);
    for j=1:50
     d_s20520(j,i)=10*log10(c_s20520(j,1));
    end
end

for i=1:126
    c_s40520=10^12*PowerSpectralDensity_s40520(:,:,i);
    for j=1:50
     d_s40520(j,i)=10*log10(c_s40520(j,1));
    end
end

for i=1:126
    c_s50520=10^12*PowerSpectralDensity_s50520(:,:,i);
    for j=1:50
     d_s50520(j,i)=10*log10(c_s50520(j,1));
    end
end

for i=1:126
    c_s80520=10^12*PowerSpectralDensity_s80520(:,:,i);
    for j=1:50
     d_s80520(j,i)=10*log10(c_s80520(j,1));
    end
end

for i=1:126
    c_s100520=10^12*PowerSpectralDensity_s100520(:,:,i);
    for j=1:50
     d_s100520(j,i)=10*log10(c_s100520(j,1));
    end
end

for i=1:126
    c_s120520=10^12*PowerSpectralDensity_s120520(:,:,i);
    for j=1:50
     d_s120520(j,i)=10*log10(c_s120520(j,1));
    end
end

for i=1:126
    c_s140520=10^12*PowerSpectralDensity_s140520(:,:,i);
    for j=1:50
     d_s140520(j,i)=10*log10(c_s140520(j,1));
    end
end

for i=1:126
    c_s160520=10^12*PowerSpectralDensity_s160520(:,:,i);
    for j=1:50
     d_s160520(j,i)=10*log10(c_s160520(j,1));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%exp

for i=1:126
    c_s10520=10^12*PowerSpectralDensity_s10520(:,:,i);
    for j=1:50
     d_s10520(j,i)=10*log10(c_s10520(j,1));
    end
end

for i=1:126
    c_s30520=10^12*PowerSpectralDensity_s30520(:,:,i);
    for j=1:50
     d_s30520(j,i)=10*log10(c_s30520(j,1));
    end
end

for i=1:126
    c_s70520=10^12*PowerSpectralDensity_s70520(:,:,i);
    for j=1:50
     d_s70520(j,i)=10*log10(c_s70520(j,1));
    end
end

for i=1:126
    c_s90520=10^12*PowerSpectralDensity_s90520(:,:,i);
    for j=1:50
     d_s90520(j,i)=10*log10(c_s90520(j,1));
    end
end

for i=1:126
    c_s110520=10^12*PowerSpectralDensity_s110520(:,:,i);
    for j=1:50
     d_s110520(j,i)=10*log10(c_s110520(j,1));
    end
end

for i=1:126
    c_s130520=10^12*PowerSpectralDensity_s130520(:,:,i);
    for j=1:50
     d_s130520(j,i)=10*log10(c_s130520(j,1));
    end
end

for i=1:126
    c_s150520=10^12*PowerSpectralDensity_s150520(:,:,i);
    for j=1:50
     d_s150520(j,i)=10*log10(c_s150520(j,1));
    end
end

for i=1:126
    c_s170520=10^12*PowerSpectralDensity_s170520(:,:,i);
    for j=1:50
     d_s170520(j,i)=10*log10(c_s170520(j,1));
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d_average=(d_s20520+d_s40520+d_s50520+d_s80520+d_s100520+d_s120520+d_s140520+d_s160520)/8;




d_average_20=(d_s10520+d_s30520+d_s70520+d_s90520+d_s110520+d_s130520+d_s150520+d_s170520)/8;





% d_average=10*log10(d_average);
% d_average_20=10*log10(d_average_20);


d_average_tranpose=d_average';
d_average_20_tranpose=d_average_20';



figure;
color = [ 128/255 0 128/255];
% 设置颜色映射，以确保每组数据颜色一致
x = 0:125;
% 循环绘制数据
for i = 1:50 % 假设有10组数据
    plot(x, d_average(i, :),'Color',color);
    hold on;
end




color_20= [1 140/255 0];

for i = 1:50 % 假设有10组数据
    plot(x, d_average_20(i, :),'Color',color_20);
    hold on;
end





