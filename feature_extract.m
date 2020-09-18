function [Features_matrix,number_of_features] = feature_extract(signal)

for z=1:size(signal,1)
    s=signal(z,:);
    Features=[];
    Features(1) = mean(s);
    Features(2) = log(var(s));
    Features(3) = log(range(s));
    Features(4) = bandpower(s);
    Features(5) = sum(s>mean(s));
    Features(6) = log(abs(moment(s,4)));
    Features(7) = log(abs(moment(s,7)));
    
    b=abs(dct(s,120));               
    b=b(1:5);
    Features=[Features  b];

%wavlet level 7

    level=7;
    [C,L] = wavedec(s,level,'db5');
    Reconstructed_approx = wrcoef('a',C,L,'db5',6);
    x(1) = log(var(Reconstructed_approx));
    D1 = wrcoef('d',C,L,'db5',1);
    x(2) = log(var(D1));
    D2 = wrcoef('d',C,L,'db5',2);
    x(3) = log(var(D2));
    D3 = wrcoef('d',C,L,'db5',3);
    x(4) = log(var(D3));
    D4 = wrcoef('d',C,L,'db5',4);
    x(5) = log(var(D4));
    D5 = wrcoef('d',C,L,'db5',5);
    x(6) = log(var(D5));
    D6 = wrcoef('d',C,L,'db5',6);
    x(7) = log(var(D6));

    Features = [Features x];
    
    histogram = hist(s);
    
    Features = [Features histogram];
    warning('off','all');
        [a,v] = armcov(s,2);
        
    Features=[Features a(3)];
    
    [C,L] = wavedec(s,5,'db5');%sym4
    
    s1=abs(fft(C));
    s2=abs(dct(C,120));
    
    Features=[Features max(s1) s2(1:5)];
    
    
    wavelet_dmey=[];

    level=6;
    [C,L] = wavedec(s,level,'dmey');
    Reconstructed_approx = wrcoef('a',C,L,'dmey',6);
    wavelet_dmey = [wavelet_dmey log(var(Reconstructed_approx))];
    D1 = wrcoef('d',C,L,'dmey',1);
    wavelet_dmey = [wavelet_dmey log(var(D1))];
    D2 = wrcoef('d',C,L,'dmey',2);
   wavelet_dmey = [wavelet_dmey log(var(D2))];
    D3 = wrcoef('d',C,L,'dmey',3);
    wavelet_dmey = [wavelet_dmey log(var(D3))];
    D4 = wrcoef('d',C,L,'dmey',4);
    wavelet_dmey = [wavelet_dmey log(var(D4))];
    D5 = wrcoef('d',C,L,'dmey',5);
    wavelet_dmey = [wavelet_dmey log(var(D5))];
      
    Features=[Features wavelet_dmey ];
    
        
        counter = 0;
r1 = mean(s); %getting mean of signal
r1 = s ./ r1; %dividing signal by mean to get values " > or < 1 "
flag=r1(1,1)>=1; %indicating the first element value
for j=2:length(s)
    if flag==1 %means that the element is bigger than 1 (over the mean)
        if (r1(1,j)<1) %if the following element is smaller than 1 down 
        counter=counter+1; %the counter will work
        flag=0; %and the flag will be flipped
        end
    else        %%means that the element is smaller than 1 (down the mean)
        if (r1(1,j)>=1)
        counter=counter+1;
        flag=1;
        end
    end    
end

Features = [Features counter];


    Features(isinf(Features)) = 0;
    Features(isnan(Features)) = 0;
    
    number_of_features=length(Features);
    Features_matrix(z,:)=Features;
end

end

