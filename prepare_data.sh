#!/bin/zsh
# AGPL-3.0-or-later

# Data cleanup
touch orl_price-date_fixed.csv
cat orl_price.csv | sed -E 's/"+//g' | sed 's/\ [^,]*,/,/' | cut -d, -f1,5 > orl_price-date_fixed.csv


touch oil_price-date_fixed.csv
cat oil_price.csv | sed -E 's/"+//g' | sed 's/\ [^,]*,/,/' | cut -d, -f1,5 > oil_price-date_fixed.csv

# Keep matching
touch oil_price-filtered.csv
touch orl_price-filtered.csv

awk -f filtering.awk orl_price-date_fixed.csv oil_price-date_fixed.csv > oil_price-filtered.csv
awk -f filtering.awk oil_price-date_fixed.csv orl_price-date_fixed.csv > orl_price-filtered.csv

# Attach the headers again
sed -i '1s;^;date,price\n;' oil_price-filtered.csv
sed -i '1s;^;date,price\n;' orl_price-filtered.csv
