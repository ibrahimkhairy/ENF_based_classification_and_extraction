 tic
close all 
clear
clc

%% Section 1 : ENF Extraction
% this imports and splits training data, run only once. this section takes about 8 minutes at frequency resolution of 2^16. 
% or you can just leave it commented.

%  addpath(genpath('C:\Users\Ibrah\Documents\MATLAB\SP cup data')) %change this directory into where you keep data files
% [ENF_A,ENF_B,ENF_C,ENF_D,ENF_E,ENF_F,ENF_G,ENF_H,ENF_I,Practice_ENF,Testing_ENF] = load_data();
%  
%% Section 2 : Data Loading from already Extracted ENF, Features Extraction and Normalization
%-------------------------
load('state.mat')

f_A=feature_extract(ENF_A);
f_B=feature_extract(ENF_B);
f_C=feature_extract(ENF_C);
f_D=feature_extract(ENF_D);
f_E=feature_extract(ENF_E);
f_F=feature_extract(ENF_F);
f_G=feature_extract(ENF_G);
f_H=feature_extract(ENF_H);
f_I=feature_extract(ENF_I);
Practice_features=feature_extract(Practice_ENF);
Testing_features=feature_extract(Testing_ENF);
 
[F_A,F_B,F_C,F_D,F_E,F_F,F_G,F_H,F_I,Practice_features,Testing_features,mu,sigma] = Normalize_features(f_A,f_B,f_C,f_D,f_E,f_F,f_G,f_H,f_I,Practice_features,Testing_features);
 
%% Section 3 : visualizing Data, Features and saving into data_features.mat and data_ENF.mat 
 
ENF_A_transpose=ENF_power_A';ENF_B_transpose=ENF_power_B';ENF_C_transpose=ENF_power_C';ENF_D_transpose=ENF_power_D';ENF_E_transpose=ENF_power_E';
ENF_F_transpose=ENF_power_F';ENF_G_transpose=ENF_power_G';ENF_H_transpose=ENF_power_H';ENF_I_transpose=ENF_power_I';

% % for visualisation of Extracted ENF :
figure;subplot(9,1,1);plot(ENF_A_transpose(:));title('Grid_A ENF');
subplot(9,1,2);plot(ENF_B_transpose(:));title('Grid_B ENF');
subplot(9,1,3);plot(ENF_C_transpose(:));title('Grid_C ENF');
subplot(9,1,4);plot(ENF_D_transpose(:));title('Grid_D ENF');
subplot(9,1,5);plot(ENF_E_transpose(:));title('Grid_E ENF');
subplot(9,1,6);plot(ENF_F_transpose(:));title('Grid_F ENF');
subplot(9,1,7);plot(ENF_G_transpose(:));title('Grid_G ENF');
subplot(9,1,8);plot(ENF_H_transpose(:));title('Grid_H ENF');
subplot(9,1,9);plot(ENF_I_transpose(:));title('Grid_I ENF');


% Features Exporting to be loaded indpendently in training model
number_of_features=size(F_A,2);
F_A = [F_A ones(size(F_A,1),1)];
F_B = [F_B 2*ones(size(F_B,1),1)];
F_C = [F_C 3*ones(size(F_C,1),1)];
F_D = [F_D 4*ones(size(F_D,1),1)];
F_E = [F_E 5*ones(size(F_E,1),1)];
F_F = [F_F 6*ones(size(F_F,1),1)];
F_G = [F_G 7*ones(size(F_G,1),1)];
F_H = [F_H 8*ones(size(F_H,1),1)];
F_I = [F_I 9*ones(size(F_I,1),1)];

training_data_features = [F_A;F_B;F_C;F_D;F_E;F_F;F_G;F_H;F_I];
training_features=training_data_features(:,1:number_of_features) ;
training_data_classes=training_data_features(:,number_of_features+1) ;
Practice_data_features =  Practice_features;
ENF=[ENF_A;ENF_B;ENF_C;ENF_D;ENF_E;ENF_F;ENF_G;ENF_H;ENF_I];
save('data_features.mat','training_data_features','training_features','training_data_classes','Practice_data_features','Testing_features','mu','sigma');
save('data_ENF.mat','ENF','Practice_ENF','Testing_ENF');
 
%% Section 4 : Creating Classification model
 
load('data_features.mat','training_data_features','training_features','training_data_classes','Practice_data_features','Testing_features');


predictors=training_data_features(:,1:end-1);
response=training_data_features(:,end);
number_of_bags=201;  
trainedClassifier = fitensemble(predictors, response, 'Bag', number_of_bags, 'Tree', 'Type', 'Classification', 'ClassNames', [1 2 3 4 5 6 7 8 9]);
% % to reproduce exactly our results which we included in the report please
% % uncomment and run the following line; it includes our best trained model;
% % it may vary alittle so we included it 
% load('trainedClassifier_82')  
%% Section 5 : Predicting grids of training and testing data
 threshold=0.25;
[Practice_data_classes,Practice_data_confidence] = predict_grid(Practice_data_features,trainedClassifier,threshold);
[testing_data_classes,testing_data_confidence] = predict_grid(Testing_features,trainedClassifier,threshold);

testing_data_string=reshape(testing_data_classes,5,length(testing_data_classes)/5);
testing_data_string=testing_data_string';

table(Practice_data_classes,Practice_data_confidence)
table(testing_data_classes,testing_data_confidence)
display(['Model prediction of practice dataset is : ' (Practice_data_classes')  ]);
display(['Model prediction of testing  dataset is : ' (testing_data_string(1,:)) ',' (testing_data_string(2,:)) ...
    ',' (testing_data_string(3,:))  ',' (testing_data_string(4,:))  ',' (testing_data_string(5,:))  ',' (testing_data_string(6,:))  ...
    ',' (testing_data_string(7,:))  ',' (testing_data_string(8,:))  ',' (testing_data_string(9,:))  ',' (testing_data_string(10,:)) ...
    ',' (testing_data_string(11,:)) ',' (testing_data_string(12,:)) ',' (testing_data_string(13,:)) ',' (testing_data_string(14,:)) ...
    ',' (testing_data_string(15,:)) ',' (testing_data_string(16,:)) ',' (testing_data_string(17,:)) ',' (testing_data_string(18,:)) ...
    ',' (testing_data_string(19,:)) ',' (testing_data_string(20,:))   ]);

%% Section 6 : ENF Extraction from our recorded data and Similarity Analysis of our system with existing grids
% Extract_Team_recorded_data()
load('team_recorded_data','ENF_Audio','ENF_Power')
team_recorded_grid_features = feature_extract([ENF_Audio;ENF_Power]);

team_recorded_grid_features = normalize(team_recorded_grid_features, mu,sigma);

[~,~,grid_similarity] = predict_grid(team_recorded_grid_features,trainedClassifier,threshold);
grid_similarity=mean(grid_similarity);
closest_grid=char(find(grid_similarity==max(grid_similarity))+64);
grid_similarity_list=grid_similarity';
grid_list=(char(64+(1:9)))';
table(grid_list,grid_similarity_list)

display(['Closest Grid to our data is Grid ' closest_grid ' ,With similarity ratio equals to ' num2str(max(grid_similarity))]);

%% Section 7 :Time of recording Application
 
false_alarm_threshold_values=30:-1:0;
false_alarm_probabilities = Time_of_recording(false_alarm_threshold_values);
figure;plot(false_alarm_threshold_values,false_alarm_probabilities);xlabel('False Alarm Threshold (minutes)');ylabel('False alarm probability')
