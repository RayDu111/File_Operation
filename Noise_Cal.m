function threshold = Noise_Cal(data)
    %% noise_estimation
    MSE = 50;
    while MSE >= 15
        nonZeroElements = data(data ~= 0); % 提取非零元素
        ave = mean(nonZeroElements);
        num = size(nonZeroElements, 1);
        MSE = sqrt(1/num*sum((nonZeroElements - ave).^2));
        data(data >= ave + MSE*2) = 0;
    end
    threshold = ave;
end

