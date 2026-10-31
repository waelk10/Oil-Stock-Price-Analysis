% AGPL-3.0-or-later
% Extract values according to common keys.
commonKeys = intersect(keys(ORLmap), keys(OILmap));
OILvals_shared = cell2mat(values(OILmap, commonKeys));
ORLvals_shared = cell2mat(values(ORLmap, commonKeys));

% Cleanup
validvals = ~isnan(OILvals_shared) & ~isnan(ORLvals_shared);
OILvals_shared = OILvals_shared(validvals);
ORLvals_shared = ORLvals_shared(validvals);

% Multiply the ORL values to get them up to actual value.
ORLvals_shared = ORLvals_shared * 100

% Correlation Coefficient and P-Value.
[R, P] = corrcoef(OILvals_shared(:), ORLvals_shared(:));
r = R(1,2);
p = P(1,2);
fprintf('Pearson correlation coefficient: %.4f and P-Value: %.4g\n', r, p);

% Attempt to print into file.
if isfolder("./data_points/oil-orl")
	filename = sprintf("data_%s.txt", datestr(now, 'dd_mm_yyyy'));
	folderpath = './data_points/oil-orl';
	filepath = fullfile(folderpath, filename);
	if ~isfile(filepath)
		fid = fopen(filepath, 'wt');
		fprintf(fid, 'Pearson correlation coefficient: %.4f and P-Value: %.4g\nCovariance of the two: %.4f\n', r, p, cov(OILvals_shared, ORLvals_shared));
		fclose(fid);
	end
end

% Covariance.
fprintf('Covariance of the two: %.4f\n', cov(OILvals_shared, ORLvals_shared));

% Visualizations
figure('Name', 'Correlation Scatter Plot');
scatter(OILvals_shared, ORLvals_shared, 20, 'filled');
hold on;
% Linear Fit
pfit = polyfit(OILvals_shared, ORLvals_shared, 1);
xline = linspace(min(OILvals_shared), max(OILvals_shared), 100);
yline = polyval(pfit, xline);
plot(xline, yline, 'r-', 'LineWidth', 2);

xlabel('Oil Price');
ylabel('ORL Stock Price');
title(sprintf('Scatter Plot (r = %.3f, p=%.3g)', r, p));
grid on;
hold off;
