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
        <signal name="S1" />
        <signal name="XLXN_4" />
        <signal name="S0" />
        <signal name="OUT0" />
        <signal name="OUT1" />
        <signal name="OUT2" />
        <signal name="OUT3" />
        <signal name="A0" />
        <signal name="B0" />
        <signal name="C0" />
        <signal name="D0" />
        <signal name="A1" />
        <signal name="B1" />
        <signal name="C1" />
        <signal name="D1" />
        <signal name="A2" />
        <signal name="B2" />
        <signal name="C2" />
        <signal name="D2" />
        <signal name="A3" />
        <signal name="B3" />
        <signal name="D3" />
        <signal name="C3" />
        <port polarity="Input" name="S1" />
        <port polarity="Input" name="S0" />
        <port polarity="Output" name="OUT0" />
        <port polarity="Output" name="OUT1" />
        <port polarity="Output" name="OUT2" />
        <port polarity="Output" name="OUT3" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="C0" />
        <port polarity="Input" name="D0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="C1" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="C2" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="B3" />
        <port polarity="Input" name="D3" />
        <port polarity="Input" name="C3" />
        <blockdef name="m4_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-320" y2="-320" x1="320" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="176" />
            <line x2="176" y1="-208" y2="-96" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="224" />
            <line x2="224" y1="-216" y2="-32" x1="224" />
            <line x2="96" y1="-224" y2="-192" x1="256" />
            <line x2="256" y1="-416" y2="-224" x1="256" />
            <line x2="256" y1="-448" y2="-416" x1="96" />
            <line x2="96" y1="-192" y2="-448" x1="96" />
            <line x2="96" y1="-160" y2="-160" x1="128" />
            <line x2="128" y1="-200" y2="-160" x1="128" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="m4_1e" name="XLXI_1">
            <blockpin signalname="A3" name="D0" />
            <blockpin signalname="B3" name="D1" />
            <blockpin signalname="C3" name="D2" />
            <blockpin signalname="D3" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S0" name="S0" />
            <blockpin signalname="S1" name="S1" />
            <blockpin signalname="OUT3" name="O" />
        </block>
        <block symbolname="m4_1e" name="XLXI_2">
            <blockpin signalname="A2" name="D0" />
            <blockpin signalname="B2" name="D1" />
            <blockpin signalname="C2" name="D2" />
            <blockpin signalname="D2" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S0" name="S0" />
            <blockpin signalname="S1" name="S1" />
            <blockpin signalname="OUT2" name="O" />
        </block>
        <block symbolname="m4_1e" name="XLXI_3">
            <blockpin signalname="A1" name="D0" />
            <blockpin signalname="B1" name="D1" />
            <blockpin signalname="C1" name="D2" />
            <blockpin signalname="D1" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S0" name="S0" />
            <blockpin signalname="S1" name="S1" />
            <blockpin signalname="OUT1" name="O" />
        </block>
        <block symbolname="m4_1e" name="XLXI_4">
            <blockpin signalname="A0" name="D0" />
            <blockpin signalname="B0" name="D1" />
            <blockpin signalname="C0" name="D2" />
            <blockpin signalname="D0" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S0" name="S0" />
            <blockpin signalname="S1" name="S1" />
            <blockpin signalname="OUT0" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_23">
            <blockpin signalname="XLXN_1" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1696" y="2272" name="XLXI_1" orien="R0" />
        <instance x="1696" y="1744" name="XLXI_2" orien="R0" />
        <instance x="1696" y="1200" name="XLXI_3" orien="R0" />
        <instance x="1696" y="656" name="XLXI_4" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1696" y1="624" y2="624" x1="1584" />
            <wire x2="1584" y1="624" y2="1168" x1="1584" />
            <wire x2="1696" y1="1168" y2="1168" x1="1584" />
            <wire x2="1584" y1="1168" y2="1712" x1="1584" />
            <wire x2="1696" y1="1712" y2="1712" x1="1584" />
            <wire x2="1584" y1="1712" y2="2240" x1="1584" />
            <wire x2="1696" y1="2240" y2="2240" x1="1584" />
            <wire x2="1584" y1="2240" y2="2464" x1="1584" />
        </branch>
        <branch name="S1">
            <wire x2="1472" y1="2416" y2="2416" x1="1104" />
            <wire x2="1472" y1="560" y2="1104" x1="1472" />
            <wire x2="1472" y1="1104" y2="1648" x1="1472" />
            <wire x2="1472" y1="1648" y2="2176" x1="1472" />
            <wire x2="1696" y1="2176" y2="2176" x1="1472" />
            <wire x2="1472" y1="2176" y2="2416" x1="1472" />
            <wire x2="1696" y1="1648" y2="1648" x1="1472" />
            <wire x2="1696" y1="1104" y2="1104" x1="1472" />
            <wire x2="1696" y1="560" y2="560" x1="1472" />
        </branch>
        <branch name="S0">
            <wire x2="1408" y1="2336" y2="2336" x1="1104" />
            <wire x2="1408" y1="496" y2="1040" x1="1408" />
            <wire x2="1696" y1="1040" y2="1040" x1="1408" />
            <wire x2="1408" y1="1040" y2="1584" x1="1408" />
            <wire x2="1408" y1="1584" y2="2112" x1="1408" />
            <wire x2="1696" y1="2112" y2="2112" x1="1408" />
            <wire x2="1408" y1="2112" y2="2336" x1="1408" />
            <wire x2="1696" y1="1584" y2="1584" x1="1408" />
            <wire x2="1696" y1="496" y2="496" x1="1408" />
        </branch>
        <branch name="OUT0">
            <wire x2="2512" y1="336" y2="336" x1="2016" />
        </branch>
        <branch name="OUT1">
            <wire x2="2512" y1="880" y2="880" x1="2016" />
        </branch>
        <branch name="OUT2">
            <wire x2="2032" y1="1424" y2="1424" x1="2016" />
            <wire x2="2512" y1="1424" y2="1424" x1="2032" />
        </branch>
        <branch name="OUT3">
            <wire x2="2032" y1="1952" y2="1952" x1="2016" />
            <wire x2="2512" y1="1952" y2="1952" x1="2032" />
        </branch>
        <branch name="A0">
            <wire x2="1680" y1="240" y2="240" x1="1120" />
            <wire x2="1696" y1="240" y2="240" x1="1680" />
        </branch>
        <branch name="B0">
            <wire x2="1680" y1="304" y2="304" x1="1120" />
            <wire x2="1696" y1="304" y2="304" x1="1680" />
        </branch>
        <branch name="C0">
            <wire x2="1680" y1="368" y2="368" x1="1120" />
            <wire x2="1696" y1="368" y2="368" x1="1680" />
        </branch>
        <branch name="D0">
            <wire x2="1680" y1="432" y2="432" x1="1120" />
            <wire x2="1696" y1="432" y2="432" x1="1680" />
        </branch>
        <branch name="A1">
            <wire x2="1696" y1="784" y2="784" x1="1120" />
        </branch>
        <branch name="B1">
            <wire x2="1696" y1="848" y2="848" x1="1120" />
        </branch>
        <branch name="C1">
            <wire x2="1696" y1="912" y2="912" x1="1120" />
        </branch>
        <branch name="D1">
            <wire x2="1696" y1="976" y2="976" x1="1120" />
        </branch>
        <branch name="A2">
            <wire x2="1680" y1="1328" y2="1328" x1="1120" />
            <wire x2="1696" y1="1328" y2="1328" x1="1680" />
        </branch>
        <branch name="B2">
            <wire x2="1680" y1="1392" y2="1392" x1="1120" />
            <wire x2="1696" y1="1392" y2="1392" x1="1680" />
        </branch>
        <branch name="C2">
            <wire x2="1680" y1="1456" y2="1456" x1="1120" />
            <wire x2="1696" y1="1456" y2="1456" x1="1680" />
        </branch>
        <branch name="D2">
            <wire x2="1680" y1="1520" y2="1520" x1="1120" />
            <wire x2="1696" y1="1520" y2="1520" x1="1680" />
        </branch>
        <branch name="A3">
            <wire x2="1680" y1="1856" y2="1856" x1="1120" />
            <wire x2="1696" y1="1856" y2="1856" x1="1680" />
        </branch>
        <branch name="B3">
            <wire x2="1680" y1="1920" y2="1920" x1="1120" />
            <wire x2="1696" y1="1920" y2="1920" x1="1680" />
        </branch>
        <branch name="D3">
            <wire x2="1680" y1="2048" y2="2048" x1="1120" />
            <wire x2="1696" y1="2048" y2="2048" x1="1680" />
        </branch>
        <branch name="C3">
            <wire x2="1680" y1="1984" y2="1984" x1="1120" />
            <wire x2="1696" y1="1984" y2="1984" x1="1680" />
        </branch>
        <instance x="1648" y="2464" name="XLXI_23" orien="R180" />
        <iomarker fontsize="28" x="2512" y="336" name="OUT0" orien="R0" />
        <iomarker fontsize="28" x="2512" y="880" name="OUT1" orien="R0" />
        <iomarker fontsize="28" x="2512" y="1424" name="OUT2" orien="R0" />
        <iomarker fontsize="28" x="2512" y="1952" name="OUT3" orien="R0" />
        <iomarker fontsize="28" x="1120" y="784" name="A1" orien="R180" />
        <iomarker fontsize="28" x="1120" y="848" name="B1" orien="R180" />
        <iomarker fontsize="28" x="1120" y="912" name="C1" orien="R180" />
        <iomarker fontsize="28" x="1120" y="976" name="D1" orien="R180" />
        <iomarker fontsize="28" x="1120" y="240" name="A0" orien="R180" />
        <iomarker fontsize="28" x="1120" y="304" name="B0" orien="R180" />
        <iomarker fontsize="28" x="1120" y="368" name="C0" orien="R180" />
        <iomarker fontsize="28" x="1120" y="432" name="D0" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1328" name="A2" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1392" name="B2" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1456" name="C2" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1520" name="D2" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1856" name="A3" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1920" name="B3" orien="R180" />
        <iomarker fontsize="28" x="1120" y="2048" name="D3" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1984" name="C3" orien="R180" />
        <iomarker fontsize="28" x="1104" y="2416" name="S1" orien="R180" />
        <iomarker fontsize="28" x="1104" y="2336" name="S0" orien="R180" />
    </sheet>
</drawing>