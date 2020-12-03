<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(1:0)" />
        <signal name="A(7:0)" />
        <signal name="A(3:0)" />
        <signal name="A(7:4)" />
        <signal name="B(7:0)" />
        <signal name="B(3:0)" />
        <signal name="B(7:4)" />
        <signal name="C(7:0)" />
        <signal name="C(3:0)" />
        <signal name="C(7:4)" />
        <signal name="D(3:0)" />
        <signal name="D(7:0)" />
        <signal name="D(7:4)" />
        <signal name="O(7:0)" />
        <signal name="O(3:0)" />
        <signal name="O(7:4)" />
        <port polarity="Input" name="S(1:0)" />
        <port polarity="Input" name="A(7:0)" />
        <port polarity="Input" name="B(7:0)" />
        <port polarity="Input" name="C(7:0)" />
        <port polarity="Input" name="D(7:0)" />
        <port polarity="Output" name="O(7:0)" />
        <blockdef name="Mux4To1_4_Bus">
            <timestamp>2020-11-4T19:24:55</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
        </blockdef>
        <block symbolname="Mux4To1_4_Bus" name="XLXI_2">
            <blockpin signalname="O(7:4)" name="O(3:0)" />
            <blockpin signalname="A(7:4)" name="A(3:0)" />
            <blockpin signalname="B(7:4)" name="B(3:0)" />
            <blockpin signalname="C(7:4)" name="C(3:0)" />
            <blockpin signalname="D(7:4)" name="D(3:0)" />
            <blockpin signalname="S(1:0)" name="S(1:0)" />
        </block>
        <block symbolname="Mux4To1_4_Bus" name="XLXI_1">
            <blockpin signalname="O(3:0)" name="O(3:0)" />
            <blockpin signalname="A(3:0)" name="A(3:0)" />
            <blockpin signalname="B(3:0)" name="B(3:0)" />
            <blockpin signalname="C(3:0)" name="C(3:0)" />
            <blockpin signalname="D(3:0)" name="D(3:0)" />
            <blockpin signalname="S(1:0)" name="S(1:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1328" y="848" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1328" y="1280" name="XLXI_2" orien="R0">
        </instance>
        <branch name="S(1:0)">
            <wire x2="1216" y1="1248" y2="1248" x1="288" />
            <wire x2="1328" y1="1248" y2="1248" x1="1216" />
            <wire x2="1328" y1="816" y2="816" x1="1216" />
            <wire x2="1216" y1="816" y2="1248" x1="1216" />
        </branch>
        <branch name="A(7:0)">
            <wire x2="336" y1="544" y2="544" x1="288" />
            <wire x2="336" y1="544" y2="560" x1="336" />
            <wire x2="336" y1="560" y2="992" x1="336" />
        </branch>
        <bustap x2="432" y1="560" y2="560" x1="336" />
        <bustap x2="432" y1="992" y2="992" x1="336" />
        <branch name="A(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="560" type="branch" />
            <wire x2="800" y1="560" y2="560" x1="432" />
            <wire x2="1328" y1="560" y2="560" x1="800" />
        </branch>
        <branch name="A(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="992" type="branch" />
            <wire x2="800" y1="992" y2="992" x1="432" />
            <wire x2="1328" y1="992" y2="992" x1="800" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="400" y1="608" y2="608" x1="288" />
            <wire x2="400" y1="608" y2="624" x1="400" />
            <wire x2="400" y1="624" y2="1056" x1="400" />
        </branch>
        <bustap x2="496" y1="624" y2="624" x1="400" />
        <branch name="B(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="624" type="branch" />
            <wire x2="768" y1="624" y2="624" x1="496" />
            <wire x2="784" y1="624" y2="624" x1="768" />
            <wire x2="800" y1="624" y2="624" x1="784" />
            <wire x2="1328" y1="624" y2="624" x1="800" />
        </branch>
        <bustap x2="496" y1="1056" y2="1056" x1="400" />
        <branch name="B(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="1056" type="branch" />
            <wire x2="800" y1="1056" y2="1056" x1="496" />
            <wire x2="1328" y1="1056" y2="1056" x1="800" />
        </branch>
        <iomarker fontsize="28" x="288" y="608" name="B(7:0)" orien="R180" />
        <iomarker fontsize="28" x="288" y="544" name="A(7:0)" orien="R180" />
        <branch name="C(7:0)">
            <wire x2="496" y1="672" y2="672" x1="288" />
            <wire x2="496" y1="672" y2="688" x1="496" />
            <wire x2="496" y1="688" y2="1120" x1="496" />
        </branch>
        <bustap x2="592" y1="688" y2="688" x1="496" />
        <branch name="C(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="688" type="branch" />
            <wire x2="800" y1="688" y2="688" x1="592" />
            <wire x2="1328" y1="688" y2="688" x1="800" />
        </branch>
        <bustap x2="592" y1="1120" y2="1120" x1="496" />
        <branch name="C(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="1120" type="branch" />
            <wire x2="800" y1="1120" y2="1120" x1="592" />
            <wire x2="1328" y1="1120" y2="1120" x1="800" />
        </branch>
        <iomarker fontsize="28" x="288" y="672" name="C(7:0)" orien="R180" />
        <branch name="D(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="752" type="branch" />
            <wire x2="800" y1="752" y2="752" x1="688" />
            <wire x2="1200" y1="752" y2="752" x1="800" />
            <wire x2="1328" y1="752" y2="752" x1="1200" />
        </branch>
        <bustap x2="688" y1="752" y2="752" x1="592" />
        <branch name="D(7:0)">
            <wire x2="592" y1="736" y2="736" x1="288" />
            <wire x2="592" y1="736" y2="752" x1="592" />
            <wire x2="592" y1="752" y2="1184" x1="592" />
        </branch>
        <bustap x2="688" y1="1184" y2="1184" x1="592" />
        <branch name="D(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="1184" type="branch" />
            <wire x2="800" y1="1184" y2="1184" x1="688" />
            <wire x2="1328" y1="1184" y2="1184" x1="800" />
        </branch>
        <iomarker fontsize="28" x="288" y="736" name="D(7:0)" orien="R180" />
        <iomarker fontsize="28" x="288" y="1248" name="S(1:0)" orien="R180" />
        <branch name="O(7:0)">
            <wire x2="2096" y1="544" y2="560" x1="2096" />
            <wire x2="2096" y1="560" y2="992" x1="2096" />
            <wire x2="2224" y1="544" y2="544" x1="2096" />
        </branch>
        <branch name="O(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="560" type="branch" />
            <wire x2="1840" y1="560" y2="560" x1="1712" />
            <wire x2="1968" y1="560" y2="560" x1="1840" />
            <wire x2="2000" y1="560" y2="560" x1="1968" />
        </branch>
        <bustap x2="2000" y1="560" y2="560" x1="2096" />
        <bustap x2="2000" y1="992" y2="992" x1="2096" />
        <branch name="O(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="992" type="branch" />
            <wire x2="1840" y1="992" y2="992" x1="1712" />
            <wire x2="2000" y1="992" y2="992" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="2224" y="544" name="O(7:0)" orien="R0" />
    </sheet>
</drawing>