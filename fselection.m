function [Reduced_training_data_features,Reduced_Practice_data_features,Reduced_Testing_features,best_trainedClassifier,best_accuracy,dimensionality_reduction_percentage,best_features_indices] = fselection(training_data_features,Practice_data_features,Testing_features)

datasetTable=training_data_features;
Predictors=datasetTable(:,1:end-1);
Response=datasetTable(:,end);

%   
  %% we will now choose best features , ISA ^^ 
 total_partial_predictors = [];
 total_error = 1;
 best_features_indices=[];
  for i = 1:size(Predictors,2)
        partial_predictors = [total_partial_predictors Predictors(:,i)];
        
    [error,trainedClassifier] = criterion(partial_predictors,Response) ; 
    if error < (total_error+0.005)       %allowing a 0.5% margin
        total_error = error;
        best_features_indices =  [best_features_indices i];
        total_partial_predictors = partial_predictors;
        best_trainedClassifier =trainedClassifier;
    end    
  end
  
  dimensionality_reduction_percentage = length(best_features_indices)/size(Predictors,2)*100;
  best_accuracy=1-total_error;
  Reduced_training_data_features=[training_data_features(:,best_features_indices) Response] ;
  Reduced_Practice_data_features=Practice_data_features(:,best_features_indices);
  Reduced_Testing_features=Testing_features(:,best_features_indices);

end
  
  