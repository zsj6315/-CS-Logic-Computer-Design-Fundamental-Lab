# 按钮约束
set_property PACKAGE_PIN AF13  [get_ports {BTN[0]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {BTN[0]}]  # SW[14]

set_property PACKAGE_PIN AF10  [get_ports {BTN[1]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {BTN[1]}]  # SW[15]

# 七段数码管段选约束
set_property PACKAGE_PIN AB22  [get_ports {SEGMENT[0]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[0]}]  # a

set_property PACKAGE_PIN AD24  [get_ports {SEGMENT[1]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[1]}]  # b

set_property PACKAGE_PIN AD23  [get_ports {SEGMENT[2]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[2]}]  # c

set_property PACKAGE_PIN Y21   [get_ports {SEGMENT[3]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[3]}]  # d

set_property PACKAGE_PIN W20   [get_ports {SEGMENT[4]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[4]}]  # e

set_property PACKAGE_PIN AC24  [get_ports {SEGMENT[5]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[5]}]  # f

set_property PACKAGE_PIN AC23  [get_ports {SEGMENT[6]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[6]}]  # g

set_property PACKAGE_PIN AA22  [get_ports {SEGMENT[7]}]
set_property IOSTANDARD  LVCMOS33 [get_ports {SEGMENT[7]}]  # point

# 拨码开关约束
set_property PACKAGE_PIN AA10  [get_ports {SW[0]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[0]}]

set_property PACKAGE_PIN AB10  [get_ports {SW[1]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[1]}]

set_property PACKAGE_PIN AA13  [get_ports {SW[2]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[2]}]

set_property PACKAGE_PIN AA12  [get_ports {SW[3]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[3]}]

set_property PACKAGE_PIN Y13   [get_ports {SW[4]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[4]}]

set_property PACKAGE_PIN Y12   [get_ports {SW[5]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[5]}]

set_property PACKAGE_PIN AD11  [get_ports {SW[6]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[6]}]

set_property PACKAGE_PIN AD10  [get_ports {SW[7]}]
set_property IOSTANDARD  LVCMOS15 [get_ports {SW[7]}]