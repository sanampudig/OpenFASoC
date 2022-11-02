# OpenFASoC - Fully Open-Source Autonomous SoC Synthesis using Customizable Cell-Based Synthesizable Analog Circuits

OpenFASoC is a project focused on automated analog generation from user specification to GDSII with fully open-sourced tools. It is led by a team of researchers at the University of Michigan and is inspired from FASoC which sits on proprietary software.

The tool is comprised of analog and mixed-signal circuit generators, which automatically create a physical design based on user specifications.

## PreRequisites
Python 3.7+ required (Matplotlib, Pandas library should be downloaded)

Necessary tools:

- Magic https://github.com/RTimothyEdwards/magic

- Netgen https://github.com/RTimothyEdwards/netgen

- Klayout https://github.com/KLayout/klayout Please use this command to build preferably: ./build.sh -option '-j8' -noruby -without-qt-multimedia -without-qt-xml -without-qt-svg

- Yosys https://github.com/The-OpenROAD-Project/yosys

- OpenROAD https://github.com/The-OpenROAD-Project/OpenROAD (commid id: 7ff7171)

- open_pdks https://github.com/RTimothyEdwards/open_pdks

open_pdks is required to run drc/lvs check and the simulations
After open_pdks is installed, please update the open_pdks key in common/platform_config.json with the installed path, down to the sky130A folder

Note: All the required tools need to be loaded into the environment before running this generator.

## Getting started
Git clone the following repo
```
git clone https://github.com/idea-fasoc/OpenFASOC
```
Goto this link for more instructions:
https://github.com/idea-fasoc/OpenFASOC/blob/main/docs/source/getting-started.rst

After completing, Goto /OpenFASOC/openfasoc/common/platform_config.json and edit platform.json file with appropriate paths (mainly openPDKs)

<img width="932" alt="image" src="https://user-images.githubusercontent.com/110079648/199405587-0e23fb3b-b420-4992-9e9b-2708a784b886.png">


