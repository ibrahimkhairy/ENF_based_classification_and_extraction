function [class,confidence,score] = predict_grid(features,classifier,threshold)
%% this sections analyzes output confidence
  [~,score] = predict(classifier, features);
 
  class = zeros(size(features,1),1);
  confidence = zeros(size(features,1),1);
%   number_of_nones=0;
  for j =  1:size(score,1)
      example_score=score(j,:);
      confidence(j) = max(example_score);
      class(j) = find(example_score==confidence(j), 1 );
    if confidence(j)<threshold
   class(j) =14; %so that adding with 64 would result into an N
%    number_of_nones = number_of_nones+1;
    end
  end

  class=char(class+64);
