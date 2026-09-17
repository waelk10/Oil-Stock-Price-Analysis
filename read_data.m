% AGPL-3.0-or-later
% Read the data.
ORLfile = fopen('orl_price-filtered.csv', 'r');
ORLcol = textscan(ORLfile, '%s %f', 'Delimiter', ',', 'HeaderLines', 1);
fclose(ORLfile);
OILfile = fopen('oil_price-filtered.csv', 'r');
OILcol = textscan(OILfile, '%s %f', 'Delimiter', ',', 'HeaderLines', 1);
fclose(OILfile);

% Map the keys and values.
ORLkeys = ORLcol{1};
ORLvalues = ORLcol{2};
ORLmap = containers.Map(ORLkeys, num2cell(ORLvalues));
OILkeys = OILcol{1};
OILvalues = OILcol{2};
OILmap = containers.Map(OILkeys, num2cell(OILvalues));
