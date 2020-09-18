function [] = Extract_Team_recorded_data()
team_data_path='C:\Users\Ibrah\Documents\MATLAB\SP cup data';

addpath(genpath(team_data_path))
[ENF_Power_1,~] = ENF_Extract('All_Day_Power_Record_12.20_1.20_AM.wav',10);
[ENF_Power_2,~] = ENF_Extract('All_Day_Power_Record_1.20_2.20_AM.wav',10);
[ENF_Power_3,~] = ENF_Extract('All_Day_Power_Record_2.20_3.20_AM.wav',10);
[ENF_Power_4,~] = ENF_Extract('All_Day_Power_Record_3.20_4.20_AM.wav',10);
[ENF_Power_5,~] = ENF_Extract('All_Day_Power_Record_4.20_5.20_AM.wav',10);
[ENF_Power_6,~] = ENF_Extract('All_Day_Power_Record_5.20_6.20_AM.wav',10);
[ENF_Power_7,~] = ENF_Extract('All_Day_Power_Record_6.20_7.20_AM.wav',10);
[ENF_Power_8,~] = ENF_Extract('All_Day_Power_Record_7.20_8.20_AM.wav',10);
[ENF_Power_9,~] = ENF_Extract('All_Day_Power_Record_8.20_9.20_AM.wav',10);
[ENF_Power_10,~] = ENF_Extract('All_Day_Power_Record_9.20_10.20_AM.wav',10);
[ENF_Power_11,~] = ENF_Extract('All_Day_Power_Record_10.20_11.20_AM.wav',10);
[ENF_Power_12,~] = ENF_Extract('All_Day_Power_Record_11.20_12.20_AM.wav',10);
[ENF_Power_13,~] = ENF_Extract('All_Day_Power_Record_1.20_2.20_PM.wav',10);
[ENF_Power_14,~] = ENF_Extract('All_Day_Power_Record_2.20_3.20_PM.wav',10);
[ENF_Power_15,~] = ENF_Extract('All_Day_Power_Record_3.20_4.20_PM.wav',10);
[ENF_Power_16,~] = ENF_Extract('All_Day_Power_Record_4.20_5.20_PM.wav',10);
[ENF_Power_17,~] = ENF_Extract('All_Day_Power_Record_5.20_6.20_PM.wav',10);
[ENF_Power_18,~] = ENF_Extract('All_Day_Power_Record_6.20_7.20_PM.wav',10);
[ENF_Power_19,~] = ENF_Extract('All_Day_Power_Record_7.20_8.20_PM.wav',10);
[ENF_Power_20,~] = ENF_Extract('All_Day_Power_Record_8.20_9.20_PM.wav',10);
[ENF_Power_21,~] = ENF_Extract('All_Day_Power_Record_9.20_10.20_PM.wav',10);
[ENF_Power_22,~] = ENF_Extract('All_Day_Power_Record_10.20_11.20_PM.wav',10);
[ENF_Power_23,~] = ENF_Extract('All_Day_Power_Record_11.20_12.20_PM.wav',10);
[ENF_Power_24,~] = ENF_Extract('All_Day_Power_Record_12.20_1.20_PM.wav',10);

ENF_Power = [ENF_Power_1;ENF_Power_2;...
    ENF_Power_3;ENF_Power_4;ENF_Power_5;ENF_Power_6;...
    ENF_Power_7;ENF_Power_8;ENF_Power_9;ENF_Power_10;...
    ENF_Power_11;ENF_Power_12;ENF_Power_13;ENF_Power_14;...
    ENF_Power_15;ENF_Power_16;ENF_Power_17;ENF_Power_18;...
    ENF_Power_19;ENF_Power_20;ENF_Power_21;ENF_Power_22;...
    ENF_Power_23;ENF_Power_24];

transpose_ENF_Power = ENF_Power';
total_ENF_Power=transpose_ENF_Power(:);

