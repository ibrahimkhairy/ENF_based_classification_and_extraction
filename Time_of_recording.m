function [false_alarm_probabilities] = Time_of_recording(false_alarm_threshold_values)



% this function is an experiment of our time of recording authentication; it
% extract ENF from out power and audui recording that were recorder for sequential 24 hours in the same time.
% Power data is used as a reference data base; and audio data is
% crosscorrelated with reference power to detect time of recording from the
% shift in maximum crosscorrelation product of the audio example and power
% data. we split our audio data into 143 example, detected time of
% recording of every example and compared it with the exact time of
% recording that we know already. false alarm probavility was plotted
% versus false alarm threshold , it gives about 1.4% at threshold of 17
% minutes margin.
% please note that every example represents 10 minutes of recorded audio

%% to extract ENF from our recordings, it is already saved in 'team_recorded_data.mat' so we commented this section. This section takes about 10 minutes running when uncommented. 

% team_data_path ='C:\Users\Ibrah\Documents\MATLAB\SP cup data';
% Extract_Team_recorded_data(team_data_path)

%% cross correlate to find time shift
load('team_recorded_data','total_ENF_Audio','total_ENF_Power')
figure;subplot(2,1,1);plot(total_ENF_Power);title('total_ENF exteacted from power signal for 24 Hrs');
subplot(2,1,2);plot(total_ENF_Audio);title('ENF Extracted from audio signal for 24 Hrs');

detection_error=[];
recording_detection_example_length=10;
number_of_examples=(24*60/recording_detection_example_length )-1;
total_ENF_Audio = total_ENF_Audio(1:floor(length(total_ENF_Audio)/number_of_examples)*number_of_examples);

example_list=reshape(total_ENF_Audio,length(total_ENF_Audio)/number_of_examples ,number_of_examples);
example_list=example_list';
for audio_instant=1:size(example_list,1)

test_recording = example_list(audio_instant,:);  %first 10 minutes of the recording at starts_at_9.30-10.30_AM

    ENF_length=size(example_list,2);

    cross_correlation=[];

    for i=1:(length(total_ENF_Power)-length(test_recording))
        segment=total_ENF_Power(i:i+length(test_recording)-1);
        product = test_recording.* segment';
        segment_power=sum(abs(segment).^2);
        test_recording_power=sum(abs(test_recording).^2);
        cross_correlation = [cross_correlation  sum(product)/sqrt((segment_power*test_recording_power))];
    end

% figure;plot(cross_correlation)
delay = find(cross_correlation==max(cross_correlation)) ;
time_shift_in_seconds=60*delay*recording_detection_example_length/ENF_length;
%% this section is to display estimated time of recording 
% 
%     start_time_hours = 0; %if you start at 12:00 am for example ; if you want 1 pm put it as 13
%     start_time_minutes = 20;
%     start_time_seconds = 0;
% delay_in_hours=floor(time_shift_in_seconds/(60*60));
% delay_in_minutes=floor((time_shift_in_seconds/(60*60)-delay_in_hours)*60);
% delay_in_seconds=round((time_shift_in_seconds-60*delay_in_minutes-60*60*delay_in_hours));
% 
% Estimated_hour=start_time_hours+delay_in_hours;
% Estimated_minutes=start_time_minutes+delay_in_minutes;
% Estimated_seconds=start_time_seconds+delay_in_seconds;
% 
% if Estimated_minutes>=60
%     Estimated_minutes=Estimated_minutes-60;
%     Estimated_hour=Estimated_hour+1;
% end
%  time_period='am';
% if Estimated_hour>=12
%     time_period='pm';
%    if Estimated_hour>12
%     Estimated_hour=Estimated_hour-12;
%    end
% end
% display([['Estimated time of this recording is ' num2str(Estimated_hour)] ':' num2str(Estimated_minutes)  ':' num2str(Estimated_seconds) '  ' time_period])

%% 

actual_shift_in_seconds = -5*60 + audio_instant*recording_detection_example_length*60; % sound was recorded before power by about 5 minutes so it is offset here
Estimation_Error = time_shift_in_seconds - actual_shift_in_seconds;
detection_error = [detection_error Estimation_Error];
end
figure;plot(1:size(example_list,1),detection_error/60);title('Detection of recording Error in minutes Vs Audio Example to be detected');xlabel('Audio Example');ylabel('Detection Error (minutes)')

false_alarm_probabilities=[];

for false_alarm_threshold=false_alarm_threshold_values
false_alarm_probability=length(find(detection_error>false_alarm_threshold*60))/143;
false_alarm_probabilities= [false_alarm_probabilities false_alarm_probability];
end

