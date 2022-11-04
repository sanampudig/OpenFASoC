# OpenFASoC - Fully Open-Source Autonomous SoC
> This Flow Still under development*

## GENERATING .lef, .gds for Aux cells

**Discription** : In Open FASoC Flow to generate a automated Analog design few auxilaury cells are required to be created which cannot me implemented with existing library cells (like Header and SLC in temp_sence_gen).

<img width="285" alt="image" src="https://user-images.githubusercontent.com/110079648/199926204-bcb62999-de84-437b-b318-967db250c25e.png">


### Reduired inputs from previous step of flow:
 - SCHEMATIC and SPECIFICATIONS of AUX cell to be generated.
(usually AUX cell contains lessthan 10 transistors)

### First Step 

- Based upon given SCHEMATIC and SPECIFICATIONS of AUX cell, a SPICE Netlist should be created with .sp file extension.

### Using ALIGN: Analog Layout, Intelligently Generated from Netlists:

**About:**

ALIGN is an open source automatic layout generator for analog circuits jointly developed under the DARPA IDEA program by the University of Minnesota, Texas A&M University, and Intel Corporation.

The goal of ALIGN (Analog Layout, Intelligently Generated from Netlists) is to automatically translate an unannotated (or partially annotated) SPICE netlist of an analog circuit to a GDSII layout. The repository also releases a set of analog circuit designs.

The ALIGN flow includes the following steps:

Circuit annotation creates a multilevel hierarchical representation of the input netlist. This representation is used to implement the circuit layout in using a hierarchical manner.
Design rule abstraction creates a compact JSON-format represetation of the design rules in a PDK. This repository provides a mock PDK based on a FinFET technology (where the parameters are based on published data). These design rules are used to guide the layout and ensure DRC-correctness.
Primitive cell generation works with primitives, i.e., blocks at the lowest level of design hierarchy, and generates their layouts. Primitives typically contain a small number of transistor structures (each of which may be implemented using multiple fins and/or fingers). A parameterized instance of a primitive is automatically translated to a GDSII layout in this step.
Placement and routing performs block assembly of the hierarchical blocks in the netlist and routes connections between these blocks, while obeying a set of analog layout constraints. At the end of this step, the translation of the input SPICE netlist to a GDSII layout is complete.

#### Installing ALIGN:
**Prerequisites**

- gcc >= 6.1.0 (For C++14 support)
- python >= 3.7 

Use the following commands to install ALIGN tool.

```
export CC=/path/to/your/gcc
export CXX=/path/to/your/g++
git clone https://github.com/ALIGN-analoglayout/ALIGN-public
cd ALIGN-public

#Create a Python virtualenv
python -m venv general
source general/bin/activate
python -m pip install pip --upgrade

# Install ALIGN as a USER
pip install -v .

# Install ALIGN as a DEVELOPER
pip install -e .

pip install setuptools wheel pybind11 scikit-build cmake ninja
pip install -v -e .[test] --no-build-isolation
pip install -v --no-build-isolation -e . --no-deps --install-option='-DBUILD_TESTING=ON'
```

#### Making ALIGN Portable to Sky130 tehnology

Clone the following Repository inside ALIGN-public directory

```
git clone https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130
```

move `SKY130_PDK` folder to `/Users/gopalakrishnareddysanampudi/Documents/GitHub/OpenFASoC/AUXCELL/ALIGN-public/pdks`

#### Running ALIGN TOOL

Everytime we start running tool in new terminal run following commands.

```
python -m venv general
source general/bin/activate
```
Commands to run ALIGN (goto ALIGN-public directory)


```
mkdir work
cd work
```
General syntax to give inputs
```
schematic2layout.py <NETLIST_DIR> -p <PDK_DIR> -c
```

Running a EXAMPLE:
```
schematic2layout.py ../examples/telescopic_ota -p ../pdks/FinFET14nm_Mock_PDK/
```
Running a EXAMPLE on Sky130pdk
```
schematic2layout.py ../ALIGN-pdk-sky130/examples/five_transistor_ota -p ../pdks/SKY130_PDK/
```
#### Generated .lef and .gds files for example (using Sky130pdk)

- TELESCOPIC_OTA .gds 

<img width="756" alt="image" src="https://user-images.githubusercontent.com/110079648/199897266-907a73cb-c35c-48dc-ad33-b6a0152f9829.png">

- TELESCOPIC_OTA .lef

<img width="751" alt="image" src="https://user-images.githubusercontent.com/110079648/199896853-aa5db834-c94f-4415-bb24-0aedf826bf41.png">

-FIVE_TRANSISTOR_OTA .gds

<img width="755" alt="image" src="https://user-images.githubusercontent.com/110079648/199897042-c22c79a4-aecd-4091-acdb-798dbd229e57.png">

-FIVE_TRANSISTOR_OTA .lef

<img width="755" alt="image" src="https://user-images.githubusercontent.com/110079648/199897231-8e85a4ab-67a6-4482-bca6-98121c485561.png">

EXAMPLES of
## RUNNING ALIGN FOR input user SPICE Netlist

A simple SPICE Netlist for inverter is written to generate .lef and .gds files

```

```
- .gds


<img width="857" alt="image" src="https://user-images.githubusercontent.com/110079648/199897719-b3037219-6157-4331-b9f7-80edf3a226dd.png">

- .lef


<img width="860" alt="image" src="https://user-images.githubusercontent.com/110079648/199897814-4ac68600-abc6-4ca1-88bb-092bf7098d0f.png">

# Contribuers
-  SANAMPUDI GOPALA KRISHNA REDDY, Postgraduate Student, International Institute of Information Technology, Bangalore
-  GANDI AJAY KUMAR, Postgraduate Student, International Institute of Information Technology, Bangalore
-  GOGIREDDY RAVI KIRAN REDDY, Postgraduate Student, International Institute of Information Technology, Bangalore
-  KUNAL GHOSH, Director, VSD Corp. Pvt. Ltd

# Acknowledgments
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

	


