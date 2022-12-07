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

