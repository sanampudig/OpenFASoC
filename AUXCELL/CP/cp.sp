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
