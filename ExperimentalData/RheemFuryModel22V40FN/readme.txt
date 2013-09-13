This folder contains data files of experimental data collected when performing experiments on the Rheem Fury storage tank type water heater. This file contains pretty detailed notes on what was studied in each test.

Folder => Storage Tank / Rheem Fury
	Contains data from tests on the Rheem Fury storage tank (nothing special about model)

Test2 => Very slow draw. Used to identify the order of thermocouples in the tank (lowest to highest)
	Performed at ~0.25 gpm (data did not record accurately)
	Observation: Even at low flow rate the two bottom thermocouples mixed

Test3 => 1 gpm draw. Examining mixing region (caused by hot water draw)
	Observation: Temperature appears to be dropping surprisingly slowly. Not sure why. Because burner is on? Can this test be run effectively with the burner on?

Test 4 => 2 gpm draw. Examining mixing region (caused by hot water draw)
	Checking water flow rate data; is it outputting correctly?

Test 5 => 3.75 gpm draw. Examining mixing region (Caused by hot water draw)

Test 6 => Heated tank, burner/pilot off. Allowing to cool based on UA losses overnight. Observing heat loss rate and stratification behavior

Test 7 => Started with cold tank, set pilot on. Observing flue gas and water temperature with only pilot in operation. Attempting to observe over a number of different temperatures (flue gas and water temperatures)
		~3:15 PM 9/6/2012 => Pilot was not heating water at a satisfactory rate. Used burner to increase water temperature, set back to pilot

Test 8 => Repeating mixing tests, doing as a single test.
		0.25 nom gpm draw until burner fires. Stop draw, wait for burner to turn off
		1 nom gpm draw until burner fires. Stop draw, wait for burner to turn off
		2 nom gpm draw until burner fires. Stop draw, wait for burner to turn off
		3.75 nom gpm draw until burner fires. Stop draw, wait for burner to turn off
	Goals
		Identify height of mixing zone at various flow rates
		Check to make sure that each branch of manifold still reading at desired nominal flow rate (does not invalidate results of this test if does not, but will need to be readjusted)
		Identify height of Tstat, setpoint, deadband
		Identify gas burn rate of both pilot and burner
	Issue
		Draw flow rates were not as intended. 2 gpm branch became 3 gpm, 3.75 gpm became 3.33 gpm

Test 9 => Repeating some draws in mixing test.
		2 nom gpm draw until burner fires. Stop draw, wait for burner to turn off
		2.25 nom gpm draw until burner fires. Stop draw, wait for burner to turn off

Test 10 => Hot start environmental losses
		Started with hot tank, allowed to cool based on environmental losses
		Apparently left heater on. Constant pilot operation, burner may have fired?
		At end, used slow draw to check order of thermocouples (0.25 nom gpm)

Test 11 => Mixing tests
		3.75 nom gpm until burner fires. Stop draw, wait for burner to turn off
		2 nom gpm draw until burner fires. Stop draw, wait for burner to turn off
		1 nom gpm draw until burner fires. Stop draw, wait for burner to turn off


Test 12 => Mixing tests

		Collected data used from checking flow meter calibration. Draws performed at 3.75 gpm, 2 gpm, 1 gpm, 0.25 gpm

Test 13 => UA loss test (plugged flue)

		Heated tank, allowed to cool overnight. Cooled with capped flue. Sent to Jeff Maguire at NREL for analysis
		
Test 14 => UA loss test (open flue)

		Heated tank, allowed to cool over a weekend. Cooled with open flue. Sent to Jeff Maguire at NREL for analysis
Test 15 => Validation
		Performed several draws, at various flows/durations/delays between. Will be used to check model results vs data
Test 15 Supplement
		Power supply on flow meter stopped working during validation test. Performed to identify flow rates during validation test

Test 16 => Validation test
	Data set used to check validity of calibrated model
	Contains several different modes of operation
		Draw without burner firing
		Draw with burner firing
		Varying flow rate draws
		Long periods with no draws
	See experimental report for more detailed information
