This folder contains experimental data collected during tests on a Rheem 84-DVLN water heater. It is a non-condensing, tankless water heater. The predicted energy factor for the heater is 0.82. More specifications can be found in /ExperimentalData/readme.txt. There are several files in this folder. They are:

Notes.txt: This file describes some of the characteristics of the tests performed, the motivation behind the tests, and notes on what occured during the test. It is a pretty sparse file, and mostly intended as a reminder for the original experimenter, but there is some value in reading it anyway.

CapacitanceTests.txt: These tests were performed to identify the capacitance of the heat exchanger. It was performed using the same methodology as was done in the development of TRNSYSType 940. The steps are as follows:

	1. Initiate water flow with the tankless heater turned off. Water flow rates vary, but are roughly 1-2 gallons per minute. Allow water to continue flowing until steady state, as identified by 	constant inlet and outlet water temperatures, is reached. Goal of this step: Purge system of room temperature water.

	2. Use power button to turn on the tankless water heater. Allow heater to operate until achieving steady state, as identified by constant outlet water temperature and natural gas flow rate. Goal 		of this step: Add heat to the heat exchanger.

	3. Use power button to turn off the tankless water heater, allow water to continue flowing at test flow rate. Record data as flowing water removes heat from heat exchanger. Goal of this step: The 		rate at which the temperature of water leaving the heat exchanger decreases can be used to identify the capacitance of the heat exchanger. Allowing the water to continue flowing at 1-2 gpm means 		the heat transfer to water term dominates the UA loss term in the governing equation, improving the signal for the capacitance parameter.

	4. Repeat steps 2 and 3 to provide multiple data sets to use when identifying the capacitance.

MinimumFlowRateTest.txt: This test was performed to identify the minimum flow rate of the heater, and compare experimental results to published data. The test was performed by turning the heater power on with no flow, then slowly increasing water flow through the heater (by adjusting the globe valve). When the heater began firing (as evidence by an audible click, and the sound of a fan starting) the current flow rate was deemed the heater activation flow rate. The water flow was then slowly decreased, and when the heater ceased firing the heater shutoff flow rate was identified.

RheemControlFlowCheck.txt: During testing experimentors became suspicious that the Rheem 84-DVLN was controlling the water flow rate at the beginning of a draw. The theory was the heater would restrict water flow rate initially, making it easier for the heater to reach the setpoint. It would then increase water flow once the setpoint had been achieved. This text file contains data used to test that theory. It contains data from a series of draws at various flow rates. Each draw was controlled by opening and closing a solenoid valve. At each flow rate one draw was performed with the heater turned on, and one with the heater turned off. The data was analyzed looking for differences in flow rate at the start of the draw when the heater was on, vs when the heater was off. A draw with the heater turned on can be identified by the fact that the outlet temperature increases when the heater is on, but not when the heater is off. No difference in flow rate was identified.

Characterization.txt: A test was performed to create a data set which could be used to identify the parameters describing any given heater. The section describing this test in "Notes.txt" is actually pretty detailed. More information is also available in the experintal report.

RheemControlFlowCheckLowFlow.txt: This data set is the same as RheemControlFlowCheck.txt, except for the fact that this data set is from a test performed at low water flow rates. There were two different flow meters installed in the system, one of which has significantly higher resolution than the other but is only safe to use at low water flow rates. This data is from tests using the low flow rate sensor, and RheemControlFlowCheck.txt contains data from testing using higher water flow rates.

Validation.txt: The second part of the characterization and validation process consists of comparing simulation results to a set of experimental results which is not the data used in characterization. This second check is used to ensure that the simulation results matched experimental data in the characterization protocol because the model is correct, and not just because the calibration process forced it to match. The intent is to test the models emulation of the processes occuring in the heater using a different data set which tests the same effects. Some general notes describing the processes in the validation protocol are:

	1. 1.5 gpm draw @ T_Set = min + 3/4(max-min) for 15 min
	2. Increase to 2.5 gpm for 5 min
	3. Decrease to 1 gpm for 5 min
	4. Stop flow for 15 min
	5. 3.5 gpm flor for 5 min @ min + 3/4(max-min)
	6. Stop flow for 60 min
	7. 4.5 gpm flow for 7 min @ min + 1/4(max-min)
	8. Stop flow for 45 min
	9. Slowly push water out (very low flow rate)

Max refers to the maximum set temperature of the heater, min either refers to "minutes" or the minimum of the heater. The intent of "min" can easily be determined from the connotation.
