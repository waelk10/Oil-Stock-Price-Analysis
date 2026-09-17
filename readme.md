# Oil-Stock Price Analysis

A set of scripts in shell + GNU Octave to analyze oil price movements and correlation to refiner stocks.  
Has provisions to automatically fetch up to date oil prices (currently WTI), and refiner stock prices (currently ORL).  
Runs some data cleanup and then analyzes correlation, and plots a graph with a general linear correlation model imposed on it.  
  
Future expansion to include more stocks and more oil price benchmarks (e.g.: Brent and Murban).
  
Usage instructions:
Edit setup.sh and get_data.sh to point to your system's firefox binary/PATH.  
Run setup.sh (only needed once), and follow the instructions (if any) to create the new profile.  
Run get_data.sh, after it finishes downloading the file each time close the tab/window (renaming and moving will be done automatically).  
Now you can run run_analysis.sh, which should output the graph and correlations.  
  
For general inquiries and user support feel free to contact me on XMPP (wael AT radioactive.waelk.tech) or by email (wael AT {karram.work,waelk.tech}).  
  
  
Copyright 2026 - Wael Karram.
