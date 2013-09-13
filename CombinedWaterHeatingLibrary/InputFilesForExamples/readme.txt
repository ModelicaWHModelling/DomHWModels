This folder contains text files used in several of the example simulation models. In each case the text file contains input data, such as the demand water flow rate or inlet water temperature. The files are as follows:

TanklessWithTrunkAndBranchFlow.txt: Despite the word "Tankless" in the files name, this file is used in simulations using both tankless and storage tank water heaters. This file specifies the demand water flow rate in the example simulations. The flow rate is expressed in kg/s.

TanklessWithTrunkAndBranchpwr.txt: This text file is only used in simulations with tankless water heaters. It sends a binary "on/off" signal stating whether the heater is currently turned on, or off. In this data file, the tankless water heater is always turned on. The capability to turn the heater off only exists because it was used in the characterization and validation process. A 1 indicates that the heater is turned on, a 0 indicates that the heater is turned off.

TanklessWithTrunkAndBranchTAmb.txt: Despite the word "Tankless" in the files name, this file is used in simulations using both tankless and storage tank water heaters. This file specifies the temperature of the ambient environment surrounding the heater. The temperature is expressed in deg K. For the sake of an example, it is assumed that the ambient temperature surrounding one pipe is the same as the ambient temperature surrounding the rest (which is probably not an accurate assumption).

TanklessWithTrunkAndBranchTIn.txt: Despite the word "Tankless" in the files name, this file is used in simulations using both tankless and storage tank water heaters. This file specifies the temperature of the water entering the water heater. The water is expressed in deg K.

TanklessWithTrunkAndBranchTOut.txt: This file is used in the example model WaterHeatingLibrary.CombinedExamples.HotAndColdDisWithTankless. It sets the desired outlet temperature at the four different end use models in the example simulation. The temperatures are expressed in deg K.

TanklessWithTrunkAndBranchTRadMEa.txt: This file is only used in the example model WaterHeatingLibrary.CombinedExamples.TanklessWithTrunkAndBranch. It expresses the mean radiant temperature surrounding the pipes in the distribution system. The temperatures are expressed in deg K. For the sake of an example, it is assumed that the mean radiant temperature experienced by one pipe is the same as the mean radiant temperature as the rest (which is probably not an accurate assumption).
