function [ENF,Fs] = ENF_Extract(x,example_length)

freq_resolution=18;
time_resolution=5;                   %time resolution of one ENF sample; taken in seconds
L=7;  %number of harmonics taken into consideration in spectrum combining
% ==========================================
[x,Fs] = audioread(x);

        if rem(length(x),time_resolution*Fs) ~=0  %remove any data more than multiples of 5 seconds
         x=x(1:(end-rem(length(x),time_resolution*Fs)));   
        end
detected_nominal = calc_nominal(x,Fs,freq_resolution,L);

%now we split data into parts of 10 minutes 
        first_minutes = x(1:(end-rem(length(x),example_length*60*Fs)));
        first_minutes = reshape(first_minutes,example_length*60*Fs,(length(first_minutes))/(example_length*60*Fs)) ; 
%         last_minutes = x((end-rem(length(x),example_length*60*Fs))+1:end);

    for i=1:size(first_minutes,2)                % or ENF_first_minutes =calc_dominant(first_minutes,Fs,detected_nominal,freq_resolution,L);
        ENF_first_minutes(i,:) = calc_dominant(first_minutes(:,i),Fs,detected_nominal,freq_resolution,L);
        [~,number_of_features] = feature_extract(ENF_first_minutes(i,:));
    end
    
% ENF_last_minutes =calc_dominant(last_minutes,Fs,detected_nominal,freq_resolution,L);   %separated them for dimension mismatch ;; will be equal after feature extract
ENF=ENF_first_minutes;  

% =============================================================

end
