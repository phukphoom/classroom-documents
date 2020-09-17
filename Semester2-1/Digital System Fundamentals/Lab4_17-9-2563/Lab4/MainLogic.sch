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
        <signal name="BUZZER_P83" />
        <signal name="S_SW5_P57" />
        <signal name="D_SW6_P56" />
        <signal name="E_SW7_P55" />
        <signal name="B_SW4_P58" />
        <signal name="H_SW3_P59" />
        <port polarity="Output" name="BUZZER_P83" />
        <port polarity="Input" name="S_SW5_P57" />
        <port polarity="Input" name="D_SW6_P56" />
        <port polarity="Input" name="E_SW7_P55" />
        <port polarity="Input" name="B_SW4_P58" />
        <port polarity="Input" name="H_SW3_P59" />
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="and3b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <block symbolname="and2b1" name="XLXI_1">
            <blockpin signalname="D_SW6_P56" name="I0" />
            <blockpin signalname="E_SW7_P55" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_2">
            <blockpin signalname="B_SW4_P58" name="I0" />
            <blockpin signalname="E_SW7_P55" name="I1" />
            <blockpin signalname="S_SW5_P57" name="I2" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_3">
            <blockpin signalname="E_SW7_P55" name="I0" />
            <blockpin signalname="H_SW3_P59" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_4">
            <blockpin signalname="S_SW5_P57" name="I0" />
            <blockpin signalname="D_SW6_P56" name="I1" />
            <blockpin signalname="B_SW4_P58" name="I2" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_5">
            <blockpin signalname="XLXN_4" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="XLXN_2" name="I2" />
            <blockpin signalname="XLXN_1" name="I3" />
            <blockpin signalname="BUZZER_P83" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1328" y="704" name="XLXI_1" orien="R0" />
        <instance x="1328" y="992" name="XLXI_2" orien="R0" />
        <instance x="1328" y="1216" name="XLXI_3" orien="R0" />
        <instance x="1328" y="1504" name="XLXI_4" orien="R0" />
        <instance x="2128" y="1136" name="XLXI_5" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="2128" y1="608" y2="608" x1="1584" />
            <wire x2="2128" y1="608" y2="880" x1="2128" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1856" y1="864" y2="864" x1="1584" />
            <wire x2="1856" y1="864" y2="944" x1="1856" />
            <wire x2="2128" y1="944" y2="944" x1="1856" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1856" y1="1120" y2="1120" x1="1584" />
            <wire x2="1856" y1="1008" y2="1120" x1="1856" />
            <wire x2="2128" y1="1008" y2="1008" x1="1856" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2128" y1="1376" y2="1376" x1="1584" />
            <wire x2="2128" y1="1072" y2="1376" x1="2128" />
        </branch>
        <branch name="BUZZER_P83">
            <wire x2="2448" y1="976" y2="976" x1="2384" />
        </branch>
        <iomarker fontsize="28" x="752" y="576" name="E_SW7_P55" orien="R180" />
        <iomarker fontsize="28" x="752" y="640" name="D_SW6_P56" orien="R180" />
        <iomarker fontsize="28" x="752" y="928" name="B_SW4_P58" orien="R180" />
        <iomarker fontsize="28" x="752" y="1088" name="H_SW3_P59" orien="R180" />
        <branch name="H_SW3_P59">
            <wire x2="1328" y1="1088" y2="1088" x1="752" />
        </branch>
        <branch name="B_SW4_P58">
            <wire x2="1200" y1="928" y2="928" x1="752" />
            <wire x2="1328" y1="928" y2="928" x1="1200" />
            <wire x2="1200" y1="928" y2="1312" x1="1200" />
            <wire x2="1328" y1="1312" y2="1312" x1="1200" />
        </branch>
        <branch name="S_SW5_P57">
            <wire x2="1152" y1="800" y2="800" x1="752" />
            <wire x2="1152" y1="800" y2="1440" x1="1152" />
            <wire x2="1328" y1="1440" y2="1440" x1="1152" />
            <wire x2="1328" y1="800" y2="800" x1="1152" />
        </branch>
        <branch name="D_SW6_P56">
            <wire x2="1248" y1="640" y2="640" x1="752" />
            <wire x2="1248" y1="640" y2="1376" x1="1248" />
            <wire x2="1328" y1="1376" y2="1376" x1="1248" />
            <wire x2="1328" y1="640" y2="640" x1="1248" />
        </branch>
        <branch name="E_SW7_P55">
            <wire x2="1024" y1="576" y2="576" x1="752" />
            <wire x2="1024" y1="576" y2="864" x1="1024" />
            <wire x2="1328" y1="864" y2="864" x1="1024" />
            <wire x2="1088" y1="576" y2="576" x1="1024" />
            <wire x2="1088" y1="576" y2="1152" x1="1088" />
            <wire x2="1328" y1="1152" y2="1152" x1="1088" />
            <wire x2="1328" y1="576" y2="576" x1="1088" />
        </branch>
        <iomarker fontsize="28" x="2448" y="976" name="BUZZER_P83" orien="R0" />
        <iomarker fontsize="28" x="752" y="800" name="S_SW5_P57" orien="R180" />
    </sheet>
</drawing>