#!/bin/zsh
# AGPL-3.0-or-later

# Cleanup
rm -f ~/Downloads/downloadpartial*.csv
rm -f ~/Downloads/downloaddatapartial*.csv

# Base URL
MARKETWATCH_URL_WTI="https://www.marketwatch.com/investing/future/cl.1/downloaddatapartial?startdate=08/01/2025%2000:00:00&enddate=INSERT_END%2000:00:00&daterange=d30&frequency=p1d&csvdownload=true&downloadpartial=false&newdates=false"
MARKETWATCH_URL_ORL="https://www.marketwatch.com/investing/stock/orl/downloaddatapartial?startdate=08/01/2025%2000:00:00&enddate=INSERT_END%2023:59:59&daterange=d30&frequency=p1d&csvdownload=true&downloadpartial=false&newdates=false&countrycode=il"

# Default Profile Name
PROFILE_NAME=PriceAnalysis

# Set the path - user should edit this!
FIREFOX=$(which iceweasel)

$FIREFOX -P $PROFILE_NAME -url $(echo $MARKETWATCH_URL_WTI | sed "s|INSERT_END|$(date +%m/%d/%Y)|")
mv ~/Downloads/downloaddatapartial.csv ./oil_price.csv
$FIREFOX -P $PROFILE_NAME -url $(echo $MARKETWATCH_URL_ORL | sed "s|INSERT_END|$(date +%m/%d/%Y)|")
mv ~/Downloads/downloaddatapartial.csv ./orl_price.csv
