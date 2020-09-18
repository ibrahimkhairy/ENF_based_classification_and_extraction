function [ENF_A,ENF_B,ENF_C,ENF_D,ENF_E,ENF_F,ENF_G,ENF_H,ENF_I,Practice_ENF,Testing_ENF] = load_data()

% this function imports dataset , get dominant frequencies of segments and
% get features .... it is applied for every single example separately
% because they might be of unequal lengths, which is the case for our data
% set
% it returns a matrix of features for every class; each of the matrices has
% row vectors of features ; and every row is for an example

% it is assumed that sounds have same fs
% ==========================================
tic
practice_example_length=10;
testing_example_length = 10;

display('ENF_Extracting data ...');
[ENF_A_1,Fs] = ENF_Extract('Train_Grid_A_P1.wav',practice_example_length);
[ENF_A_2,~] = ENF_Extract('Train_Grid_A_P2.wav',practice_example_length);
[ENF_A_3,~] = ENF_Extract('Train_Grid_A_P3.wav',practice_example_length);
[ENF_A_4,~] = ENF_Extract('Train_Grid_A_P4.wav',practice_example_length);
[ENF_A_5,~] = ENF_Extract('Train_Grid_A_P5.wav',practice_example_length);
[ENF_A_6,~] = ENF_Extract('Train_Grid_A_P6.wav',practice_example_length);
[ENF_A_7,~] = ENF_Extract('Train_Grid_A_P7.wav',practice_example_length);
[ENF_A_8,~] = ENF_Extract('Train_Grid_A_P8.wav',practice_example_length);
[ENF_A_9,~] = ENF_Extract('Train_Grid_A_P9.wav',practice_example_length);
[ENF_A_10,~] = ENF_Extract('Train_Grid_A_A1.wav',practice_example_length);
[ENF_A_11,~] = ENF_Extract('Train_Grid_A_A2.wav',practice_example_length);

display('---------------------');
display('grid A done :)');
display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);display([['Remaining Time about : ' num2str(round((8+2.7)*0.8*(toc/60)))] ' minutes']);

[ENF_B_1,~] = ENF_Extract('Train_Grid_B_P1.wav',practice_example_length);
[ENF_B_2,~] = ENF_Extract('Train_Grid_B_P2.wav',practice_example_length);
[ENF_B_3,~] = ENF_Extract('Train_Grid_B_P3.wav',practice_example_length);
[ENF_B_4,~] = ENF_Extract('Train_Grid_B_P4.wav',practice_example_length);
[ENF_B_5,~] = ENF_Extract('Train_Grid_B_P5.wav',practice_example_length);
[ENF_B_6,~] = ENF_Extract('Train_Grid_B_P6.wav',practice_example_length);
[ENF_B_7,~] = ENF_Extract('Train_Grid_B_P7.wav',practice_example_length);
[ENF_B_8,~] = ENF_Extract('Train_Grid_B_P8.wav',practice_example_length);
[ENF_B_9,~] = ENF_Extract('Train_Grid_B_P9.wav',practice_example_length);
[ENF_B_10,~] = ENF_Extract('Train_Grid_B_P10.wav',practice_example_length);
[ENF_B_11,~] = ENF_Extract('Train_Grid_B_A1.wav',practice_example_length);
[ENF_B_12,~] = ENF_Extract('Train_Grid_B_A2.wav',practice_example_length);