[ENF_Audio_1,~] = ENF_Extract('test_long_starts_at_12.30-1.30_AM_12-30-2015.wav',10);
[ENF_Audio_2,~] = ENF_Extract('test_long_starts_at_1.30-2.30_AM_12-30-2015.wav',10);
[ENF_Audio_3,~] = ENF_Extract('test_long_starts_at_2.30-3.30_AM_12-30-2015.wav',10);
[ENF_Audio_4,~] = ENF_Extract('test_long_starts_at_3.30-4.30_AM_12-30-2015.wav',10);
[ENF_Audio_5,~] = ENF_Extract('test_long_starts_at_4.30-5.30_AM_12-30-2015.wav',10);
[ENF_Audio_6,~] = ENF_Extract('test_long_starts_at_5.30-6.30_AM_12-30-2015.wav',10);
[ENF_Audio_7,~] = ENF_Extract('test_long_starts_at_6.30-7.30_AM_12-30-2015.wav',10);
[ENF_Audio_8,~] = ENF_Extract('test_long_starts_at_7.30-8.30_AM_12-30-2015.wav',10);
[ENF_Audio_9,~] = ENF_Extract('test_long_starts_at_8.30-9.30_AM_12-30-2015.wav',10);
[ENF_Audio_10,~] = ENF_Extract('test_long_starts_at_9.30-10.30_AM_12-30-2015.wav',10);
[ENF_Audio_11,~] = ENF_Extract('test_long_starts_at_10.30-11.30_AM_12-30-2015.wav',10);
[ENF_Audio_12,~] = ENF_Extract('test_long_starts_at_11.30-12.30_AM_12-30-2015.wav',10);
[ENF_Audio_13,~] = ENF_Extract('test_long_starts_at_1.30-2.30_PM_12-30-2015.wav',10);
[ENF_Audio_14,~] = ENF_Extract('test_long_starts_at_2.30-3.30_PM_12-30-2015.wav',10);
[ENF_Audio_15,~] = ENF_Extract('test_long_starts_at_3.30-4.30_PM_12-30-2015.wav',10);
[ENF_Audio_16,~] = ENF_Extract('test_long_starts_at_4.30-5.30_PM_12-30-2015.wav',10);
[ENF_Audio_17,~] = ENF_Extract('test_long_starts_at_5.30-6.30__12-30-2015 7.wav',10);
[ENF_Audio_18,~] = ENF_Extract('test_long_starts_at_6.30-7.30_PM_12-30-2015.wav',10);
[ENF_Audio_19,~] = ENF_Extract('test_long_starts_at_7.30-8.30_PM_12-30-2015.wav',10);
[ENF_Audio_20,~] = ENF_Extract('test_long_starts_at_8.30-9.30_PM_12-30-2015.wav',10);
[ENF_Audio_21,~] = ENF_Extract('test_long_starts_at_9.30-10.30_PM_12-30-2015.wav',10);
[ENF_Audio_22,~] = ENF_Extract('test_long_starts_at_10.30-11.30_PM_12-30-2015.wav',10);
[ENF_Audio_23,~] = ENF_Extract('test_long_starts_at_11.30-12.30_PM_12-30-2015.wav',10);
[ENF_Audio_24,~] = ENF_Extract('test_long_starts_at_12.30-1.30_PM_12-30-2015.wav',10);

ENF_Audio = [ENF_Audio_1;ENF_Audio_2;...
    ENF_Audio_3;ENF_Audio_4;ENF_Audio_5;ENF_Audio_6;...
    ENF_Audio_7;ENF_Audio_8;ENF_Audio_9;ENF_Audio_10;...
    ENF_Audio_11;ENF_Audio_12;ENF_Audio_13;ENF_Audio_14;...
    ENF_Audio_15;ENF_Audio_16;ENF_Audio_17;ENF_Audio_18;...
    ENF_Audio_19;ENF_Audio_20;ENF_Audio_21;ENF_Audio_22;...
    ENF_Audio_23;ENF_Audio_24];

transpose_ENF_Audio = ENF_Audio';
total_ENF_Audio=transpose_ENF_Audio(:);

save('team_recorded_data','total_ENF_Audio','ENF_Audio','total_ENF_Power','ENF_Power')
end