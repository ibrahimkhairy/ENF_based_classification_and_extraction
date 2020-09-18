function [error,trainedClassifier] = criterion(predictors,response)
 number_of_bags=204;   %for 76 
% template = templateSVM('KernelFunction', 'linear', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
% trainedClassifier = fitcecoc(predictors, response, 'Learners', template, 'Coding', 'onevsone', 'ClassNames', [1 2 3 4 5 6 7 8 9]);
trainedClassifier = fitensemble(predictors, response, 'Bag', number_of_bags, 'Tree', 'Type', 'Classification', 'ClassNames', [1 2 3 4 5 6 7 8 9]);
partitionedModel = crossval(trainedClassifier, 'KFold', 5);
error= kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
  
% [validationPredictions, validationScores] = kfoldPredict(partitionedModel);

end