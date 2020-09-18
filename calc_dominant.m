
function [y] = calc_dominant(x,Fs,detected_nominal,freq_resolution,L)
%this function takes a sound column vector and returns a row vector of ENF

%% initializations:
%------------
            nominal=detected_nominal;                        %will calculate at both then compare and consider only that with mor power
            NFFT=2^freq_resolution;                 % number of bits for FFT
            f_spacing=Fs/(NFFT-1);              %frequency spacing ; it is how many hertz between two samples 
            step=round(1/f_spacing);            %how many samples for 1 hertz
            time_resolution=5;                        % i mean the 15 seconds window
            signal_threshold=0.8;                   %power value is taken inside this ,, it is in Hertz ,, represents max ENF variance
            fb = 1.2 ;                %not to lose any harmonics ENFs
            window_shift = 5;        %for one second , if i shift window by one , i.e. overlap = 5-2*1=3 ....
                                     % for no overlap put it = time_resolution
%             Overlap_factor = time_resolution / overlap_shift; % ENF length will increase by that factor
            
     ENF_length=1+(length(x)-time_resolution*Fs)/(window_shift*Fs);       
     reshaped_x = zeros(time_resolution*Fs,ENF_length) ; %to split into segments of 5 seconds , overlapping
     for j=1:ENF_length
         reshaped_x(:,j) = x(1+(j-1)*window_shift*Fs:time_resolution*Fs+(j-1)*window_shift*Fs,1) ;
     end
            
            
% reshaped_x = reshape((x(:,1)),time_resolution*Fs,(Overlap_factor)*(length(x))/(time_resolution*Fs)) ; %to split into segments of 5 seconds
y= zeros(1,size(reshaped_x,2));
powering_factor=3;                      %spectrum is to the power 3 ; to emphasize ENF from noise; don't use very large number or u'll get infinities

% ==============================================================================================================================
%% main loop:
%------------

for i=1:size(reshaped_x,2) %for operation on rows ; i.e. every loop represents 5 seconds   
    
            segment = reshaped_x(:,i);
            spectr= abs(fft(segment,NFFT));     %getting fourrier transform 
            spectr = spectr(1:NFFT/2);          %dropping insignificant second part 
            spectr=spectr.^powering_factor;
            freq=(0:length(spectr)-1)* f_spacing;   %for visualization only

%  ------------ loop initializations             
     weighted_spectra=zeros(L,length(spectr)); %size definition for speed
     spectral_weights=zeros(1,L); %two rows each has spectral_weights of ENF extracted with a nominal freq,,, size definition for speed
     combined_spectrum=zeros(1,length(spectr)); %,, two rows each has combined spectr of ENF extracted with a nominal freq,,, size definition for speed 
%  ------------    

  for k=1:L %loop on harmonics:
     %  ------------ 
     
          observation_window=[zeros(1,-1+ceil(k*(nominal-fb-0.32)*step)) ones(1,1+2*floor(k*fb*step)) ]; 
          observation_window=[observation_window zeros(1,length(spectr)-length(observation_window))];
        pure_signal_window=[zeros(1,-1+ceil((nominal-signal_threshold-0.32)*step)) ones(1,1+2*floor(signal_threshold*step))];
        pure_signal_window=[pure_signal_window zeros(1,length(spectr)-length(pure_signal_window))];
        observation=spectr.*observation_window';     
        down_observation = downsample(observation,k) ; 
        down_observation=[down_observation ; zeros((length(spectr)-length(down_observation)),1)];  %adjusting length

        pure_signal=down_observation.*pure_signal_window';
%         hold on;plot(pure_signal)

        signal_power= sum(pure_signal.^2)/(2*signal_threshold);
        noise_power= (sum((down_observation).^2)-sum((pure_signal).^2))/(2*fb);
        SNR=signal_power/noise_power;
        spectral_weights(k)=SNR;  
        weighted_signal=pure_signal.*SNR; 
        weighted_spectra(k,:)=weighted_signal;
                    
        % figure; plot(freq,spectr)  
        % figure; plot(freq,observation_window')  
        % figure; plot(freq,observation)
        % figure; plot(freq,down_observation)
        % figure; plot(freq,pure_signal_window)
        % figure; plot(freq,pure_signal)
  end    %harmonics loop
  %  ------------    
  combined_spectrum(1,:) = sum(weighted_spectra,1); %two of them, each for a nominal

%--------------------------------------------------
    y(i) =mean(find(combined_spectrum(1,:)==max(combined_spectrum(1,:))))* f_spacing ; %mean taken in case resolution isn't good enough and finds multiple maxima

%-------------------------------------------------- 
%to fix a strange error in training data; that sometimes segment is just zeroes and we get NaN for ENF which causes an infinity error later
if  max(spectr)==0 ;
    y(i)=detected_nominal;
end    
%%  visualisation :
% if  i==size(reshaped_x,2) ;     %teseting stuff
%     freq=(0:length(spectr)-1)* f_spacing;   %for visualization only
% figure;subplot(3,1,1);plot(freq,spectr);subplot(3,1,2);plot(y)
% % subplot(3,1,3);spectrogram(x,time_resolution*1000,0,2^freq_resolution,1e3,'yaxis');colormap(jet);
% %  subplot(3,1,3);plot(freq,filtered_total_spect);
% % view(-77,72);
% % spectral_weights
% % combined_signal_power
% % detected_nominal
% k=y;
% save('k.mat','k');
% 
% end    
% %   
clear ('weighted_spectra','combined_spectrum','spectr','pure_signal_window','segment')
    
end %-------end the loop on segments
     
end%-------end function
