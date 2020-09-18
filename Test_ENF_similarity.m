function [] = Test_ENF_similarity(k,nn , threshold , mu,sigma)
load('k.mat','k');
features_k=feature_extract(k);
normalized_features_k=normalize(features_k , mu,sigma);
% threshold=0.1;
 nnpredict(nn, normalized_features_k,threshold)

end