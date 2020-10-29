<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="A0" />
        <signal name="B0" />
        <signal name="A1" />
        <signal name="B1" />
        <signal name="A2" />
        <signal name="B2" />
        <signal name="A3" />
        <signal name="B3" />
        <signal name="A4" />
        <signal name="B4" />
        <signal name="A5" />
        <signal name="B5" />
        <signal name="A6" />
        <signal name="B6" />
        <signal name="A7" />
        <signal name="B7" />
        <signal name="SUM0" />
        <signal name="SUM1" />
        <signal name="SUM2" />
        <signal name="SUM3" />
        <signal name="SUM4" />
        <signal name="SUM5" />
        <signal name="SUM6" />
        <signal name="SUM7" />
        <signal name="C_OUT" />
        <signal name="XLXN_33">
        </signal>
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="B3" />
        <port polarity="Input" name="A4" />
        <port polarity="Input" name="B4" />
        <port polarity="Input" name="A5" />
        <port polarity="Input" name="B5" />
        <port polarity="Input" name="A6" />
        <port polarity="Input" name="B6" />
        <port polarity="Input" name="A7" />
        <port polarity="Input" name="B7" />
        <port polarity="Output" name="SUM0" />
        <port polarity="Output" name="SUM1" />
        <port polarity="Output" name="SUM2" />
        <port polarity="Output" name="SUM3" />
        <port polarity="Output" name="SUM4" />
        <port polarity="Output" name="SUM5" />
        <port polarity="Output" name="SUM6" />
        <port polarity="Output" name="SUM7" />
        <port polarity="Output" name="C_OUT" />
        <blockdef name="FullAdder">
            <timestamp>2020-10-28T16:16:57</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="FullAdder" name="XLXI_1">
            <blockpin signalname="XLXN_33" name="C_IN" />
            <blockpin signalname="A0" name="A_BIT" />
            <blockpin signalname="B0" name="B_BIT" />
            <blockpin signalname="SUM0" name="SUM" />
            <blockpin signalname="XLXN_1" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="C_IN" />
            <blockpin signalname="A1" name="A_BIT" />
            <blockpin signalname="B1" name="B_BIT" />
            <blockpin signalname="SUM1" name="SUM" />
            <blockpin signalname="XLXN_2" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_35">
            <blockpin signalname="XLXN_2" name="C_IN" />
            <blockpin signalname="A2" name="A_BIT" />
            <blockpin signalname="B2" name="B_BIT" />
            <blockpin signalname="SUM2" name="SUM" />
            <blockpin signalname="XLXN_3" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_36">
            <blockpin signalname="XLXN_3" name="C_IN" />
            <blockpin signalname="A3" name="A_BIT" />
            <blockpin signalname="B3" name="B_BIT" />
            <blockpin signalname="SUM3" name="SUM" />
            <blockpin signalname="XLXN_4" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_40">
            <blockpin signalname="XLXN_4" name="C_IN" />
            <blockpin signalname="A4" name="A_BIT" />
            <blockpin signalname="B4" name="B_BIT" />
            <blockpin signalname="SUM4" name="SUM" />
            <blockpin signalname="XLXN_5" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_41">
            <blockpin signalname="XLXN_5" name="C_IN" />
            <blockpin signalname="A5" name="A_BIT" />
            <blockpin signalname="B5" name="B_BIT" />
            <blockpin signalname="SUM5" name="SUM" />
            <blockpin signalname="XLXN_6" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_42">
            <blockpin signalname="XLXN_6" name="C_IN" />
            <blockpin signalname="A6" name="A_BIT" />
            <blockpin signalname="B6" name="B_BIT" />
            <blockpin signalname="SUM6" name="SUM" />
            <blockpin signalname="XLXN_7" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_43">
            <blockpin signalname="XLXN_7" name="C_IN" />
            <blockpin signalname="A7" name="A_BIT" />
            <blockpin signalname="B7" name="B_BIT" />
            <blockpin signalname="SUM7" name="SUM" />
            <blockpin signalname="C_OUT" name="C_OUT" />
        </block>
        <block symbolname="gnd" name="XLXI_76">
            <blockpin signalname="XLXN_33" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2336" y="480" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2336" y="816" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2336" y="1152" name="XLXI_35" orien="R0">
        </instance>
        <instance x="2336" y="1488" name="XLXI_36" orien="R0">
        </instance>
        <instance x="2336" y="1824" name="XLXI_40" orien="R0">
        </instance>
        <instance x="2336" y="2160" name="XLXI_41" orien="R0">
        </instance>
        <instance x="2336" y="2496" name="XLXI_42" orien="R0">
        </instance>
        <instance x="2336" y="2832" name="XLXI_43" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="2240" y1="512" y2="656" x1="2240" />
            <wire x2="2336" y1="656" y2="656" x1="2240" />
            <wire x2="2800" y1="512" y2="512" x1="2240" />
            <wire x2="2800" y1="448" y2="448" x1="2720" />
            <wire x2="2800" y1="448" y2="512" x1="2800" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="2240" y1="848" y2="992" x1="2240" />
            <wire x2="2336" y1="992" y2="992" x1="2240" />
            <wire x2="2800" y1="848" y2="848" x1="2240" />
            <wire x2="2800" y1="784" y2="784" x1="2720" />
            <wire x2="2800" y1="784" y2="848" x1="2800" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="2800" y1="1184" y2="1184" x1="2240" />
            <wire x2="2240" y1="1184" y2="1328" x1="2240" />
            <wire x2="2336" y1="1328" y2="1328" x1="2240" />
            <wire x2="2800" y1="1120" y2="1120" x1="2720" />
            <wire x2="2800" y1="1120" y2="1184" x1="2800" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2240" y1="1520" y2="1664" x1="2240" />
            <wire x2="2336" y1="1664" y2="1664" x1="2240" />
            <wire x2="2800" y1="1520" y2="1520" x1="2240" />
            <wire x2="2800" y1="1456" y2="1456" x1="2720" />
            <wire x2="2800" y1="1456" y2="1520" x1="2800" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2240" y1="1856" y2="2000" x1="2240" />
            <wire x2="2336" y1="2000" y2="2000" x1="2240" />
            <wire x2="2800" y1="1856" y2="1856" x1="2240" />
            <wire x2="2800" y1="1792" y2="1792" x1="2720" />
            <wire x2="2800" y1="1792" y2="1856" x1="2800" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="2240" y1="2192" y2="2336" x1="2240" />
            <wire x2="2336" y1="2336" y2="2336" x1="2240" />
            <wire x2="2800" y1="2192" y2="2192" x1="2240" />
            <wire x2="2800" y1="2128" y2="2128" x1="2720" />
            <wire x2="2800" y1="2128" y2="2192" x1="2800" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="2240" y1="2528" y2="2672" x1="2240" />
            <wire x2="2336" y1="2672" y2="2672" x1="2240" />
            <wire x2="2784" y1="2528" y2="2528" x1="2240" />
            <wire x2="2784" y1="2464" y2="2464" x1="2720" />
            <wire x2="2784" y1="2464" y2="2528" x1="2784" />
        </branch>
        <branch name="A0">
            <wire x2="2336" y1="384" y2="384" x1="1840" />
        </branch>
        <branch name="B0">
            <wire x2="2336" y1="448" y2="448" x1="1840" />
        </branch>
        <branch name="A1">
            <wire x2="2336" y1="720" y2="720" x1="1840" />
        </branch>
        <branch name="B1">
            <wire x2="2336" y1="784" y2="784" x1="1840" />
        </branch>
        <branch name="A2">
            <wire x2="2336" y1="1056" y2="1056" x1="1840" />
        </branch>
        <branch name="B2">
            <wire x2="2336" y1="1120" y2="1120" x1="1840" />
        </branch>
        <branch name="A3">
            <wire x2="2336" y1="1392" y2="1392" x1="1840" />
        </branch>
        <branch name="B3">
            <wire x2="2336" y1="1456" y2="1456" x1="1840" />
        </branch>
        <branch name="A4">
            <wire x2="2336" y1="1728" y2="1728" x1="1840" />
        </branch>
        <branch name="B4">
            <wire x2="2336" y1="1792" y2="1792" x1="1840" />
        </branch>
        <branch name="A5">
            <wire x2="2336" y1="2064" y2="2064" x1="1840" />
        </branch>
        <branch name="B5">
            <wire x2="2336" y1="2128" y2="2128" x1="1840" />
        </branch>
        <branch name="A6">
            <wire x2="2336" y1="2400" y2="2400" x1="1840" />
        </branch>
        <branch name="B6">
            <wire x2="2336" y1="2464" y2="2464" x1="1840" />
        </branch>
        <branch name="A7">
            <wire x2="2336" y1="2736" y2="2736" x1="1840" />
        </branch>
        <branch name="B7">
            <wire x2="2336" y1="2800" y2="2800" x1="1840" />
        </branch>
        <branch name="SUM0">
            <wire x2="3280" y1="320" y2="320" x1="2720" />
        </branch>
        <branch name="SUM1">
            <wire x2="3280" y1="656" y2="656" x1="2720" />
        </branch>
        <branch name="SUM2">
            <wire x2="3280" y1="992" y2="992" x1="2720" />
        </branch>
        <branch name="SUM3">
            <wire x2="3280" y1="1328" y2="1328" x1="2720" />
        </branch>
        <branch name="SUM4">
            <wire x2="3280" y1="1664" y2="1664" x1="2720" />
        </branch>
        <branch name="SUM5">
            <wire x2="3280" y1="2000" y2="2000" x1="2720" />
        </branch>
        <branch name="SUM6">
            <wire x2="3280" y1="2336" y2="2336" x1="2720" />
        </branch>
        <branch name="SUM7">
            <wire x2="3280" y1="2672" y2="2672" x1="2720" />
        </branch>
        <branch name="C_OUT">
            <wire x2="3280" y1="2800" y2="2800" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="1840" y="384" name="A0" orien="R180" />
        <iomarker fontsize="28" x="1840" y="448" name="B0" orien="R180" />
        <iomarker fontsize="28" x="1840" y="720" name="A1" orien="R180" />
        <iomarker fontsize="28" x="1840" y="784" name="B1" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1056" name="A2" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1120" name="B2" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1392" name="A3" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1456" name="B3" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1728" name="A4" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1792" name="B4" orien="R180" />
        <iomarker fontsize="28" x="1840" y="2064" name="A5" orien="R180" />
        <iomarker fontsize="28" x="1840" y="2128" name="B5" orien="R180" />
        <iomarker fontsize="28" x="1840" y="2400" name="A6" orien="R180" />
        <iomarker fontsize="28" x="1840" y="2464" name="B6" orien="R180" />
        <iomarker fontsize="28" x="1840" y="2736" name="A7" orien="R180" />
        <iomarker fontsize="28" x="1840" y="2800" name="B7" orien="R180" />
        <iomarker fontsize="28" x="3280" y="320" name="SUM0" orien="R0" />
        <iomarker fontsize="28" x="3280" y="656" name="SUM1" orien="R0" />
        <iomarker fontsize="28" x="3280" y="992" name="SUM2" orien="R0" />
        <iomarker fontsize="28" x="3280" y="1328" name="SUM3" orien="R0" />
        <iomarker fontsize="28" x="3280" y="1664" name="SUM4" orien="R0" />
        <iomarker fontsize="28" x="3280" y="2000" name="SUM5" orien="R0" />
        <iomarker fontsize="28" x="3280" y="2336" name="SUM6" orien="R0" />
        <iomarker fontsize="28" x="3280" y="2672" name="SUM7" orien="R0" />
        <iomarker fontsize="28" x="3280" y="2800" name="C_OUT" orien="R0" />
        <branch name="XLXN_33">
            <wire x2="2320" y1="320" y2="320" x1="2304" />
            <wire x2="2336" y1="320" y2="320" x1="2320" />
        </branch>
        <instance x="2176" y="256" name="XLXI_76" orien="R90" />
    </sheet>
</drawing>