# AUX CELL GENERATION FOR - OpenFASoC(Fully Open-Source Autonomous SoC)
> This Flow Still under development*

## GENERATING .lef, .gds for Aux cells

**Discription** : In Open FASoC Flow to generate a automated Analog design, few auxilaury cells(.lef,.gds) are required to be created which cannot be implemented with existing library cells (like Header and SLC in temp_sence_gen). To generate these .lef and .gds files of AUX cells we use ALIGN.

<img width="285" alt="image" src="https://user-images.githubusercontent.com/110079648/199926204-bcb62999-de84-437b-b318-967db250c25e.png">


### Reduired inputs from previous step of flow:
 - SCHEMATIC and SPECIFICATIONS of AUX cell to be generated.
(usually AUX cell contains less than 12 transistors)

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
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
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

#### FLOW

Creating a Python virtualenv

![image_2022-11-04_13-58-54](https://user-images.githubusercontent.com/110079648/199928893-d6f7f7cd-61a1-498f-afed-13cbc0914e31.png)

Running design

![image_2022-11-04_13-58-29](https://user-images.githubusercontent.com/110079648/199929139-1f75be9d-d8a9-4630-833d-9055165157c3.png)

![image_2022-11-04_13-59-33](https://user-images.githubusercontent.com/110079648/199929188-936b7d63-97af-4d9f-862d-63b2e88e8227.png)

![image_2022-11-04_14-00-21](https://user-images.githubusercontent.com/110079648/199929296-308b4efa-429e-4ca6-a892-24bab448cbb8.png)


#### Generated .lef and .gds files for example (using Sky130pdk)

- TELESCOPIC_OTA .gds 

<img width="725" alt="image" src="https://user-images.githubusercontent.com/110079648/199927903-0633843d-cc26-47a0-845c-2e32b301565b.png">

- TELESCOPIC_OTA .lef

<img width="729" alt="image" src="https://user-images.githubusercontent.com/110079648/199928376-ea9d82d4-e14a-4f2f-acca-f6ddd12dbbd6.png">

- FIVE_TRANSISTOR_OTA .gds

<img width="755" alt="image" src="https://user-images.githubusercontent.com/110079648/199897042-c22c79a4-aecd-4091-acdb-798dbd229e57.png">

- FIVE_TRANSISTOR_OTA .lef

<img width="755" alt="image" src="https://user-images.githubusercontent.com/110079648/199897231-8e85a4ab-67a6-4482-bca6-98121c485561.png">


## RUNNING ALIGN FOR input user SPICE Netlist

A simple SPICE Netlist for inverter is written to generate .lef and .gds files

```
.subckt inverter vinn voutn vdd 0
m1 voutn vinn vdd vdd pmos_rvt w=840e-9 l=150e-9 nf=2
m2 voutn vinn 0 0 nmos_rvt w=840e-9 l=150e-9 nf=2
.ends inverter
** End of subcircuit definition.
```
- .gds


<img width="857" alt="image" src="https://user-images.githubusercontent.com/110079648/199897719-b3037219-6157-4331-b9f7-80edf3a226dd.png">

- .lef


<img width="860" alt="image" src="https://user-images.githubusercontent.com/110079648/199897814-4ac68600-abc6-4ca1-88bb-092bf7098d0f.png">

#### USER EXAMPLE 2


![IMAGE 2022-11-05 14:15:13](https://user-images.githubusercontent.com/110079648/200111553-23bbe1ba-7bfe-4aad-9613-06f60cc7a797.jpg)

- Writing netlist from circuit
```
.subckt switch dig_in in_1 in_2 Vout N001
M1 in_1 dig_in Vout Vout nmos_rvt L=180n W=420n nf=2
M2 Vout N002 in_2 in_2 nmos_rvt L=180n W=420n nf=2
M4 N002 dig_in 0 0 nmos_rvt L=180n W =420n nf=2
M5 N002 dig_in N001 N001 pmos_rvt L=180n W=420n nf=2
M6 in_2 dig_in Vout Vout pmos_rvt L=180n W=420n nf=2
M3 Vout N002 in_1 in_1 pmos_rvt L=180n W=420n nf=2
.ends switch
```
- .gds file

<img width="728" alt="image" src="https://user-images.githubusercontent.com/110079648/200111690-75c0ed6c-d4fa-447e-be9a-163e75659ac3.png">

- .lef file

<img width="799" alt="image" src="https://user-images.githubusercontent.com/110079648/200111738-1560bd25-79d3-499c-b751-52f698d74aa9.png">

# DESIGNING AUX CELLS FOR PLL
Source Repo for SPICE FILES - https://github.com/lakshmi-sathi/avsdpll_1v8

## 1 - Charge Pump - GOPALA KRISHNA REDDY

### Circuit:

![CP](https://user-images.githubusercontent.com/110079648/201048674-4052a8b5-e5a2-4ce2-ba25-bcc11d337d27.jpg)

```
.subckt cp dn out up vdd vss

m1 in_2 in_2 vdd vdd sky130_fd_pr__pfet_01v8 L=150n W=420n

m2 in_3 in_2 vdd vdd sky130_fd_pr__pfet_01v8 L=150n  W=540n

m3 out downb in_3 in_3 sky130_fd_pr__pfet_01v8 L=150n  W=420n

m4 out up 7 7 sky130_fd_pr__nfet_01v8 L=150n  W=420n

m5 7 8 vss vss sky130_fd_pr__nfet_01v8 L=150n  W=540n

m6 8 8 vss vss sky130_fd_pr__nfet_01v8 L=150n  W=420n

m7 9 dn in_3 in_3 sky130_fd_pr__pfet_01v8 L=150n  W=540n
m8 9 9 vss vss sky130_fd_pr__nfet_01v8 L=150n  W=420n

m11 up upb vdd vdd sky130_fd_pr__pfet_01v8 L=150n  W=720n

m12 up upb vss vss sky130_fd_pr__nfet_01v8 L=150n  W=420n
m13 dn downb vdd vdd sky130_fd_pr__pfet_01v8 L=150n  W=720n

m14 dn downb vss vss sky130_fd_pr__nfet_01v8 L=150n  W=420n

m9 10 10 vdd vdd sky130_fd_pr__pfet_01v8 L=150n  W=420n

m10 10 upb 7 7 sky130_fd_pr__nfet_01v8 L=150n  W=540n

.ends cp

```
### .GDS

<img width="393" alt="image" src="https://user-images.githubusercontent.com/110079648/206165878-cf4a4321-e14b-49ae-b290-4fec42fe62f7.png">

### .LEF

<img width="392" alt="image" src="https://user-images.githubusercontent.com/110079648/206165962-119ae4a0-7a0e-49b7-ab17-887c266b3223.png">

## 2 - FREQUENCY DIVIDER - RAVI KIRAN REDDY

### Circuit:

<img width="477" alt="image" src="https://user-images.githubusercontent.com/110079648/206166559-20968ba3-b5af-4ab5-ae7e-066910dc645a.png">

```

.subckt FD Clk vout Clkb

xm1 3 2 vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=840n
xm2 3 2 0 0 sky130_fd_pr__nfet_01v8 l=150n w=420n

xm3 3 Clkb 4 vdd sky130_fd_pr__pfet_01v8 l=150n w=420n
xm4 3 Clk 4 0 sky130_fd_pr__nfet_01v8 l=150n w=840n

xm7 5 4 vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=840n
xm8 5 4 0 0 sky130_fd_pr__nfet_01v8 l=150n w=420n

xm9 5 Clk vout vdd sky130_fd_pr__pfet_01v8 l=150n w=420n
xm10 5 Clkb vout 0 sky130_fd_pr__nfet_01v8 l=150n w=840n

xm11 2 vout vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=840n
xm12 2 vout 0 0 sky130_fd_pr__nfet_01v8 l=150n w=420n

*xm13 Clkb Clk vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=840n
*xm14 Clkb Clk 0 0 sky130_fd_pr__nfet_01v8 l=150n w=420n


.ends FD

```
### .GDS
<img width="205" alt="image" src="https://user-images.githubusercontent.com/110079648/206166922-10cdd372-0b6b-41e7-a790-7c9eb85d77e3.png">

### .LEF
<img width="160" alt="image" src="https://user-images.githubusercontent.com/110079648/206169385-e4423db6-95e8-44d3-8862-20f5e9cf55a6.png">

## 3 - PHASE DETECTOR - RAVI KIRAN REDDY
### Circuit:

<img width="505" alt="image" src="https://user-images.githubusercontent.com/110079648/206167477-9d10a1c7-966c-465d-a7d5-919697ca0a94.png">


```
.subckt PD CLKref CLKvco up down vss vdd

xm1 3 CLKref vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=640n
xm2 3 CLKref 4 vss sky130_fd_pr__nfet_01v8 l=150n w=1800n
xm3 4 CLKvco vss vss sky130_fd_pr__nfet_01v8 l=150n w=420n

xm4 6 CLKvco vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=640n
xm5 6 CLKvco 7 vss sky130_fd_pr__nfet_01v8 l=150n w=1800n
xm6 7 CLKref vss vss sky130_fd_pr__nfet_01v8 l=150n w=420n

xm7 up1 CLKref 3 vss sky130_fd_pr__nfet_01v8 l=150n w=840n
xm8 clk1 clk1 up1 up1 sky130_fd_pr__pfet_01v8 l=150n w=640n
xm11 upb up1 vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=720n
xm12 upb up1 vss vss sky130_fd_pr__nfet_01v8 l=150n w=420n
xm15 up upb vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=960n
xm16 up upb vss vss sky130_fd_pr__nfet_01v8 l=150n w=480n
xm9 dn1 clk2 6 6 sky130_fd_pr__nfet_01v8 l=150n w=840n
xm10 clk2 clk2 dn1 dn1 sky130_fd_pr__pfet_01v8 l=150n w=640n
xm13 downb dn1 vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=720n
xm14 downb dn1 vss vss sky130_fd_pr__nfet_01v8 l=150n w=420n
xm17 down downb vdd vdd sky130_fd_pr__pfet_01v8 l=150n w=960n
xm18 down downb vss vss sky130_fd_pr__nfet_01v8 l=150n w=480n

.ends PD

```
### .GDS

<img width="1066" alt="image" src="https://user-images.githubusercontent.com/110079648/206167617-6398b2ba-2121-45d5-a722-ac98b90a4104.png">

### .LEF

<img width="1069" alt="image" src="https://user-images.githubusercontent.com/110079648/206167892-c6046aea-2805-467e-a135-58f1746c1708.png">

## 4 - VOLTAGE CONTROLLED OSCILLATOR - GANDI AJAY KUMAR
### Circuit:

<img width="600" alt="image" src="https://user-images.githubusercontent.com/110079648/206168206-0995b027-e6e4-48a2-913a-294f6e441d59.png">

```
.subckt VCO in out VSS VDD
.include /home/ajaykumar/Downloads/spicelib/sky130.lib
xm1 3 16 10 10 sky130_fd_pr__pfet_01v8 l=150n w=420n
xm2 3 16 9 9 sky130_fd_pr__nfet_01v8 l=150n w=420n
xm3 4 3 10 10 sky130_fd_pr__pfet_01v8 l=150n w=420n
xm4 4 3 9 9 sky130_fd_pr__nfet_01v8 l=150n w=420n
xm5 vout 4 10 10 sky130_fd_pr__pfet_01v8 l=150n w=420n
xm6 vout 4 9 9 sky130_fd_pr__nfet_01v8 l=150n w=420n
xm11 13 vout 10 10 sky130_fd_pr__pfet_01v8 l=150n w=420n
xm12 13 vout 9 9 sky130_fd_pr__nfet_01v8 l=150n w=420n
xm13 14 13 10 10 sky130_fd_pr__pfet_01v8 l=150n w=420n
xm14 14 13 9 9 sky130_fd_pr__nfet_01v8 l=150n w=420n
xm15 15 14 10 10 sky130_fd_pr__pfet_01v8 l=150n w=420n
xm16 15 14 9 9 sky130_fd_pr__nfet_01v8 l=150n w=420n
xm17 16 15 10 10 sky130_fd_pr__pfet_01v8 l=150n w=2400n
xm18 16 15 9 9 sky130_fd_pr__nfet_01v8 l=150n w=1200n
xm7 10 5 VDD VDD sky130_fd_pr__pfet_01v8 l=150n w=1080n
xm8 5 5 VDD VDD sky130_fd_pr__pfet_01v8 l=150n w=1080n
xm9 5 in VSS VSS sky130_fd_pr__nfet_01v8 l=150n w=840n
xm10 9 in VSS VSS sky130_fd_pr__nfet_01v8 l=150n w=1080n
xm19 11 16 VDD VDD sky130_fd_pr__pfet_01v8 l=150n w=720n
xm20 11 16 VSS VSS sky130_fd_pr__nfet_01v8 l=150n w=420n
xm21 out 11 VDD VDD sky130_fd_pr__pfet_01v8 l=150n w=720n
xm22 out 11 VSS VSS sky130_fd_pr__nfet_01v8 l=150n w=420n
.ends VCO

```
### .GDS

<img width="416" alt="image" src="https://user-images.githubusercontent.com/110079648/206168470-f440549a-b9f5-4ff4-98bd-f4f21a0e8e33.png">

### .LEF

<img width="413" alt="image" src="https://user-images.githubusercontent.com/110079648/206168558-88c2f766-1b2e-48b0-9173-baa140b6bdd4.png">

# FUTURE WORK:
POST LAYOUT SIMULATIONS ARE NOT EXACTLY MATCHING. HAVE TO DEBUG AT EVERY TRANSISTOR AND IDENTFY WHERE IT IS FAILING
# AUTHORS
-  *SANAMPUDI GOPALA KRISHNA REDDY MT2022527*, Postgraduate Student, International Institute of Information Technology, Bangalore
-  *GANDI AJAY KUMAR*, Postgraduate Student, International Institute of Information Technology, Bangalore
-  *GOGIREDDY RAVI KIRAN REDDY*, Postgraduate Student, International Institute of Information Technology, Bangalore
# Contributers
-  *KUNAL GHOSH*, Director, VSD Corp. Pvt. Ltd


# Acknowledgments
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
- Madhav Rao, Associate Professor, IIIT Bangalore.
- Nanditha Rao, Assistant Professor, IIIT Bangalore.
	
# REFERENCE 

- Lakshmi S, MS ECE - MAIL: lakshmi.sathi96@gmail.com GITHUB: https://github.com/lakshmi-sathi/avsdpll_1v8



