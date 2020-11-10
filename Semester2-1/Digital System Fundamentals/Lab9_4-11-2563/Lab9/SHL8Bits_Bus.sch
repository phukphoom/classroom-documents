<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_49(7:0)" />
        <signal name="O(7:0)" />
        <signal name="O(7:1)" />
        <signal name="O(0)" />
        <signal name="A(7:0)" />
        <signal name="A(6:0)" />
        <port polarity="Output" name="O(7:0)" />
        <port polarity="Input" name="A(7:0)" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_8">
            <blockpin signalname="O(0)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_13(6:0)">
            <blockpin signalname="A(6:0)" name="I" />
            <blockpin signalname="O(7:1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="O(7:0)">
            <wire x2="2064" y1="1168" y2="1248" x1="2064" />
            <wire x2="2064" y1="1248" y2="1328" x1="2064" />
            <wire x2="2096" y1="1168" y2="1168" x1="2064" />
        </branch>
        <bustap x2="1968" y1="1328" y2="1328" x1="2064" />
        <bustap x2="1968" y1="1248" y2="1248" x1="2064" />
        <branch name="O(7:1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="1328" type="branch" />
            <wire x2="1920" y1="1328" y2="1328" x1="1744" />
            <wire x2="1952" y1="1328" y2="1328" x1="1920" />
            <wire x2="1968" y1="1328" y2="1328" x1="1952" />
        </branch>
        <instance x="1968" y="1040" name="XLXI_8" orien="R180" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="1248" type="branch" />
            <wire x2="1904" y1="1168" y2="1248" x1="1904" />
            <wire x2="1952" y1="1248" y2="1248" x1="1904" />
            <wire x2="1968" y1="1248" y2="1248" x1="1952" />
        </branch>
        <branch name="A(7:0)">
            <wire x2="1344" y1="1168" y2="1168" x1="1312" />
            <wire x2="1344" y1="1168" y2="1328" x1="1344" />
        </branch>
        <bustap x2="1440" y1="1328" y2="1328" x1="1344" />
        <branch name="A(6:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1328" type="branch" />
            <wire x2="1456" y1="1328" y2="1328" x1="1440" />
            <wire x2="1520" y1="1328" y2="1328" x1="1456" />
        </branch>
        <instance x="1520" y="1360" name="XLXI_13(6:0)" orien="R0" />
        <iomarker fontsize="28" x="1312" y="1168" name="A(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2096" y="1168" name="O(7:0)" orien="R0" />
    </sheet>
</drawing>