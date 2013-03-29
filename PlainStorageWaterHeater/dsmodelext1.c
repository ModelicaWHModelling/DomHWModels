#include <moutil.c>
StartNonAlias(1)
DeclareAlias2("tan.tanJac[17].opa.lay[2].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[17].opa.Q_flow[2]", 1, 5, 1908, 1024)
DeclareAlias2("tan.tanJac[17].opa.lay[2].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[17].opa_b.Q_flow", -1, 5, 1896, 1024)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].material.nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[17].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[17].opa.lay[2].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[17].opa.lay[2].der(T[1])", 1, 6, 53, 1024)
DeclareVariable("tan.tanJac[17].opa.lay[2].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[17].opa.lay[2].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[17].opa.lay[2].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[18].layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[18].layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete", 6, 0.0,\
1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[1].nStaReal", \
"Number of states as a real number", 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete", 6, 0.0,\
1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.layers.material[2].nStaReal", \
"Number of states as a real number", 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[18].opa.lay[1].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].dT", "port_a.T - port_b.T [K,]", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[18].opa.lay[1].port_a.T", "Port temperature [K|degC]",\
 "tan.tanJac[18].opa_a.T", 1, 5, 1938, 1028)
DeclareAlias2("tan.tanJac[18].opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[18].opa_a.Q_flow", 1, 5, 1939, 1156)
DeclareVariable("tan.tanJac[18].opa.lay[1].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2568)
DeclareAlias2("tan.tanJac[18].opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[18].opa.Q_flow[2]", -1, 5, 1953, 1156)
DeclareState("tan.tanJac[18].opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 54, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanJac[18].opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[18].opa.lay[1].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[18].opa_a.Q_flow", 1, 5, 1939, 1024)
DeclareAlias2("tan.tanJac[18].opa.lay[1].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[18].opa.Q_flow[2]", 1, 5, 1953, 1024)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].material.nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[18].opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[18].opa.lay[1].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[18].opa.lay[1].der(T[1])", 1, 6, 54, 1024)
DeclareVariable("tan.tanJac[18].opa.lay[1].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[18].opa.lay[1].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[1].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].dT", "port_a.T - port_b.T [K,]", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[18].opa.lay[2].port_a.T", "Port temperature [K|degC]",\
 "tan.tanJac[18].opa.lay[1].port_b.T", 1, 5, 7135, 1028)
DeclareAlias2("tan.tanJac[18].opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[18].opa.Q_flow[2]", 1, 5, 1953, 1156)
DeclareAlias2("tan.tanJac[18].opa.lay[2].port_b.T", "Port temperature [K|degC]",\
 "tan.tanJac[18].opa_b.T", 1, 5, 1940, 1028)
DeclareAlias2("tan.tanJac[18].opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[18].opa_b.Q_flow", 1, 5, 1941, 1156)
DeclareState("tan.tanJac[18].opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 55, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanJac[18].opa.lay[2].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[18].opa.lay[2].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[18].opa.Q_flow[2]", 1, 5, 1953, 1024)
DeclareAlias2("tan.tanJac[18].opa.lay[2].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[18].opa_b.Q_flow", -1, 5, 1941, 1024)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].material.nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[18].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[18].opa.lay[2].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[18].opa.lay[2].der(T[1])", 1, 6, 55, 1024)
DeclareVariable("tan.tanJac[18].opa.lay[2].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[18].opa.lay[2].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[18].opa.lay[2].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[19].layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[19].layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete", 6, 0.0,\
1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[1].nStaReal", \
"Number of states as a real number", 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete", 6, 0.0,\
1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.layers.material[2].nStaReal", \
"Number of states as a real number", 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[19].opa.lay[1].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].dT", "port_a.T - port_b.T [K,]", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[19].opa.lay[1].port_a.T", "Port temperature [K|degC]",\
 "tan.tanJac[19].opa_a.T", 1, 5, 1983, 1028)
DeclareAlias2("tan.tanJac[19].opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[19].opa_a.Q_flow", 1, 5, 1984, 1156)
DeclareVariable("tan.tanJac[19].opa.lay[1].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2568)
DeclareAlias2("tan.tanJac[19].opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[19].opa.Q_flow[2]", -1, 5, 1998, 1156)
DeclareState("tan.tanJac[19].opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 56, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanJac[19].opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[19].opa.lay[1].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[19].opa_a.Q_flow", 1, 5, 1984, 1024)
DeclareAlias2("tan.tanJac[19].opa.lay[1].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[19].opa.Q_flow[2]", 1, 5, 1998, 1024)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].material.nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[19].opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[19].opa.lay[1].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[19].opa.lay[1].der(T[1])", 1, 6, 56, 1024)
DeclareVariable("tan.tanJac[19].opa.lay[1].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[19].opa.lay[1].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[1].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].dT", "port_a.T - port_b.T [K,]", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[19].opa.lay[2].port_a.T", "Port temperature [K|degC]",\
 "tan.tanJac[19].opa.lay[1].port_b.T", 1, 5, 7226, 1028)
DeclareAlias2("tan.tanJac[19].opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[19].opa.Q_flow[2]", 1, 5, 1998, 1156)
DeclareAlias2("tan.tanJac[19].opa.lay[2].port_b.T", "Port temperature [K|degC]",\
 "tan.tanJac[19].opa_b.T", 1, 5, 1985, 1028)
DeclareAlias2("tan.tanJac[19].opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[19].opa_b.Q_flow", 1, 5, 1986, 1156)
DeclareState("tan.tanJac[19].opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 57, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanJac[19].opa.lay[2].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[19].opa.lay[2].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[19].opa.Q_flow[2]", 1, 5, 1998, 1024)
DeclareAlias2("tan.tanJac[19].opa.lay[2].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[19].opa_b.Q_flow", -1, 5, 1986, 1024)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].material.nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[19].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[19].opa.lay[2].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[19].opa.lay[2].der(T[1])", 1, 6, 57, 1024)
DeclareVariable("tan.tanJac[19].opa.lay[2].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[19].opa.lay[2].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[19].opa.lay[2].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[20].layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[20].layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete", 6, 0.0,\
1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[1].nStaReal", \
"Number of states as a real number", 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete", 6, 0.0,\
1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.layers.material[2].nStaReal", \
"Number of states as a real number", 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanJac[20].opa.lay[1].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].dT", "port_a.T - port_b.T [K,]", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[20].opa.lay[1].port_a.T", "Port temperature [K|degC]",\
 "tan.tanJac[20].opa_a.T", 1, 5, 2028, 1028)
DeclareAlias2("tan.tanJac[20].opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[20].opa_a.Q_flow", 1, 5, 2029, 1156)
DeclareVariable("tan.tanJac[20].opa.lay[1].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2568)
DeclareAlias2("tan.tanJac[20].opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[20].opa.Q_flow[2]", -1, 5, 2043, 1156)
DeclareState("tan.tanJac[20].opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 58, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanJac[20].opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[20].opa.lay[1].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[20].opa_a.Q_flow", 1, 5, 2029, 1024)
DeclareAlias2("tan.tanJac[20].opa.lay[1].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[20].opa.Q_flow[2]", 1, 5, 2043, 1024)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].material.nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[20].opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[20].opa.lay[1].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[20].opa.lay[1].der(T[1])", 1, 6, 58, 1024)
DeclareVariable("tan.tanJac[20].opa.lay[1].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[20].opa.lay[1].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[1].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].dT", "port_a.T - port_b.T [K,]", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[20].opa.lay[2].port_a.T", "Port temperature [K|degC]",\
 "tan.tanJac[20].opa.lay[1].port_b.T", 1, 5, 7317, 1028)
DeclareAlias2("tan.tanJac[20].opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[20].opa.Q_flow[2]", 1, 5, 2043, 1156)
DeclareAlias2("tan.tanJac[20].opa.lay[2].port_b.T", "Port temperature [K|degC]",\
 "tan.tanJac[20].opa_b.T", 1, 5, 2030, 1028)
DeclareAlias2("tan.tanJac[20].opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanJac[20].opa_b.Q_flow", 1, 5, 2031, 1156)
DeclareState("tan.tanJac[20].opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 59, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanJac[20].opa.lay[2].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanJac[20].opa.lay[2].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[20].opa.Q_flow[2]", 1, 5, 2043, 1024)
DeclareAlias2("tan.tanJac[20].opa.lay[2].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanJac[20].opa_b.Q_flow", -1, 5, 2031, 1024)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].material.nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanJac[20].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanJac[20].opa.lay[2].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanJac[20].opa.lay[2].der(T[1])", 1, 6, 59, 1024)
DeclareVariable("tan.tanJac[20].opa.lay[2].nSta", "Number of state variables", 1,\
 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanJac[20].opa.lay[2].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanJac[20].opa.lay[2].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.vol[1].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[1].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[1].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[1].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[1].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[1].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[1].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[1].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[1].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[1].dynBal.der(m)", 1, 5, 7387, 1156)
DeclareAlias2("tan.vol[1].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[1].p", 1, 7, 114, 1028)
DeclareAlias2("tan.vol[1].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[1].dynBal.medium.h", 1, 1, 60, 1028)
DeclareVariable("tan.vol[1].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareVariable("_GlobalScope.Modelica.Media.Interfaces.PartialPureSubstance.X_default[1]",\
 "Default value for mass fractions of medium (for initialization) [kg/kg]", 1.0,\
 0.0,1.0,0.1,0,2561)
DeclareState("tan.vol[1].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 60, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[1].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[1].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[1].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[1].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[1].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[1].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[1].dynBal.medium.h", 1, 1, 60, 1024)
DeclareAlias2("tan.vol[1].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[1].dynBal.medium.d", 1, 5, 7369, 1024)
DeclareAlias2("tan.vol[1].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[1].dynBal.medium.T", 1, 5, 7371, 1024)
DeclareAlias2("tan.vol[1].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[1].p", 1, 7, 114, 1024)
DeclareVariable("tan.vol[1].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[1].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[1].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[1].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[1].p", 1, 7, 114, 1024)
DeclareVariable("tan.vol[1].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[1].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[1].dynBal.medium.state.phase", 1, 5, 7378, 1090)
DeclareVariable("tan.vol[1].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[1].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[1].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[1].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[1].dynBal.der(m)", 1, 5, 7387, 1024)
DeclareVariable("tan.vol[1].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[1].dynBal.fluidVolume", "Volume [m3]", "tan.vol[1].V", 1,\
 5, 2073, 1024)
DeclareAlias2("tan.vol[1].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[1].heatPort.Q_flow", 1, 5, 2075, 1024)
DeclareAlias2("tan.vol[1].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[1].dynBal.medium.h", 1, 1, 60, 1024)
DeclareParameter("tan.vol[1].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 194, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[1].dynBal.ports_H_flow[1]", "[W]", "tan.vol[1].dynBal.Hb_flow", 1,\
 5, 7388, 1024)
DeclareVariable("tan.vol[1].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[2].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[2].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[2].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[2].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[2].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[2].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[2].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[2].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[2].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[2].dynBal.der(m)", 1, 5, 7417, 1156)
DeclareAlias2("tan.vol[2].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[2].p", 1, 7, 117, 1028)
DeclareAlias2("tan.vol[2].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[2].dynBal.medium.h", 1, 1, 61, 1028)
DeclareVariable("tan.vol[2].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[2].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 61, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[2].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[2].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[2].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[2].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[2].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[2].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[2].dynBal.medium.h", 1, 1, 61, 1024)
DeclareAlias2("tan.vol[2].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[2].dynBal.medium.d", 1, 5, 7399, 1024)
DeclareAlias2("tan.vol[2].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[2].dynBal.medium.T", 1, 5, 7401, 1024)
DeclareAlias2("tan.vol[2].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[2].p", 1, 7, 117, 1024)
DeclareVariable("tan.vol[2].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[2].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[2].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[2].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[2].p", 1, 7, 117, 1024)
DeclareVariable("tan.vol[2].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[2].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[2].dynBal.medium.state.phase", 1, 5, 7408, 1090)
DeclareVariable("tan.vol[2].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[2].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[2].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[2].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[2].dynBal.der(m)", 1, 5, 7417, 1024)
DeclareVariable("tan.vol[2].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[2].dynBal.fluidVolume", "Volume [m3]", "tan.vol[2].V", 1,\
 5, 2095, 1024)
DeclareAlias2("tan.vol[2].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[2].heatPort.Q_flow", 1, 5, 2097, 1024)
DeclareAlias2("tan.vol[2].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[2].dynBal.medium.h", 1, 1, 61, 1024)
DeclareParameter("tan.vol[2].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 195, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[2].dynBal.ports_H_flow[1]", "[W]", "tan.vol[2].dynBal.Hb_flow", 1,\
 5, 7418, 1024)
DeclareVariable("tan.vol[2].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[3].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[3].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[3].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[3].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[3].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[3].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[3].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[3].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[3].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[3].dynBal.der(m)", 1, 5, 7447, 1156)
DeclareAlias2("tan.vol[3].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[3].p", 1, 7, 120, 1028)
DeclareAlias2("tan.vol[3].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[3].dynBal.medium.h", 1, 1, 62, 1028)
DeclareVariable("tan.vol[3].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[3].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 62, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[3].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[3].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[3].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[3].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[3].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[3].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[3].dynBal.medium.h", 1, 1, 62, 1024)
DeclareAlias2("tan.vol[3].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[3].dynBal.medium.d", 1, 5, 7429, 1024)
DeclareAlias2("tan.vol[3].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[3].dynBal.medium.T", 1, 5, 7431, 1024)
DeclareAlias2("tan.vol[3].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[3].p", 1, 7, 120, 1024)
DeclareVariable("tan.vol[3].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[3].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[3].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[3].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[3].p", 1, 7, 120, 1024)
DeclareVariable("tan.vol[3].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[3].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[3].dynBal.medium.state.phase", 1, 5, 7438, 1090)
DeclareVariable("tan.vol[3].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[3].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[3].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[3].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[3].dynBal.der(m)", 1, 5, 7447, 1024)
DeclareVariable("tan.vol[3].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[3].dynBal.fluidVolume", "Volume [m3]", "tan.vol[3].V", 1,\
 5, 2117, 1024)
DeclareAlias2("tan.vol[3].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[3].heatPort.Q_flow", 1, 5, 2119, 1024)
DeclareAlias2("tan.vol[3].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[3].dynBal.medium.h", 1, 1, 62, 1024)
DeclareParameter("tan.vol[3].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 196, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[3].dynBal.ports_H_flow[1]", "[W]", "tan.vol[3].dynBal.Hb_flow", 1,\
 5, 7448, 1024)
DeclareVariable("tan.vol[3].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[4].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[4].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[4].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[4].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[4].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[4].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[4].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[4].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[4].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[4].dynBal.der(m)", 1, 5, 7477, 1156)
DeclareAlias2("tan.vol[4].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[4].p", 1, 7, 123, 1028)
DeclareAlias2("tan.vol[4].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[4].dynBal.medium.h", 1, 1, 63, 1028)
DeclareVariable("tan.vol[4].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[4].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 63, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[4].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[4].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[4].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[4].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[4].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[4].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[4].dynBal.medium.h", 1, 1, 63, 1024)
DeclareAlias2("tan.vol[4].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[4].dynBal.medium.d", 1, 5, 7459, 1024)
DeclareAlias2("tan.vol[4].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[4].dynBal.medium.T", 1, 5, 7461, 1024)
DeclareAlias2("tan.vol[4].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[4].p", 1, 7, 123, 1024)
DeclareVariable("tan.vol[4].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[4].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[4].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[4].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[4].p", 1, 7, 123, 1024)
DeclareVariable("tan.vol[4].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[4].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[4].dynBal.medium.state.phase", 1, 5, 7468, 1090)
DeclareVariable("tan.vol[4].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[4].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[4].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[4].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[4].dynBal.der(m)", 1, 5, 7477, 1024)
DeclareVariable("tan.vol[4].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[4].dynBal.fluidVolume", "Volume [m3]", "tan.vol[4].V", 1,\
 5, 2139, 1024)
DeclareAlias2("tan.vol[4].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[4].heatPort.Q_flow", 1, 5, 2141, 1024)
DeclareAlias2("tan.vol[4].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[4].dynBal.medium.h", 1, 1, 63, 1024)
DeclareParameter("tan.vol[4].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 197, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[4].dynBal.ports_H_flow[1]", "[W]", "tan.vol[4].dynBal.Hb_flow", 1,\
 5, 7478, 1024)
DeclareVariable("tan.vol[4].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[5].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[5].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[5].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[5].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[5].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[5].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[5].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[5].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[5].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[5].dynBal.der(m)", 1, 5, 7507, 1156)
DeclareAlias2("tan.vol[5].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[5].p", 1, 7, 126, 1028)
DeclareAlias2("tan.vol[5].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[5].dynBal.medium.h", 1, 1, 64, 1028)
DeclareVariable("tan.vol[5].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[5].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 64, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[5].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[5].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[5].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[5].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[5].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[5].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[5].dynBal.medium.h", 1, 1, 64, 1024)
DeclareAlias2("tan.vol[5].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[5].dynBal.medium.d", 1, 5, 7489, 1024)
DeclareAlias2("tan.vol[5].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[5].dynBal.medium.T", 1, 5, 7491, 1024)
DeclareAlias2("tan.vol[5].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[5].p", 1, 7, 126, 1024)
DeclareVariable("tan.vol[5].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[5].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[5].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[5].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[5].p", 1, 7, 126, 1024)
DeclareVariable("tan.vol[5].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[5].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[5].dynBal.medium.state.phase", 1, 5, 7498, 1090)
DeclareVariable("tan.vol[5].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[5].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[5].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[5].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[5].dynBal.der(m)", 1, 5, 7507, 1024)
DeclareVariable("tan.vol[5].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[5].dynBal.fluidVolume", "Volume [m3]", "tan.vol[5].V", 1,\
 5, 2161, 1024)
DeclareAlias2("tan.vol[5].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[5].heatPort.Q_flow", 1, 5, 2163, 1024)
DeclareAlias2("tan.vol[5].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[5].dynBal.medium.h", 1, 1, 64, 1024)
DeclareParameter("tan.vol[5].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 198, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[5].dynBal.ports_H_flow[1]", "[W]", "tan.vol[5].dynBal.Hb_flow", 1,\
 5, 7508, 1024)
DeclareVariable("tan.vol[5].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[6].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[6].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[6].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[6].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[6].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[6].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[6].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[6].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[6].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[6].dynBal.der(m)", 1, 5, 7537, 1156)
DeclareAlias2("tan.vol[6].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[6].p", 1, 7, 129, 1028)
DeclareAlias2("tan.vol[6].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[6].dynBal.medium.h", 1, 1, 65, 1028)
DeclareVariable("tan.vol[6].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[6].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 65, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[6].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[6].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[6].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[6].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[6].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[6].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[6].dynBal.medium.h", 1, 1, 65, 1024)
DeclareAlias2("tan.vol[6].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[6].dynBal.medium.d", 1, 5, 7519, 1024)
DeclareAlias2("tan.vol[6].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[6].dynBal.medium.T", 1, 5, 7521, 1024)
DeclareAlias2("tan.vol[6].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[6].p", 1, 7, 129, 1024)
DeclareVariable("tan.vol[6].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[6].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[6].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[6].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[6].p", 1, 7, 129, 1024)
DeclareVariable("tan.vol[6].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[6].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[6].dynBal.medium.state.phase", 1, 5, 7528, 1090)
DeclareVariable("tan.vol[6].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[6].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[6].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[6].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[6].dynBal.der(m)", 1, 5, 7537, 1024)
DeclareVariable("tan.vol[6].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[6].dynBal.fluidVolume", "Volume [m3]", "tan.vol[6].V", 1,\
 5, 2183, 1024)
DeclareAlias2("tan.vol[6].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[6].heatPort.Q_flow", 1, 5, 2185, 1024)
DeclareAlias2("tan.vol[6].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[6].dynBal.medium.h", 1, 1, 65, 1024)
DeclareParameter("tan.vol[6].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 199, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[6].dynBal.ports_H_flow[1]", "[W]", "tan.vol[6].dynBal.Hb_flow", 1,\
 5, 7538, 1024)
DeclareVariable("tan.vol[6].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[7].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[7].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[7].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[7].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[7].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[7].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[7].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[7].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[7].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[7].dynBal.der(m)", 1, 5, 7567, 1156)
DeclareAlias2("tan.vol[7].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[7].p", 1, 7, 132, 1028)
DeclareAlias2("tan.vol[7].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[7].dynBal.medium.h", 1, 1, 66, 1028)
DeclareVariable("tan.vol[7].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[7].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 66, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[7].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[7].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[7].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[7].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[7].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[7].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[7].dynBal.medium.h", 1, 1, 66, 1024)
DeclareAlias2("tan.vol[7].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[7].dynBal.medium.d", 1, 5, 7549, 1024)
DeclareAlias2("tan.vol[7].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[7].dynBal.medium.T", 1, 5, 7551, 1024)
DeclareAlias2("tan.vol[7].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[7].p", 1, 7, 132, 1024)
DeclareVariable("tan.vol[7].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[7].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[7].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[7].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[7].p", 1, 7, 132, 1024)
DeclareVariable("tan.vol[7].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[7].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[7].dynBal.medium.state.phase", 1, 5, 7558, 1090)
DeclareVariable("tan.vol[7].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[7].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[7].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[7].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[7].dynBal.der(m)", 1, 5, 7567, 1024)
DeclareVariable("tan.vol[7].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[7].dynBal.fluidVolume", "Volume [m3]", "tan.vol[7].V", 1,\
 5, 2205, 1024)
DeclareAlias2("tan.vol[7].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[7].heatPort.Q_flow", 1, 5, 2207, 1024)
DeclareAlias2("tan.vol[7].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[7].dynBal.medium.h", 1, 1, 66, 1024)
DeclareParameter("tan.vol[7].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 200, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[7].dynBal.ports_H_flow[1]", "[W]", "tan.vol[7].dynBal.Hb_flow", 1,\
 5, 7568, 1024)
DeclareVariable("tan.vol[7].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[8].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[8].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[8].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[8].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[8].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[8].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[8].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[8].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[8].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[8].dynBal.der(m)", 1, 5, 7597, 1156)
DeclareAlias2("tan.vol[8].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[8].p", 1, 7, 135, 1028)
DeclareAlias2("tan.vol[8].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[8].dynBal.medium.h", 1, 1, 67, 1028)
DeclareVariable("tan.vol[8].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[8].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 67, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[8].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[8].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[8].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[8].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[8].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[8].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[8].dynBal.medium.h", 1, 1, 67, 1024)
DeclareAlias2("tan.vol[8].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[8].dynBal.medium.d", 1, 5, 7579, 1024)
DeclareAlias2("tan.vol[8].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[8].dynBal.medium.T", 1, 5, 7581, 1024)
DeclareAlias2("tan.vol[8].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[8].p", 1, 7, 135, 1024)
DeclareVariable("tan.vol[8].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[8].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[8].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[8].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[8].p", 1, 7, 135, 1024)
DeclareVariable("tan.vol[8].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[8].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[8].dynBal.medium.state.phase", 1, 5, 7588, 1090)
DeclareVariable("tan.vol[8].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[8].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[8].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[8].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[8].dynBal.der(m)", 1, 5, 7597, 1024)
DeclareVariable("tan.vol[8].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[8].dynBal.fluidVolume", "Volume [m3]", "tan.vol[8].V", 1,\
 5, 2227, 1024)
DeclareAlias2("tan.vol[8].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[8].heatPort.Q_flow", 1, 5, 2229, 1024)
DeclareAlias2("tan.vol[8].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[8].dynBal.medium.h", 1, 1, 67, 1024)
DeclareParameter("tan.vol[8].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 201, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[8].dynBal.ports_H_flow[1]", "[W]", "tan.vol[8].dynBal.Hb_flow", 1,\
 5, 7598, 1024)
DeclareVariable("tan.vol[8].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[9].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[9].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[9].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[9].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[9].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[9].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[9].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[9].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[9].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[9].dynBal.der(m)", 1, 5, 7627, 1156)
DeclareAlias2("tan.vol[9].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[9].p", 1, 7, 138, 1028)
DeclareAlias2("tan.vol[9].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[9].dynBal.medium.h", 1, 1, 68, 1028)
DeclareVariable("tan.vol[9].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[9].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 68, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[9].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[9].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.T", "Temperature of medium [K|degC]", \
333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[9].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[9].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[9].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[9].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[9].dynBal.medium.h", 1, 1, 68, 1024)
DeclareAlias2("tan.vol[9].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[9].dynBal.medium.d", 1, 5, 7609, 1024)
DeclareAlias2("tan.vol[9].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[9].dynBal.medium.T", 1, 5, 7611, 1024)
DeclareAlias2("tan.vol[9].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[9].p", 1, 7, 138, 1024)
DeclareVariable("tan.vol[9].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[9].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[9].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[9].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[9].p", 1, 7, 138, 1024)
DeclareVariable("tan.vol[9].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[9].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[9].dynBal.medium.state.phase", 1, 5, 7618, 1090)
DeclareVariable("tan.vol[9].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[9].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,0.0,\
0,2560)
DeclareVariable("tan.vol[9].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[9].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[9].dynBal.der(m)", 1, 5, 7627, 1024)
DeclareVariable("tan.vol[9].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[9].dynBal.fluidVolume", "Volume [m3]", "tan.vol[9].V", 1,\
 5, 2249, 1024)
DeclareAlias2("tan.vol[9].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[9].heatPort.Q_flow", 1, 5, 2251, 1024)
DeclareAlias2("tan.vol[9].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[9].dynBal.medium.h", 1, 1, 68, 1024)
DeclareParameter("tan.vol[9].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 202, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[9].dynBal.ports_H_flow[1]", "[W]", "tan.vol[9].dynBal.Hb_flow", 1,\
 5, 7628, 1024)
DeclareVariable("tan.vol[9].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[10].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[10].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[10].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[10].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[10].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[10].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[10].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[10].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[10].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[10].dynBal.der(m)", 1, 5, 7657, 1156)
DeclareAlias2("tan.vol[10].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[10].p", 1, 7, 141, 1028)
DeclareAlias2("tan.vol[10].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[10].dynBal.medium.h", 1, 1, 69, 1028)
DeclareVariable("tan.vol[10].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[10].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 69, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[10].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[10].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[10].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[10].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[10].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[10].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[10].dynBal.medium.h", 1, 1, 69, 1024)
DeclareAlias2("tan.vol[10].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[10].dynBal.medium.d", 1, 5, 7639, 1024)
DeclareAlias2("tan.vol[10].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[10].dynBal.medium.T", 1, 5, 7641, 1024)
DeclareAlias2("tan.vol[10].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[10].p", 1, 7, 141, 1024)
DeclareVariable("tan.vol[10].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[10].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[10].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[10].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[10].p", 1, 7, 141, 1024)
DeclareVariable("tan.vol[10].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[10].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[10].dynBal.medium.state.phase", 1, 5, 7648, 1090)
DeclareVariable("tan.vol[10].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[10].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[10].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[10].dynBal.der(m)", 1, 5, 7657, 1024)
DeclareVariable("tan.vol[10].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[10].dynBal.fluidVolume", "Volume [m3]", "tan.vol[10].V", 1,\
 5, 2271, 1024)
DeclareAlias2("tan.vol[10].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[10].heatPort.Q_flow", 1, 5, 2273, 1024)
DeclareAlias2("tan.vol[10].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[10].dynBal.medium.h", 1, 1, 69, 1024)
DeclareParameter("tan.vol[10].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 203, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[10].dynBal.ports_H_flow[1]", "[W]", "tan.vol[10].dynBal.Hb_flow", 1,\
 5, 7658, 1024)
DeclareVariable("tan.vol[10].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[11].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[11].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[11].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[11].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[11].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[11].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[11].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[11].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[11].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[11].dynBal.der(m)", 1, 5, 7687, 1156)
DeclareAlias2("tan.vol[11].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[11].p", 1, 7, 144, 1028)
DeclareAlias2("tan.vol[11].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[11].dynBal.medium.h", 1, 1, 70, 1028)
DeclareVariable("tan.vol[11].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[11].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 70, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[11].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[11].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[11].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[11].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[11].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[11].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[11].dynBal.medium.h", 1, 1, 70, 1024)
DeclareAlias2("tan.vol[11].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[11].dynBal.medium.d", 1, 5, 7669, 1024)
DeclareAlias2("tan.vol[11].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[11].dynBal.medium.T", 1, 5, 7671, 1024)
DeclareAlias2("tan.vol[11].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[11].p", 1, 7, 144, 1024)
DeclareVariable("tan.vol[11].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[11].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[11].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[11].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[11].p", 1, 7, 144, 1024)
DeclareVariable("tan.vol[11].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[11].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[11].dynBal.medium.state.phase", 1, 5, 7678, 1090)
DeclareVariable("tan.vol[11].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[11].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[11].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[11].dynBal.der(m)", 1, 5, 7687, 1024)
DeclareVariable("tan.vol[11].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[11].dynBal.fluidVolume", "Volume [m3]", "tan.vol[11].V", 1,\
 5, 2293, 1024)
DeclareAlias2("tan.vol[11].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[11].heatPort.Q_flow", 1, 5, 2295, 1024)
DeclareAlias2("tan.vol[11].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[11].dynBal.medium.h", 1, 1, 70, 1024)
DeclareParameter("tan.vol[11].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 204, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[11].dynBal.ports_H_flow[1]", "[W]", "tan.vol[11].dynBal.Hb_flow", 1,\
 5, 7688, 1024)
DeclareVariable("tan.vol[11].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[12].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[12].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[12].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[12].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[12].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[12].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[12].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[12].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[12].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[12].dynBal.der(m)", 1, 5, 7717, 1156)
DeclareAlias2("tan.vol[12].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[12].p", 1, 7, 147, 1028)
DeclareAlias2("tan.vol[12].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[12].dynBal.medium.h", 1, 1, 71, 1028)
DeclareVariable("tan.vol[12].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[12].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 71, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[12].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[12].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[12].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[12].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[12].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[12].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[12].dynBal.medium.h", 1, 1, 71, 1024)
DeclareAlias2("tan.vol[12].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[12].dynBal.medium.d", 1, 5, 7699, 1024)
DeclareAlias2("tan.vol[12].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[12].dynBal.medium.T", 1, 5, 7701, 1024)
DeclareAlias2("tan.vol[12].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[12].p", 1, 7, 147, 1024)
DeclareVariable("tan.vol[12].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[12].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[12].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[12].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[12].p", 1, 7, 147, 1024)
DeclareVariable("tan.vol[12].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[12].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[12].dynBal.medium.state.phase", 1, 5, 7708, 1090)
DeclareVariable("tan.vol[12].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[12].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[12].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[12].dynBal.der(m)", 1, 5, 7717, 1024)
DeclareVariable("tan.vol[12].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[12].dynBal.fluidVolume", "Volume [m3]", "tan.vol[12].V", 1,\
 5, 2315, 1024)
DeclareAlias2("tan.vol[12].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[12].heatPort.Q_flow", 1, 5, 2317, 1024)
DeclareAlias2("tan.vol[12].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[12].dynBal.medium.h", 1, 1, 71, 1024)
DeclareParameter("tan.vol[12].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 205, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[12].dynBal.ports_H_flow[1]", "[W]", "tan.vol[12].dynBal.Hb_flow", 1,\
 5, 7718, 1024)
DeclareVariable("tan.vol[12].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[13].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[13].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[13].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[13].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[13].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[13].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[13].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[13].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[13].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[13].dynBal.der(m)", 1, 5, 7747, 1156)
DeclareAlias2("tan.vol[13].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[13].p", 1, 7, 150, 1028)
DeclareAlias2("tan.vol[13].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[13].dynBal.medium.h", 1, 1, 72, 1028)
DeclareVariable("tan.vol[13].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[13].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 72, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[13].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[13].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[13].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[13].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[13].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[13].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[13].dynBal.medium.h", 1, 1, 72, 1024)
DeclareAlias2("tan.vol[13].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[13].dynBal.medium.d", 1, 5, 7729, 1024)
DeclareAlias2("tan.vol[13].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[13].dynBal.medium.T", 1, 5, 7731, 1024)
DeclareAlias2("tan.vol[13].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[13].p", 1, 7, 150, 1024)
DeclareVariable("tan.vol[13].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[13].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[13].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[13].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[13].p", 1, 7, 150, 1024)
DeclareVariable("tan.vol[13].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[13].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[13].dynBal.medium.state.phase", 1, 5, 7738, 1090)
DeclareVariable("tan.vol[13].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[13].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[13].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[13].dynBal.der(m)", 1, 5, 7747, 1024)
DeclareVariable("tan.vol[13].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[13].dynBal.fluidVolume", "Volume [m3]", "tan.vol[13].V", 1,\
 5, 2337, 1024)
DeclareAlias2("tan.vol[13].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[13].heatPort.Q_flow", 1, 5, 2339, 1024)
DeclareAlias2("tan.vol[13].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[13].dynBal.medium.h", 1, 1, 72, 1024)
DeclareParameter("tan.vol[13].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 206, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[13].dynBal.ports_H_flow[1]", "[W]", "tan.vol[13].dynBal.Hb_flow", 1,\
 5, 7748, 1024)
DeclareVariable("tan.vol[13].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[14].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[14].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[14].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[14].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[14].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[14].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[14].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[14].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[14].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[14].dynBal.der(m)", 1, 5, 7777, 1156)
DeclareAlias2("tan.vol[14].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[14].p", 1, 7, 153, 1028)
DeclareAlias2("tan.vol[14].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[14].dynBal.medium.h", 1, 1, 73, 1028)
DeclareVariable("tan.vol[14].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[14].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 73, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[14].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[14].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[14].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[14].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[14].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[14].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[14].dynBal.medium.h", 1, 1, 73, 1024)
DeclareAlias2("tan.vol[14].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[14].dynBal.medium.d", 1, 5, 7759, 1024)
DeclareAlias2("tan.vol[14].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[14].dynBal.medium.T", 1, 5, 7761, 1024)
DeclareAlias2("tan.vol[14].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[14].p", 1, 7, 153, 1024)
DeclareVariable("tan.vol[14].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[14].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[14].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[14].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[14].p", 1, 7, 153, 1024)
DeclareVariable("tan.vol[14].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[14].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[14].dynBal.medium.state.phase", 1, 5, 7768, 1090)
DeclareVariable("tan.vol[14].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[14].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[14].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[14].dynBal.der(m)", 1, 5, 7777, 1024)
DeclareVariable("tan.vol[14].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[14].dynBal.fluidVolume", "Volume [m3]", "tan.vol[14].V", 1,\
 5, 2359, 1024)
DeclareAlias2("tan.vol[14].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[14].heatPort.Q_flow", 1, 5, 2361, 1024)
DeclareAlias2("tan.vol[14].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[14].dynBal.medium.h", 1, 1, 73, 1024)
DeclareParameter("tan.vol[14].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 207, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[14].dynBal.ports_H_flow[1]", "[W]", "tan.vol[14].dynBal.Hb_flow", 1,\
 5, 7778, 1024)
DeclareVariable("tan.vol[14].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[15].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[15].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[15].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[15].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[15].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[15].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[15].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[15].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[15].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[15].dynBal.der(m)", 1, 5, 7807, 1156)
DeclareAlias2("tan.vol[15].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[15].p", 1, 7, 156, 1028)
DeclareAlias2("tan.vol[15].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[15].dynBal.medium.h", 1, 1, 74, 1028)
DeclareVariable("tan.vol[15].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[15].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 74, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[15].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[15].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[15].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[15].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[15].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[15].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[15].dynBal.medium.h", 1, 1, 74, 1024)
DeclareAlias2("tan.vol[15].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[15].dynBal.medium.d", 1, 5, 7789, 1024)
DeclareAlias2("tan.vol[15].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[15].dynBal.medium.T", 1, 5, 7791, 1024)
DeclareAlias2("tan.vol[15].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[15].p", 1, 7, 156, 1024)
DeclareVariable("tan.vol[15].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[15].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[15].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[15].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[15].p", 1, 7, 156, 1024)
DeclareVariable("tan.vol[15].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[15].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[15].dynBal.medium.state.phase", 1, 5, 7798, 1090)
DeclareVariable("tan.vol[15].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[15].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[15].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[15].dynBal.der(m)", 1, 5, 7807, 1024)
DeclareVariable("tan.vol[15].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[15].dynBal.fluidVolume", "Volume [m3]", "tan.vol[15].V", 1,\
 5, 2381, 1024)
DeclareAlias2("tan.vol[15].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[15].heatPort.Q_flow", 1, 5, 2383, 1024)
DeclareAlias2("tan.vol[15].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[15].dynBal.medium.h", 1, 1, 74, 1024)
DeclareParameter("tan.vol[15].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 208, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[15].dynBal.ports_H_flow[1]", "[W]", "tan.vol[15].dynBal.Hb_flow", 1,\
 5, 7808, 1024)
DeclareVariable("tan.vol[15].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[16].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[16].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[16].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[16].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[16].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[16].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[16].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[16].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[16].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[16].dynBal.der(m)", 1, 5, 7837, 1156)
DeclareAlias2("tan.vol[16].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[16].p", 1, 7, 159, 1028)
DeclareAlias2("tan.vol[16].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[16].dynBal.medium.h", 1, 1, 75, 1028)
DeclareVariable("tan.vol[16].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[16].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 75, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[16].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[16].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[16].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[16].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[16].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[16].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[16].dynBal.medium.h", 1, 1, 75, 1024)
DeclareAlias2("tan.vol[16].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[16].dynBal.medium.d", 1, 5, 7819, 1024)
DeclareAlias2("tan.vol[16].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[16].dynBal.medium.T", 1, 5, 7821, 1024)
DeclareAlias2("tan.vol[16].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[16].p", 1, 7, 159, 1024)
DeclareVariable("tan.vol[16].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[16].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[16].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[16].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[16].p", 1, 7, 159, 1024)
DeclareVariable("tan.vol[16].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[16].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[16].dynBal.medium.state.phase", 1, 5, 7828, 1090)
DeclareVariable("tan.vol[16].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[16].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[16].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[16].dynBal.der(m)", 1, 5, 7837, 1024)
DeclareVariable("tan.vol[16].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[16].dynBal.fluidVolume", "Volume [m3]", "tan.vol[16].V", 1,\
 5, 2403, 1024)
DeclareAlias2("tan.vol[16].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[16].heatPort.Q_flow", 1, 5, 2405, 1024)
DeclareAlias2("tan.vol[16].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[16].dynBal.medium.h", 1, 1, 75, 1024)
DeclareParameter("tan.vol[16].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 209, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[16].dynBal.ports_H_flow[1]", "[W]", "tan.vol[16].dynBal.Hb_flow", 1,\
 5, 7838, 1024)
DeclareVariable("tan.vol[16].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[17].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[17].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[17].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[17].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[17].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[17].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[17].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[17].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[17].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[17].dynBal.der(m)", 1, 5, 7867, 1156)
DeclareAlias2("tan.vol[17].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[17].p", 1, 7, 162, 1028)
DeclareAlias2("tan.vol[17].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[17].dynBal.medium.h", 1, 1, 76, 1028)
DeclareVariable("tan.vol[17].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[17].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 76, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[17].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[17].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[17].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[17].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[17].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[17].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[17].dynBal.medium.h", 1, 1, 76, 1024)
DeclareAlias2("tan.vol[17].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[17].dynBal.medium.d", 1, 5, 7849, 1024)
DeclareAlias2("tan.vol[17].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[17].dynBal.medium.T", 1, 5, 7851, 1024)
DeclareAlias2("tan.vol[17].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[17].p", 1, 7, 162, 1024)
DeclareVariable("tan.vol[17].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[17].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[17].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[17].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[17].p", 1, 7, 162, 1024)
DeclareVariable("tan.vol[17].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[17].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[17].dynBal.medium.state.phase", 1, 5, 7858, 1090)
DeclareVariable("tan.vol[17].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[17].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[17].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[17].dynBal.der(m)", 1, 5, 7867, 1024)
DeclareVariable("tan.vol[17].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[17].dynBal.fluidVolume", "Volume [m3]", "tan.vol[17].V", 1,\
 5, 2425, 1024)
DeclareAlias2("tan.vol[17].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[17].heatPort.Q_flow", 1, 5, 2427, 1024)
DeclareAlias2("tan.vol[17].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[17].dynBal.medium.h", 1, 1, 76, 1024)
DeclareParameter("tan.vol[17].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 210, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[17].dynBal.ports_H_flow[1]", "[W]", "tan.vol[17].dynBal.Hb_flow", 1,\
 5, 7868, 1024)
DeclareVariable("tan.vol[17].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[18].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[18].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[18].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[18].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[18].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[18].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[18].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[18].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[18].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[18].dynBal.der(m)", 1, 5, 7897, 1156)
DeclareAlias2("tan.vol[18].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[18].p", 1, 7, 165, 1028)
DeclareAlias2("tan.vol[18].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[18].dynBal.medium.h", 1, 1, 77, 1028)
DeclareVariable("tan.vol[18].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[18].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 77, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[18].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[18].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[18].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[18].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[18].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[18].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[18].dynBal.medium.h", 1, 1, 77, 1024)
DeclareAlias2("tan.vol[18].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[18].dynBal.medium.d", 1, 5, 7879, 1024)
DeclareAlias2("tan.vol[18].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[18].dynBal.medium.T", 1, 5, 7881, 1024)
DeclareAlias2("tan.vol[18].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[18].p", 1, 7, 165, 1024)
DeclareVariable("tan.vol[18].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[18].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[18].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[18].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[18].p", 1, 7, 165, 1024)
DeclareVariable("tan.vol[18].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[18].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[18].dynBal.medium.state.phase", 1, 5, 7888, 1090)
DeclareVariable("tan.vol[18].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[18].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[18].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[18].dynBal.der(m)", 1, 5, 7897, 1024)
DeclareVariable("tan.vol[18].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[18].dynBal.fluidVolume", "Volume [m3]", "tan.vol[18].V", 1,\
 5, 2447, 1024)
DeclareAlias2("tan.vol[18].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[18].heatPort.Q_flow", 1, 5, 2449, 1024)
DeclareAlias2("tan.vol[18].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[18].dynBal.medium.h", 1, 1, 77, 1024)
DeclareParameter("tan.vol[18].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 211, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[18].dynBal.ports_H_flow[1]", "[W]", "tan.vol[18].dynBal.Hb_flow", 1,\
 5, 7898, 1024)
DeclareVariable("tan.vol[18].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[19].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[19].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[19].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[19].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[19].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[19].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[19].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[19].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[19].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[19].dynBal.der(m)", 1, 5, 7927, 1156)
DeclareAlias2("tan.vol[19].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[19].p", 1, 7, 168, 1028)
DeclareAlias2("tan.vol[19].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[19].dynBal.medium.h", 1, 1, 78, 1028)
DeclareVariable("tan.vol[19].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[19].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 78, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[19].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[19].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[19].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[19].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[19].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[19].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[19].dynBal.medium.h", 1, 1, 78, 1024)
DeclareAlias2("tan.vol[19].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[19].dynBal.medium.d", 1, 5, 7909, 1024)
DeclareAlias2("tan.vol[19].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[19].dynBal.medium.T", 1, 5, 7911, 1024)
DeclareAlias2("tan.vol[19].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[19].p", 1, 7, 168, 1024)
DeclareVariable("tan.vol[19].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[19].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[19].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[19].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[19].p", 1, 7, 168, 1024)
DeclareVariable("tan.vol[19].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[19].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[19].dynBal.medium.state.phase", 1, 5, 7918, 1090)
DeclareVariable("tan.vol[19].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[19].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[19].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[19].dynBal.der(m)", 1, 5, 7927, 1024)
DeclareVariable("tan.vol[19].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[19].dynBal.fluidVolume", "Volume [m3]", "tan.vol[19].V", 1,\
 5, 2469, 1024)
DeclareAlias2("tan.vol[19].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[19].heatPort.Q_flow", 1, 5, 2471, 1024)
DeclareAlias2("tan.vol[19].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[19].dynBal.medium.h", 1, 1, 78, 1024)
DeclareParameter("tan.vol[19].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 212, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[19].dynBal.ports_H_flow[1]", "[W]", "tan.vol[19].dynBal.Hb_flow", 1,\
 5, 7928, 1024)
DeclareVariable("tan.vol[19].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.vol[20].dynBal.energyDynamics", "Formulation of energy balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[20].dynBal.massDynamics", "Formulation of mass balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[20].dynBal.substanceDynamics", "Formulation of substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[20].dynBal.traceDynamics", "Formulation of trace substance balance",\
 1, 1.0,4.0,0.0,0,2565)
DeclareVariable("tan.vol[20].dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325.0, 0.0,100000000.0,1000000.0,0,2561)
DeclareVariable("tan.vol[20].dynBal.T_start", "Start value of temperature [K|degC]",\
 333.15, 1.0,10000.0,500.0,0,2561)
DeclareVariable("tan.vol[20].dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[20].dynBal.nPorts", "Number of ports", 1, 0.0,0.0,0.0,0,2565)
DeclareAlias2("tan.vol[20].dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "tan.vol[20].dynBal.der(m)", 1, 5, 7957, 1156)
DeclareAlias2("tan.vol[20].dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "tan.boundary[20].p", 1, 7, 171, 1028)
DeclareAlias2("tan.vol[20].dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "tan.vol[20].dynBal.medium.h", 1, 1, 79, 1028)
DeclareVariable("tan.vol[20].dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,1E+100,101325.0,0,2561)
DeclareState("tan.vol[20].dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 79, 0.0, -10000000000.0,10000000000.0,500000.0,0,2592)
DeclareDerivative("tan.vol[20].dynBal.medium.der(h)", "der(Specific enthalpy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2624)
DeclareVariable("tan.vol[20].dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,500.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.der(d)", "der(Density of medium) [Pa.m-2.s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.T", "Temperature of medium [K|degC]",\
 333.15, 1.0,10000.0,293.15,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.der(T)", "der(Temperature of medium) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 1.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("tan.vol[20].dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.der(u)", "der(Specific internal energy of medium) [m2/s3]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 461.523636506545, 0.0,10000000.0,1000.0,0,2561)
DeclareVariable("tan.vol[20].dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.018015268, 0.001,0.25,0.032,0,2561)
DeclareVariable("tan.vol[20].dynBal.medium.state.phase", "phase of the fluid: 1 for 1-phase, 2 for two-phase, 0 for not known, e.g., interactive use",\
 1, 0.0,2.0,0.0,0,2692)
DeclareAlias2("tan.vol[20].dynBal.medium.state.h", "specific enthalpy [J/kg]", \
"tan.vol[20].dynBal.medium.h", 1, 1, 79, 1024)
DeclareAlias2("tan.vol[20].dynBal.medium.state.d", "density [kg/m3|g/cm3]", \
"tan.vol[20].dynBal.medium.d", 1, 5, 7939, 1024)
DeclareAlias2("tan.vol[20].dynBal.medium.state.T", "temperature [K|degC]", \
"tan.vol[20].dynBal.medium.T", 1, 5, 7941, 1024)
DeclareAlias2("tan.vol[20].dynBal.medium.state.p", "pressure [Pa|bar]", \
"tan.boundary[20].p", 1, 7, 171, 1024)
DeclareVariable("tan.vol[20].dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[20].dynBal.medium.standardOrderComponents", \
"if true, and reducedX = true, the last element of X will be computed from the other ones",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.vol[20].dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.vol[20].dynBal.medium.sat.psat", "saturation pressure [Pa|bar]",\
 "tan.boundary[20].p", 1, 7, 171, 1024)
DeclareVariable("tan.vol[20].dynBal.medium.sat.Tsat", "saturation temperature [K|degC]",\
 500, 1.0,10000.0,500.0,0,2561)
DeclareAlias2("tan.vol[20].dynBal.medium.phase", "2 for two-phase, 1 for one-phase, 0 if not known",\
 "tan.vol[20].dynBal.medium.state.phase", 1, 5, 7948, 1090)
DeclareVariable("tan.vol[20].dynBal.U", "Internal energy of fluid [J]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,1E+100,\
0.0,0,2560)
DeclareVariable("tan.vol[20].dynBal.der(m)", "der(Mass of fluid) [kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.vol[20].dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "tan.vol[20].dynBal.der(m)", 1, 5, 7957, 1024)
DeclareVariable("tan.vol[20].dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, -100000000.0,100000000.0,1000.0,0,2560)
DeclareAlias2("tan.vol[20].dynBal.fluidVolume", "Volume [m3]", "tan.vol[20].V", 1,\
 5, 2491, 1024)
DeclareAlias2("tan.vol[20].dynBal.Q_flow", "Net heat input into component other than through the fluid ports [W]",\
 "tan.vol[20].heatPort.Q_flow", 1, 5, 2493, 1024)
DeclareAlias2("tan.vol[20].dynBal.hOut", "Leaving temperature of the component [J/kg]",\
 "tan.vol[20].dynBal.medium.h", 1, 1, 79, 1024)
DeclareParameter("tan.vol[20].dynBal.initialize_p", "= true to set up initial equations for pressure",\
 213, true, 0.0,0.0,0.0,0,2610)
DeclareAlias2("tan.vol[20].dynBal.ports_H_flow[1]", "[W]", "tan.vol[20].dynBal.Hb_flow", 1,\
 5, 7958, 1024)
DeclareVariable("tan.vol[20].dynBal.rho_nominal", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.datFlueWall.layers.material[1].x", "Material thickness [m]",\
 0.000753, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.000161207450224791, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datFlueWall.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datFlueWall.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("tan.datFlueWall.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 0.669261360412676, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datFlueWall.layers.material[1].nStaReal", "Number of states as a real number",\
 0.012116982988763, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].x", "Material thickness [m]", \
0.012, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnv.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnv.layers.material[1].steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("tan.datTanEnv.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].x", "Material thickness [m]", \
0.002, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnv.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnv.layers.material[2].steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("tan.datTanEnv.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnv.layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.tanTop.layers.material[1].x", "Material thickness [m]", \
0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.layers.material[1].steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanTop.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].piMat", "Ratio x/sqrt(alpha)", \
10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].x", "Material thickness [m]", \
0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.layers.material[2].steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanTop.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].piMat", "Ratio x/sqrt(alpha)", \
4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.opa.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanTop.opa.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.opa.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanTop.opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanTop.opa.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanTop.opa.layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanTop.opa.lay[1].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].dT", "port_a.T - port_b.T [K,]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanTop.opa.lay[1].port_a.T", "Port temperature [K|degC]", \
"tan.tanTop.opa_a.T", 1, 5, 2541, 1028)
DeclareAlias2("tan.tanTop.opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanTop.opa_a.Q_flow", 1, 5, 2542, 1156)
DeclareVariable("tan.tanTop.opa.lay[1].port_b.T", "Port temperature [K|degC]", \
288.15, 0.0,1E+100,0.0,0,2568)
DeclareAlias2("tan.tanTop.opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanTop.opa.Q_flow[2]", -1, 5, 2556, 1156)
DeclareState("tan.tanTop.opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 80, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanTop.opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanTop.opa.lay[1].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanTop.opa_a.Q_flow", 1, 5, 2542, 1024)
DeclareAlias2("tan.tanTop.opa.lay[1].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanTop.opa.Q_flow[2]", 1, 5, 2556, 1024)
DeclareVariable("tan.tanTop.opa.lay[1].material.x", "Material thickness [m]", \
0.012, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanTop.opa.lay[1].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanTop.opa.lay[1].material.steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanTop.opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)", \
10.6655196878514, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].material.nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanTop.opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanTop.opa.lay[1].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanTop.opa.lay[1].der(T[1])", 1, 6, 80, 1024)
DeclareVariable("tan.tanTop.opa.lay[1].nSta", "Number of state variables", 1, \
1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanTop.opa.lay[1].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[1].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].dT", "port_a.T - port_b.T [K,]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanTop.opa.lay[2].port_a.T", "Port temperature [K|degC]", \
"tan.tanTop.opa.lay[1].port_b.T", 1, 5, 8042, 1028)
DeclareAlias2("tan.tanTop.opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanTop.opa.Q_flow[2]", 1, 5, 2556, 1156)
DeclareAlias2("tan.tanTop.opa.lay[2].port_b.T", "Port temperature [K|degC]", \
"tan.tanTop.opa_b.T", 1, 5, 2543, 1028)
DeclareAlias2("tan.tanTop.opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanTop.opa_b.Q_flow", 1, 5, 2544, 1156)
DeclareState("tan.tanTop.opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 81, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanTop.opa.lay[2].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanTop.opa.lay[2].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanTop.opa.Q_flow[2]", 1, 5, 2556, 1024)
DeclareAlias2("tan.tanTop.opa.lay[2].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanTop.opa_b.Q_flow", -1, 5, 2544, 1024)
DeclareVariable("tan.tanTop.opa.lay[2].material.x", "Material thickness [m]", \
0.002, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanTop.opa.lay[2].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanTop.opa.lay[2].material.steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanTop.opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)", \
4.54972526643093, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].material.nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanTop.opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanTop.opa.lay[2].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanTop.opa.lay[2].der(T[1])", 1, 6, 81, 1024)
DeclareVariable("tan.tanTop.opa.lay[2].nSta", "Number of state variables", 1, \
1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanTop.opa.lay[2].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanTop.opa.lay[2].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.datTanEnvTop.layers.material[1].x", "Material thickness [m]",\
 0.012, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.00256904303147078, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnvTop.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnvTop.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("tan.datTanEnvTop.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 10.6655196878514, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[1].nStaReal", "Number of states as a real number",\
 0.193099330498215, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].x", "Material thickness [m]",\
 0.002, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.04, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1380.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 150.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.05, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnvTop.layers.material[2].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnvTop.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("tan.datTanEnvTop.layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 4.54972526643093, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvTop.layers.material[2].nStaReal", "Number of states as a real number",\
 0.0823728171351406, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.tanBas.layers.material[1].x", "Material thickness [m]", \
0.003176, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.000679940055662599, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanBas.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanBas.layers.material[1].steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanBas.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].piMat", "Ratio x/sqrt(alpha)", \
2.82280754405134, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.layers.material[1].nStaReal", "Number of states as a real number",\
 0.0511069561385276, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].x", "Material thickness [m]",\
 0.003176, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.000679940055662599, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanBas.opa.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("tan.tanBas.opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("tan.tanBas.opa.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 2.82280754405134, 0.0,0.0,0.0,0,513)
DeclareVariable("tan.tanBas.opa.layers.material[1].nStaReal", "Number of states as a real number",\
 0.0511069561385276, 0.0,1E+100,0.0,0,513)
DeclareVariable("tan.tanBas.opa.lay[1].A", "Heat transfer area [m2]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].dT", "port_a.T - port_b.T [K,]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanBas.opa.lay[1].port_a.T", "Port temperature [K|degC]", \
"tan.tanBas.opa_a.T", 1, 5, 2600, 1028)
DeclareAlias2("tan.tanBas.opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "tan.tanBas.opa_a.Q_flow", 1, 5, 2601, 1156)
DeclareAlias2("tan.tanBas.opa.lay[1].port_b.T", "Port temperature [K|degC]", \
"burn.heaPorTop.T", 1, 5, 138, 1028)
DeclareAlias2("tan.tanBas.opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "burn.Q_B", -1, 5, 137, 1156)
DeclareState("tan.tanBas.opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 82, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("tan.tanBas.opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("tan.tanBas.opa.lay[1].Q_flow[1]", "Heat flow rate from state i to i+1 [W]",\
 "tan.tanBas.opa_a.Q_flow", 1, 5, 2601, 1024)
DeclareAlias2("tan.tanBas.opa.lay[1].Q_flow[2]", "Heat flow rate from state i to i+1 [W]",\
 "burn.Q_B", 1, 5, 137, 1024)
DeclareVariable("tan.tanBas.opa.lay[1].material.x", "Material thickness [m]", \
0.003176, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.000679940055662599, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanBas.opa.lay[1].material.nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanBas.opa.lay[1].material.steadyState", "Flag, if true, then material is computed using steady-state heat conduction",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanBas.opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)", \
2.82280754405134, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].material.nStaReal", "Number of states as a real number",\
 0.0511069561385276, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].steadyStateInitial", "=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("tan.tanBas.opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].C", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("tan.tanBas.opa.lay[1].der_T[1]", "Time derivative of temperature (= der(T)) [K/s]",\
 "tan.tanBas.opa.lay[1].der(T[1])", 1, 6, 82, 1024)
DeclareVariable("tan.tanBas.opa.lay[1].nSta", "Number of state variables", 1, \
1.0,1E+100,0.0,0,2565)
DeclareVariable("tan.tanBas.opa.lay[1].UAnSta", "Thermal conductance between nodes [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.tanBas.opa.lay[1].UAnSta2", "Thermal conductance between nodes and surface boundary [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("tan.datTanEnvBot.layers.material[1].x", "Material thickness [m]",\
 0.003176, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 4.671, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 473.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 7801.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.000679940055662599, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete",\
 6, 0.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnvBot.layers.material[1].nSta", "Actual number of state variables in material",\
 1, 1.0,1E+100,0.0,0,1541)
DeclareVariable("tan.datTanEnvBot.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("tan.datTanEnvBot.layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 2.82280754405134, 0.0,0.0,0.0,0,1537)
DeclareVariable("tan.datTanEnvBot.layers.material[1].nStaReal", "Number of states as a real number",\
 0.0511069561385276, 0.0,1E+100,0.0,0,1537)
EndNonAlias(1)
{extern void declare__(double x0_[],double dp_[],long*QiErr);declare__(x0_,dp_,QiErr);}}
