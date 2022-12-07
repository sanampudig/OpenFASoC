
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
