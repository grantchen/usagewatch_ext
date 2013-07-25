[![Coverage Status](https://coveralls.io/repos/rderoldan1/usagewatch/badge.png)](https://coveralls.io/r/rderoldan1/usagewatch)
[![Gem Version](https://badge.fury.io/rb/usagewatch.png)](http://badge.fury.io/rb/usagewatch)
[![Build Status](https://travis-ci.org/rderoldan1/usagewatch.png?branch=master)](https://travis-ci.org/rderoldan1/usagewatch)

# usagewatch extended version

License: (MIT) Copyright (C) 2013 Author Ruben Espinosa.

## DESCRIPTION:
This project is based in [Usagewatch](https://github.com/rderoldan1/nethacker/usagewatch) gem written by Phil Chen, I try to expand the OS version, first with mac OS,
in future versions Windows will be include.

This is Ruby Gem with methods to find usage statistics on your system such as CPU, Disk, TCP/UDP Connections, Load,
Bandwidth, Disk I/O, and Memory, top processes by memory and cpu consumption

## Getting Started

gem install usagewatch_ext

```ruby
require 'usagewatch_ext'

usw = UsagewatchExt

usw.uw_diskused
usw.uw_diskused_perc
usw.uw_cpuused
usw.uw_tcpused
usw.uw_udpused
usw.uw_memused
usw.uw_load
usw.uw_bandrx
usw.uw_bandtx
usw.uw_diskioreads
usw.uw_diskiowrites
usw.uw_cputop
usw.uw_memtop
```

## Example

```bash
Run:

linux_example.rb

Example Output:

11.56 Gigabytes Disk Used
7.0% Disk Used
0.25% CPU Used
30 TCP Connections Used
0 UDP Connections Used
43% Active Memory Used
0.01 Average System Load Of The Past Minute
0.008 Mbit/s Current Bandwidth Received
0.2 Mbit/s Current Bandwidth Transmitted
0/s Current Disk Reads Completed
2/s Current Disk Writes Completed
Top Ten Processes By CPU Consumption:
[["/usr/lib64/erlang/erts-5.8.5/bin/beam.smp", "5.2"], ["ruby", "4.1"], ["ps", "2.0"], ["abrt-dump-oops", "0.8"], ["aoe_ktio", "0.7"], ["aoe_tx", "0.4"], ["ata_sff", "0.2"], ["auditd", "0.1"], ["awk", "0.1"], ["-bash", "0.1"]]
Top Ten Processes By Memory Consumption:
[["unicorn", "4.8"], ["unicorn", "4.7"], ["unicorn", "4.6"], ["unicorn", "4.6"], ["unicorn", "4.5"], ["unicorn", "4.5"], ["unicorn", "4.3"], ["unicorn", "4.3"], ["unicorn", "4.2"], ["/usr/lib64/erlang/erts-5.8.5/bin/beam.smp", "4.0"]]
```

```bash
Run:

mac_example.rb

Example Output:

Mac version is under development
92.8 Gigabytes Used
24.96 Percentage of Gigabytes Used
71.47% Active Memory Used
7.69% CPU Used
1.19 Average System Load Of The Past Minute
Top Ten Processes By CPU Consumption: [["PluginProcess", "9.0"], ["WindowServer", "2.7"], ["iPhoto", "1.2"], ["Terminal", "1.0"], ["rubymine", "0.5"], ["SystemUIServer", "0.1"], ["(scanunit)", "0.0"], ["(scanunit)", "0.0"], ["(scanunit)", "0.0"], ["(scanunit)", "0.0"]]
Top Ten Processes By Memory Consumption: [["WebProcess", "8.3"], ["rubymine", "6.4"], ["Safari", "2.0"], ["iPhoto", "1.8"], ["Mail", "1.7"], ["mds", "1.6"], ["ruby", "1.5"], ["WindowServer", "1.3"], ["PluginProcess", "1.2"], ["GitHub", "1.1"]]
```


## Methods available

##### Linux
    uw_diskused
    uw_diskused_perc
    uw_cpuused
    uw_tcpused
    uw_udpused
    uw_memused
    uw_load
    uw_bandrx
    uw_bandtx
    uw_diskioreads
    uw_diskiowrites
    uw_cputop
    uw_memtop

##### Mac
    uw_diskused
    uw_diskused_perc
    uw_cputop
    uw_memtop
    uw_load
    uw_cpuused
    uw_memused


## Notes

Disk Used is a sum of all partitions calculated in Gigabytes

Disk Used Percentage is a total percentage of all disk partitions used

CPU Used is a percentage of current CPU being used

TCP/UDP Connections Used is a total count of each respectively

Active Memory Used is a percentage of active system memory being used

Load is the average load of the past minute

Bandwidth is current received and transmitted in Megabits

Disk IO is current disk reads and writes completed per second

Top Ten Processes By CPU Consumption are based on percent CPU used

Top Ten Processes By Memory Consumption are base on percent Memory used

## Tested Using

RUBY VERSIONS:
ruby 1.9.3p429 (2013-05-15) [x86_64-linux]

OS VERSIONS:
CENTOS 5x 6x, Ubuntu 12.04, Fedora 18, Mountain Lion 10.8.4
