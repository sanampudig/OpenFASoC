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

