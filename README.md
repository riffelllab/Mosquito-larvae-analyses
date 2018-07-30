## Live calcium imaging of *Aedes aegypti* neuronal tissues reveals differential importance of chemosensory systems for life-history-specific foraging strategies	

[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT) 

Larval behavior analysis code for the paper *Live calcium imaging of Aedes aegypti neuronal tissues reveals differential importance of chemosensory systems for life-history-specific foraging strategies*.

#### List of Authors and Affiliations: 
**Michelle Bui**<sup>3*</sup>, **Jennifer Shyong**<sup>1*</sup>, **Eleanor K. Lutz**<sup>2*</sup>, Ting Yang<sup>3</sup>, Ming Li<sup>3</sup>, Kenneth Truong<sup>1</sup>, Ryan Arvidson<sup>1</sup> Anna Buchman<sup>3</sup>, [Jeffrey A. Riffell](http://faculty.washington.edu/jriffell/)<sup>2†</sup> and [Omar S. Akbari](https://www.akbarilab.com/)<sup>3,4†</sup>

1. Department of Entomology and Riverside Center for Disease Vector Research, Institute for Integrative Genome Biology, University of California, Riverside, Riverside, CA 92521, USA
1. Department of Biology, University of Washington, Seattle, WA 98195, USA.
1. Section of Cell and Developmental Biology, University of California, San Diego, La Jolla, California, 92093, United States of America.
1. Tata Institute for Genetics and Society, University of California, San Diego, La Jolla, CA 92093, United States of America. 

<sup>* M.B., J.S, and E.K.L contributed equally to this work</sup>
<sup>† To whom all correspondence should be addressed</sup>

## Repository contents

#### Figure generation code

This repository contains the statistical analysis code and figure generation code for Figure 4 and Supplemental Figure 6 of the manuscript. The statistics for both figures are calculated in `Behavior_statistics.R`. `Figure_4.ipynb` and `Figure_Supplemental_6.ipynb` plot these results as PDF files (saved in `gcamp_figures`).

- `static_data_all_GCAMP.csv` contains static data for each larva, including the genetic background, date of experiment, sex, and experiment start time. Larvae that died before eclosion are also marked in the `dead` column, and are not used in any analyses. Larvae used in this dataset were reared under a 12:12 L:D light cycle, with light from 9am-9pm. All larvae were tested at 5 days old, and starved for at least 24 hours before the start of the experiment. 
- `multitracker_tracks_to_csvs.ipynb` converts Multitracker hdf5 files into Pandas dataframes and save each dataset as a CSV file in `gcamp_video_csvs`. 
- `generate_left_right_comparisons.ipynb` calculates mean speed and PIs for each larval experiment and acclimation video. This script generates `individual_larva_calculations_GCAMP.csv`. 
- :file_folder: `gcamp_hdf5_files` contains raw outputs from Multitracker, mainly intended for reference. 
- :file_folder: `gcamp_video_csvs` contains trajectory outputs from Multitracker with position data for all larvae in CSV format.
- :file_folder: `gcamp_video_calculations` contains copies of the CSV trajectory outputs from Multitracker, with added calculations such as instanteous speed.
- :file_folder: `multitracker_analysis_parameters` contains the original parameters used when generating larva trajectories from raw video data. 
- :file_folder: `gcamp_STL_files` contains 3D-printable STL files for the behavior arena used in behavior experiments. Files were printed at Shapeways (Product ID #XWEEPACQA, shapeways.com, New York, NY, USA) in black porcelain. 
- :file_folder: `gcamp_figures` contains raw images and final figure designs. 

## Dependencies

To run all of the code in this repository, users must have both Python 2 and Python 3 installed. Only Python 3 is required for plotting and figure editing, but Python 2 is required to analyze raw video data in Multitracker. [Multitracker](https://github.com/florisvb/multi_tracker) by Floris van Breugel, as well as associated dependencies, are also required. 

