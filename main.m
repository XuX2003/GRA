%% 灰色关联分析：用于样本量较少的数据
clear;clc
load X
%% 第一步：确定母序列与子序列
% 母序列：类似于因变量Y
% 子序列：类似于自变量X
%% 第二步：对变量进行预处理（先求出每个指标的均值，再用每个元素除以该列的均值）
% 目的：去量纲、缩表变量范围简化计算
Mean = mean(gdp);
gdp = gdp ./ repmat(Mean, size(gdp, 1), 1);
disp('预处理后的矩阵为：'); 
disp(gdp);
%% 第三步：计算每个子序列与母序列的关联系数
Y = gdp(:, 1);  % 母序列
X = gdp(:, 2:end); % 子序列
absX0_Xi = abs(X - repmat(Y, 1, size(X, 2)))  % 计算|Xi - Y|矩阵
a = min(min(absX0_Xi))    % 计算两级最小差a
b = max(max(absX0_Xi))  % 计算两级最大差b
rho = 0.5; % 分辨系数取0.5
gamma = (a + rho * b) ./ (absX0_Xi  + rho * b)  % 计算关联系数
%% 第四步：计算每个子序列和母序列的灰色关联度（每一列的均值）
disp('子序列中各个指标的灰色关联度分别为：');
disp(mean(gamma));
