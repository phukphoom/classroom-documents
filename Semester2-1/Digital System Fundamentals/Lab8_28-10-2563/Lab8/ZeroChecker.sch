<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BIT7" />
        <signal name="BIT6" />
        <signal name="BIT5" />
        <signal name="BIT4" />
        <signal name="BIT3" />
        <signal name="BIT2" />
        <signal name="BIT1" />
        <signal name="BIT0" />
        <signal name="BIT8" />
        <signal name="XLXN_15" />
        <signal name="IS_ZERO" />
        <port polarity="Input" name="BIT7" />
        <port polarity="Input" name="BIT6" />
        <port polarity="Input" name="BIT5" />
        <port polarity="Input" name="BIT4" />
        <port polarity="Input" name="BIT3" />
        <port polarity="Input" name="BIT2" />
        <port polarity="Input" name="BIT1" />
        <port polarity="Input" name="BIT0" />
        <port polarity="Input" name="BIT8" />
        <port polarity="Output" name="IS_ZERO" />
        <blockdef name="or9">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="72" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-384" y2="-384" x1="0" />
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="48" y1="-64" y2="-272" x1="48" />
            <line x2="48" y1="-576" y2="-368" x1="48" />
            <arc ex="112" ey="-368" sx="192" sy="-320" r="88" cx="116" cy="-280" />
            <line x2="48" y1="-272" y2="-272" x1="112" />
            <arc ex="192" ey="-320" sx="112" sy="-272" r="88" cx="116" cy="-360" />
            <line x2="48" y1="-368" y2="-368" x1="112" />
            <line x2="192" y1="-320" y2="-320" x1="256" />
            <arc ex="48" ey="-368" sx="48" sy="-272" r="56" cx="16" cy="-320" />
            <line x2="48" y1="-576" y2="-576" x1="0" />
            <line x2="48" y1="-512" y2="-512" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-448" y2="-448" x1="0" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="or9" name="XLXI_4">
            <blockpin signalname="BIT8" name="I0" />
            <blockpin signalname="BIT7" name="I1" />
            <blockpin signalname="BIT6" name="I2" />
            <blockpin signalname="BIT5" name="I3" />
            <blockpin signalname="BIT4" name="I4" />
            <blockpin signalname="BIT3" name="I5" />
            <blockpin signalname="BIT2" name="I6" />
            <blockpin signalname="BIT1" name="I7" />
            <blockpin signalname="BIT0" name="I8" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_8">
            <blockpin signalname="XLXN_15" name="I" />
            <blockpin signalname="IS_ZERO" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <branch name="BIT7">
            <wire x2="688" y1="816" y2="816" x1="672" />
            <wire x2="704" y1="816" y2="816" x1="688" />
        </branch>
        <branch name="BIT6">
            <wire x2="688" y1="752" y2="752" x1="672" />
            <wire x2="704" y1="752" y2="752" x1="688" />
        </branch>
        <branch name="BIT5">
            <wire x2="688" y1="688" y2="688" x1="672" />
            <wire x2="704" y1="688" y2="688" x1="688" />
        </branch>
        <branch name="BIT4">
            <wire x2="688" y1="624" y2="624" x1="672" />
            <wire x2="704" y1="624" y2="624" x1="688" />
        </branch>
        <branch name="BIT3">
            <wire x2="688" y1="560" y2="560" x1="672" />
            <wire x2="704" y1="560" y2="560" x1="688" />
        </branch>
        <branch name="BIT2">
            <wire x2="688" y1="496" y2="496" x1="672" />
            <wire x2="704" y1="496" y2="496" x1="688" />
        </branch>
        <branch name="BIT1">
            <wire x2="688" y1="432" y2="432" x1="672" />
            <wire x2="704" y1="432" y2="432" x1="688" />
        </branch>
        <branch name="BIT0">
            <wire x2="688" y1="368" y2="368" x1="672" />
            <wire x2="704" y1="368" y2="368" x1="688" />
        </branch>
        <branch name="BIT8">
            <wire x2="688" y1="880" y2="880" x1="672" />
            <wire x2="704" y1="880" y2="880" x1="688" />
        </branch>
        <instance x="704" y="944" name="XLXI_4" orien="R0" />
        <branch name="XLXN_15">
            <wire x2="976" y1="624" y2="624" x1="960" />
            <wire x2="992" y1="624" y2="624" x1="976" />
        </branch>
        <instance x="992" y="656" name="XLXI_8" orien="R0" />
        <branch name="IS_ZERO">
            <wire x2="1248" y1="624" y2="624" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="672" y="880" name="BIT8" orien="R180" />
        <iomarker fontsize="28" x="672" y="816" name="BIT7" orien="R180" />
        <iomarker fontsize="28" x="672" y="752" name="BIT6" orien="R180" />
        <iomarker fontsize="28" x="672" y="688" name="BIT5" orien="R180" />
        <iomarker fontsize="28" x="672" y="624" name="BIT4" orien="R180" />
        <iomarker fontsize="28" x="672" y="560" name="BIT3" orien="R180" />
        <iomarker fontsize="28" x="672" y="496" name="BIT2" orien="R180" />
        <iomarker fontsize="28" x="672" y="432" name="BIT1" orien="R180" />
        <iomarker fontsize="28" x="672" y="368" name="BIT0" orien="R180" />
        <iomarker fontsize="28" x="1248" y="624" name="IS_ZERO" orien="R0" />
    </sheet>
</drawing>