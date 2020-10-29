<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_11" />
        <signal name="XLXN_7" />
        <signal name="SUM" />
        <signal name="C_OUT" />
        <signal name="C_IN" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="A_BIT" />
        <signal name="B_BIT" />
        <port polarity="Output" name="SUM" />
        <port polarity="Output" name="C_OUT" />
        <port polarity="Input" name="C_IN" />
        <port polarity="Input" name="A_BIT" />
        <port polarity="Input" name="B_BIT" />
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_21">
            <blockpin signalname="C_IN" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="SUM" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_22">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="C_IN" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_23">
            <blockpin signalname="A_BIT" name="I0" />
            <blockpin signalname="B_BIT" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_24">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="C_OUT" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_20">
            <blockpin signalname="B_BIT" name="I0" />
            <blockpin signalname="A_BIT" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="1216" y="816" name="XLXI_21" orien="R0" />
        <instance x="1616" y="976" name="XLXI_22" orien="R0" />
        <instance x="1616" y="1136" name="XLXI_23" orien="R0" />
        <instance x="1984" y="1056" name="XLXI_24" orien="R0" />
        <instance x="688" y="704" name="XLXI_20" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="1072" y1="608" y2="608" x1="944" />
            <wire x2="1072" y1="608" y2="688" x1="1072" />
            <wire x2="1216" y1="688" y2="688" x1="1072" />
            <wire x2="1072" y1="688" y2="912" x1="1072" />
            <wire x2="1616" y1="912" y2="912" x1="1072" />
        </branch>
        <branch name="SUM">
            <wire x2="2384" y1="720" y2="720" x1="1472" />
        </branch>
        <branch name="C_OUT">
            <wire x2="2384" y1="960" y2="960" x1="2240" />
        </branch>
        <branch name="C_IN">
            <wire x2="1152" y1="752" y2="752" x1="464" />
            <wire x2="1152" y1="752" y2="848" x1="1152" />
            <wire x2="1616" y1="848" y2="848" x1="1152" />
            <wire x2="1216" y1="752" y2="752" x1="1152" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1920" y1="880" y2="880" x1="1872" />
            <wire x2="1920" y1="880" y2="928" x1="1920" />
            <wire x2="1984" y1="928" y2="928" x1="1920" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1920" y1="1040" y2="1040" x1="1872" />
            <wire x2="1920" y1="992" y2="1040" x1="1920" />
            <wire x2="1984" y1="992" y2="992" x1="1920" />
        </branch>
        <branch name="A_BIT">
            <wire x2="576" y1="576" y2="576" x1="464" />
            <wire x2="688" y1="576" y2="576" x1="576" />
            <wire x2="576" y1="576" y2="1072" x1="576" />
            <wire x2="1616" y1="1072" y2="1072" x1="576" />
        </branch>
        <branch name="B_BIT">
            <wire x2="656" y1="640" y2="640" x1="464" />
            <wire x2="688" y1="640" y2="640" x1="656" />
            <wire x2="656" y1="640" y2="1008" x1="656" />
            <wire x2="1616" y1="1008" y2="1008" x1="656" />
        </branch>
        <iomarker fontsize="28" x="464" y="752" name="C_IN" orien="R180" />
        <iomarker fontsize="28" x="464" y="576" name="A_BIT" orien="R180" />
        <iomarker fontsize="28" x="464" y="640" name="B_BIT" orien="R180" />
        <iomarker fontsize="28" x="2384" y="720" name="SUM" orien="R0" />
        <iomarker fontsize="28" x="2384" y="960" name="C_OUT" orien="R0" />
    </sheet>
</drawing>