display('---------------------');
display('grid B done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[ENF_C_1,~] = ENF_Extract('Train_Grid_A_P1.wav',practice_example_length);
[ENF_C_2,~] = ENF_Extract('Train_Grid_C_P2.wav',practice_example_length);
[ENF_C_3,~] = ENF_Extract('Train_Grid_C_P3.wav',practice_example_length);
[ENF_C_4,~] = ENF_Extract('Train_Grid_C_P4.wav',practice_example_length);
[ENF_C_5,~] = ENF_Extract('Train_Grid_C_P5.wav',practice_example_length);
[ENF_C_6,~] = ENF_Extract('Train_Grid_C_P6.wav',practice_example_length);
[ENF_C_7,~] = ENF_Extract('Train_Grid_C_P7.wav',practice_example_length);
[ENF_C_8,~] = ENF_Extract('Train_Grid_C_P8.wav',practice_example_length);
[ENF_C_9,~] = ENF_Extract('Train_Grid_C_P9.wav',practice_example_length);
[ENF_C_10,~] = ENF_Extract('Train_Grid_C_P10.wav',practice_example_length);
[ENF_C_11,~] = ENF_Extract('Train_Grid_C_P11.wav',practice_example_length);
[ENF_C_12,~] = ENF_Extract('Train_Grid_C_A1.wav',practice_example_length);
[ENF_C_13,~] = ENF_Extract('Train_Grid_C_A2.wav',practice_example_length);

display('---------------------');
display('grid C done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[ENF_D_1,~] = ENF_Extract('Train_Grid_D_P1.wav',practice_example_length);
[ENF_D_2,~] = ENF_Extract('Train_Grid_D_P2.wav',practice_example_length);
[ENF_D_3,~] = ENF_Extract('Train_Grid_D_P3.wav',practice_example_length);
[ENF_D_4,~] = ENF_Extract('Train_Grid_D_P4.wav',practice_example_length);
[ENF_D_5,~] = ENF_Extract('Train_Grid_D_P5.wav',practice_example_length);
[ENF_D_6,~] = ENF_Extract('Train_Grid_D_P6.wav',practice_example_length);
[ENF_D_7,~] = ENF_Extract('Train_Grid_D_P7.wav',practice_example_length);
[ENF_D_8,~] = ENF_Extract('Train_Grid_D_P8.wav',practice_example_length);
[ENF_D_9,~] = ENF_Extract('Train_Grid_D_P9.wav',practice_example_length);
[ENF_D_10,~] = ENF_Extract('Train_Grid_D_P10.wav',practice_example_length);
[ENF_D_11,~] = ENF_Extract('Train_Grid_D_P11.wav',practice_example_length);
[ENF_D_12,~] = ENF_Extract('Train_Grid_D_A1.wav',practice_example_length);
[ENF_D_13,~] = ENF_Extract('Train_Grid_D_A2.wav',practice_example_length);

display('---------------------');
display('grid D done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);
[ENF_E_1,~] = ENF_Extract('Train_Grid_E_P1.wav',practice_example_length);
[ENF_E_2,~] = ENF_Extract('Train_Grid_E_P2.wav',practice_example_length);
[ENF_E_3,~] = ENF_Extract('Train_Grid_E_P3.wav',practice_example_length);
[ENF_E_4,~] = ENF_Extract('Train_Grid_E_P4.wav',practice_example_length);
[ENF_E_5,~] = ENF_Extract('Train_Grid_E_P5.wav',practice_example_length);
[ENF_E_6,~] = ENF_Extract('Train_Grid_E_P6.wav',practice_example_length);
[ENF_E_7,~] = ENF_Extract('Train_Grid_E_P7.wav',practice_example_length);
[ENF_E_8,~] = ENF_Extract('Train_Grid_E_P8.wav',practice_example_length);
[ENF_E_9,~] = ENF_Extract('Train_Grid_E_P9.wav',practice_example_length);
[ENF_E_10,~] = ENF_Extract('Train_Grid_E_P10.wav',practice_example_length);
[ENF_E_11,~] = ENF_Extract('Train_Grid_E_P11.wav',practice_example_length);
[ENF_E_12,~] = ENF_Extract('Train_Grid_E_A1.wav',practice_example_length);
[ENF_E_13,~] = ENF_Extract('Train_Grid_E_A2.wav',practice_example_length);
display('---------------------');
display('grid E done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[ENF_F_1,~] = ENF_Extract('Train_Grid_F_P1.wav',practice_example_length);
[ENF_F_2,~] = ENF_Extract('Train_Grid_F_P2.wav',practice_example_length);
[ENF_F_3,~] = ENF_Extract('Train_Grid_F_P3.wav',practice_example_length);
[ENF_F_4,~] = ENF_Extract('Train_Grid_F_P4.wav',practice_example_length);
[ENF_F_5,~] = ENF_Extract('Train_Grid_F_P5.wav',practice_example_length);
[ENF_F_6,~] = ENF_Extract('Train_Grid_F_P6.wav',practice_example_length);
[ENF_F_7,~] = ENF_Extract('Train_Grid_F_P7.wav',practice_example_length);
[ENF_F_8,~] = ENF_Extract('Train_Grid_F_P8.wav',practice_example_length);
[ENF_F_9,~] = ENF_Extract('Train_Grid_F_A1.wav',practice_example_length);
[ENF_F_10,~] = ENF_Extract('Train_Grid_F_A2.wav',practice_example_length);
display('---------------------');
display('grid F done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[ENF_G_1,~] = ENF_Extract('Train_Grid_G_P1.wav',practice_example_length);
[ENF_G_2,~] = ENF_Extract('Train_Grid_G_P2.wav',practice_example_length);
[ENF_G_3,~] = ENF_Extract('Train_Grid_G_P3.wav',practice_example_length);
[ENF_G_4,~] = ENF_Extract('Train_Grid_G_P4.wav',practice_example_length);
[ENF_G_5,~] = ENF_Extract('Train_Grid_G_P5.wav',practice_example_length);
[ENF_G_6,~] = ENF_Extract('Train_Grid_G_P6.wav',practice_example_length);
[ENF_G_7,~] = ENF_Extract('Train_Grid_G_P7.wav',practice_example_length);
[ENF_G_8,~] = ENF_Extract('Train_Grid_G_P8.wav',practice_example_length);
[ENF_G_9,~] = ENF_Extract('Train_Grid_G_P9.wav',practice_example_length);
[ENF_G_10,~] = ENF_Extract('Train_Grid_G_P10.wav',practice_example_length);
[ENF_G_11,~] = ENF_Extract('Train_Grid_G_P11.wav',practice_example_length);
[ENF_G_12,~] = ENF_Extract('Train_Grid_G_A1.wav',practice_example_length);
[ENF_G_13,~] = ENF_Extract('Train_Grid_G_A2.wav',practice_example_length);

display('---------------------');
display('grid G done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);
[ENF_H_1,~] = ENF_Extract('Train_Grid_H_P1.wav',practice_example_length);
[ENF_H_2,~] = ENF_Extract('Train_Grid_H_P2.wav',practice_example_length);
[ENF_H_3,~] = ENF_Extract('Train_Grid_H_P3.wav',practice_example_length);
[ENF_H_4,~] = ENF_Extract('Train_Grid_H_P4.wav',practice_example_length);
[ENF_H_5,~] = ENF_Extract('Train_Grid_H_P5.wav',practice_example_length);
[ENF_H_6,~] = ENF_Extract('Train_Grid_H_P6.wav',practice_example_length);
[ENF_H_7,~] = ENF_Extract('Train_Grid_H_P7.wav',practice_example_length);
[ENF_H_8,~] = ENF_Extract('Train_Grid_H_P8.wav',practice_example_length);
[ENF_H_9,~] = ENF_Extract('Train_Grid_H_P9.wav',practice_example_length);
[ENF_H_10,~] = ENF_Extract('Train_Grid_H_P10.wav',practice_example_length);
[ENF_H_11,~] = ENF_Extract('Train_Grid_H_P11.wav',practice_example_length);
[ENF_H_12,~] = ENF_Extract('Train_Grid_H_A1.wav',practice_example_length);
[ENF_H_13,~] = ENF_Extract('Train_Grid_H_A2.wav',practice_example_length);

display('---------------------');
display('grid H done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[ENF_I_1,~] = ENF_Extract('Train_Grid_I_P1.wav',practice_example_length);
[ENF_I_2,~] = ENF_Extract('Train_Grid_I_P2.wav',practice_example_length);
[ENF_I_3,~] = ENF_Extract('Train_Grid_I_P3.wav',practice_example_length);
[ENF_I_4,~] = ENF_Extract('Train_Grid_I_P4.wav',practice_example_length);
[ENF_I_5,~] = ENF_Extract('Train_Grid_I_P5.wav',practice_example_length);
[ENF_I_6,~] = ENF_Extract('Train_Grid_I_P6.wav',practice_example_length);
[ENF_I_7,~] = ENF_Extract('Train_Grid_I_P7.wav',practice_example_length);
[ENF_I_8,~] = ENF_Extract('Train_Grid_I_P8.wav',practice_example_length);
[ENF_I_9,~] = ENF_Extract('Train_Grid_I_P9.wav',practice_example_length);
[ENF_I_10,~] = ENF_Extract('Train_Grid_I_P10.wav',practice_example_length);
[ENF_I_11,~] = ENF_Extract('Train_Grid_I_P11.wav',practice_example_length);
[ENF_I_12,~] = ENF_Extract('Train_Grid_I_A1.wav',practice_example_length);
[ENF_I_13,~] = ENF_Extract('Train_Grid_I_A2.wav',practice_example_length);

display('---------------------');
display('grid I done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);




ENF_power_A=[ENF_A_1;ENF_A_2;ENF_A_3;ENF_A_4;ENF_A_5;ENF_A_6;ENF_A_7;ENF_A_8;ENF_A_9];
ENF_power_B=[ENF_B_1;ENF_B_2;ENF_B_3;ENF_B_4;ENF_B_5;ENF_B_6;ENF_B_7;ENF_B_8;ENF_B_9;ENF_B_10];
ENF_power_C=[ENF_C_1;ENF_C_2;ENF_C_3;ENF_C_4;ENF_C_5;ENF_C_6;ENF_C_7;ENF_C_8;ENF_C_9;ENF_C_10;ENF_C_11];
ENF_power_D=[ENF_D_1;ENF_D_2;ENF_D_3;ENF_D_4;ENF_D_5;ENF_D_6;ENF_D_7;ENF_D_8;ENF_D_9;ENF_D_10;ENF_D_11];
ENF_power_E=[ENF_E_1;ENF_E_2;ENF_E_3;ENF_E_4;ENF_E_5;ENF_E_6;ENF_E_7;ENF_E_8;ENF_E_9;ENF_E_10;ENF_E_11];
ENF_power_F=[ENF_F_1;ENF_F_2;ENF_F_3;ENF_F_4;ENF_F_5;ENF_F_6;ENF_F_7;ENF_F_8];
ENF_power_G=[ENF_G_1;ENF_G_2;ENF_G_3;ENF_G_4;ENF_G_5;ENF_G_6;ENF_G_7;ENF_G_8;ENF_G_9;ENF_G_10;ENF_G_11];
ENF_power_H=[ENF_H_1;ENF_H_2;ENF_H_3;ENF_H_4;ENF_H_5;ENF_H_6;ENF_H_7;ENF_H_8;ENF_H_9;ENF_H_10;ENF_H_11];
ENF_power_I=[ENF_I_1;ENF_I_2;ENF_I_3;ENF_I_4;ENF_I_5;ENF_I_6;ENF_I_7;ENF_I_8;ENF_I_9;ENF_I_10;ENF_I_11];

ENF_audio_A=[ENF_A_10;ENF_A_11];
ENF_audio_B=[ENF_B_11;ENF_B_12];
ENF_audio_C=[ENF_C_12;ENF_C_13];
ENF_audio_D=[ENF_D_12;ENF_D_13];
ENF_audio_E=[ENF_E_12;ENF_E_13];
ENF_audio_F=[ENF_F_9;ENF_F_10];
ENF_audio_G=[ENF_G_12;ENF_G_13];
ENF_audio_H=[ENF_H_12;ENF_H_13];
ENF_audio_I=[ENF_I_12;ENF_I_13];

ENF_A=[ENF_power_A;ENF_audio_A];
ENF_B=[ENF_power_B;ENF_audio_B];
ENF_C=[ENF_power_C;ENF_audio_C];
ENF_D=[ENF_power_D;ENF_audio_D];
ENF_E=[ENF_power_E;ENF_audio_E];
ENF_F=[ENF_power_F;ENF_audio_F];
ENF_G=[ENF_power_G;ENF_audio_G];
ENF_H=[ENF_power_H;ENF_audio_H];
ENF_I=[ENF_power_I;ENF_audio_I];

Practice_ENF=zeros(50,size(ENF_A,2));
for i=1:50
  [Practice_ENF(i,:),~] = ENF_Extract([['Practice_' num2str(i)] '.wav'],testing_example_length);    
end

display('---------------------');
display('practice data done :)');
% =============================================================
Testing_ENF=zeros(100,size(ENF_A,2));
for i=1:100
  [Testing_ENF(i,:),~] = ENF_Extract([['Test_' num2str(i)] '.wav'],testing_example_length);    
end
display('---------------------');
display('Testing data done :)');
% =============================================================
display('---------------------');
display('ENF extracted successfully :)');
save('state.mat')


end
