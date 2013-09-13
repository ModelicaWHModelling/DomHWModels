This folder contains data files used to characterize and validate the tankless water heater model. All of the files contain data from experiments performed in the lab of Bldg 70. The data in all of these files are arranged in the same format, to make it easy to switch from one data set to another in a given simulation model. The data columns in each data table are:

1. Time (s)
2. Outlet temperature, as measured with an immerssed thermocouple just outisde the unit (Sometimes deg C, sometimes K)
3. Inlet temperature (K)
4. Ambient Temperature (K)
5. Water flow rate (kg/s)
6. Energy consumption (W)
7. Outlet temperature, as measured with a surface mount thermocouple near the exit of the unit (Sometimes deg C, sometimes K)

The files in the folder are as follows:

Rheem84DVLNCharacterization.txt: This file was used in the characterization process. It contains data from the entire characterization test. Using the data this way proved unwieldly, and the data was later broken into multiple smaller files of representative sections of the experiment. 

Rheem84DVLNEffSSCharacterization.txt: This file was used in the characterization process. It contains data from the first portion of the experiment, which was used to identify the steady state efficiency of the heater. The test was organized assuming that the efficiency was a function of both set temperature and water flow rate. To investigate this correlation, 5 hot water draws were performed using 3 different flow rates and 3 different set temperatures.

Rheem84DVLNValidation.txt: This file was used for validation of the tankless water heater model. It contains data from the validation experiment. Some of the data was used as inputs to the model, ensuring that the simulation model experienced the same conditions as the experimental unit. Data used as inputs in the model include the ambient temperature, inlet temperature, and water flow rate. The other data columns were included to provide a "correct" answer for validating the model. The model was validated by comparing the outlet temperature and gas consumption predicted by the model to the values recorded in the experiment.
