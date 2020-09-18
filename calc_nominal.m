
function [detected_nominal] = calc_nominal(x,Fs,freq_resolution,L)
%this function detects nominal frequency from a time domain recording

%for determining nominal:
            fb=1;
            NFFT=2^freq_resolution;
            f_spacing=Fs/(NFFT-1);              %frequency spacing ; it is how many hertz between two samples 
            step=round(1/f_spacing);            %how many samples for 1 hertz
total_spect=abs(fft(x,NFFT));
total_spect=total_spect(1:length(total_spect)/2);
freq=(0:length(total_spect)-1)* f_spacing;   %for visualization only
filtered_total_spect=zeros(size(total_spect));

        for i=1:L   
            range_50=round(50*step*i-step*fb-0.35*step*i):round(50*step*i+step*fb-0.35*step*i);  %some impirical stuff to adjust filter :)
            range_60=round(60*step*i-step*fb-0.42*step*i):round(60*step*i+step*fb-0.42*step*i);
         filtered_total_spect(range_50)=total_spect(range_50);
         filtered_total_spect(range_60)=total_spect(range_60);   
        end 

 range_300=round(300*step-step*fb-0.4*step*5):round(300*step+step*fb-0.4*step*5);%filtering out the misleading 300 component
 filtered_total_spect(range_300)=zeros(size(range_300)); %filtering out the misleading 300 component
 
 
% figure; plot(freq,filtered_total_spect)
% figure;  plot(freq,total_spect)

% now detect :) 
peak =mean(find(filtered_total_spect==max(filtered_total_spect)))*f_spacing ;


        if abs(round(peak/50)-peak/50)< abs(round(peak/60)-peak/60);
           detected_nominal=50;  
        else
           detected_nominal=60;    
        end


end%-------end function
