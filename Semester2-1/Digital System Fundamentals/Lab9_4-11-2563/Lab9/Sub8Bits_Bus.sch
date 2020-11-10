<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A(7:0)" />
        <signal name="XLXN_3(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="C(0)" />
        <signal name="B(7:0)" />
        <signal name="O(7:0)" />
        <signal name="C(7:1)" />
        <signal name="XLXN_8(7:0)" />
        <signal name="XLXN_9(7:0)" />
        <signal name="C(7:0)" />
        <port polarity="Input" name="A(7:0)" />
        <port polarity="Input" name="B(7:0)" />
        <port polarity="Output" name="O(7:0)" />
        <blockdef name="Adder8Bits_Bus">
            <timestamp>2020-11-4T17:0:24</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="inv8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <circle r="16" cx="144" cy="-32" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="160" y="-44" height="24" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <block symbolname="Adder8Bits_Bus" name="XLXI_3">
            <blockpin signalname="XLXN_5(7:0)" name="A(7:0)" />
            <blockpin signalname="C(7:0)" name="B(7:0)" />
            <blockpin signalname="O(7:0)" name="SUM(7:0)" />
            <blockpin name="C_OUT" />
        </block>
        <block symbolname="Adder8Bits_Bus" name="XLXI_2">
            <blockpin signalname="A(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_9(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="SUM(7:0)" />
            <blockpin name="C_OUT" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="C(0)" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_7(6:0)">
            <blockpin signalname="C(7:1)" name="G" />
        </block>
        <block symbolname="inv8" name="XLXI_9">
            <blockpin signalname="B(7:0)" name="I(7:0)" />
            <blockpin signalname="XLXN_9(7:0)" name="O(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="A(7:0)">
            <wire x2="1296" y1="960" y2="960" x1="736" />
        </branch>
        <instance x="1952" y="1248" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_5(7:0)">
            <wire x2="1872" y1="960" y2="960" x1="1680" />
            <wire x2="1872" y1="960" y2="1152" x1="1872" />
            <wire x2="1952" y1="1152" y2="1152" x1="1872" />
        </branch>
        <branch name="C(7:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1872" y="1344" type="branch" />
            <wire x2="1952" y1="1216" y2="1216" x1="1872" />
            <wire x2="1872" y1="1216" y2="1296" x1="1872" />
            <wire x2="1872" y1="1296" y2="1344" x1="1872" />
            <wire x2="1872" y1="1344" y2="1440" x1="1872" />
        </branch>
        <instance x="1296" y="1056" name="XLXI_2" orien="R0">
        </instance>
        <bustap x2="1776" y1="1296" y2="1296" x1="1872" />
        <branch name="C(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1296" type="branch" />
            <wire x2="1648" y1="1296" y2="1296" x1="1552" />
            <wire x2="1776" y1="1296" y2="1296" x1="1648" />
        </branch>
        <instance x="1552" y="1360" name="XLXI_5" orien="R270" />
        <bustap x2="1776" y1="1440" y2="1440" x1="1872" />
        <branch name="O(7:0)">
            <wire x2="2528" y1="1152" y2="1152" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="736" y="960" name="A(7:0)" orien="R180" />
        <iomarker fontsize="28" x="736" y="1024" name="B(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2528" y="1152" name="O(7:0)" orien="R0" />
        <instance x="1424" y="1376" name="XLXI_7(6:0)" orien="R90" />
        <branch name="C(7:1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1440" type="branch" />
            <wire x2="1648" y1="1440" y2="1440" x1="1552" />
            <wire x2="1776" y1="1440" y2="1440" x1="1648" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="896" y1="1024" y2="1024" x1="736" />
        </branch>
        <instance x="896" y="1056" name="XLXI_9" orien="R0" />
        <branch name="XLXN_9(7:0)">
            <wire x2="1296" y1="1024" y2="1024" x1="1120" />
        </branch>
    </sheet>
</drawing>