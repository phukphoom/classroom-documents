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
        <signal name="XLXN_35" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_36" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_53" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62" />
        <signal name="SEG_A" />
        <signal name="SEG_B" />
        <signal name="SEG_C" />
        <signal name="SEG_D" />
        <signal name="SEG_E" />
        <signal name="SEG_F" />
        <signal name="SEG_G" />
        <signal name="HEX0" />
        <signal name="HEX1" />
        <signal name="HEX2" />
        <signal name="HEX3" />
        <signal name="XLXN_74" />
        <port polarity="Output" name="SEG_A" />
        <port polarity="Output" name="SEG_B" />
        <port polarity="Output" name="SEG_C" />
        <port polarity="Output" name="SEG_D" />
        <port polarity="Output" name="SEG_E" />
        <port polarity="Output" name="SEG_F" />
        <port polarity="Output" name="SEG_G" />
        <port polarity="Input" name="HEX0" />
        <port polarity="Input" name="HEX1" />
        <port polarity="Input" name="HEX2" />
        <port polarity="Input" name="HEX3" />
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
        <blockdef name="or6">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-384" y2="-384" x1="0" />
            <line x2="192" y1="-224" y2="-224" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <arc ex="112" ey="-272" sx="192" sy="-224" r="88" cx="116" cy="-184" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
            <arc ex="192" ey="-224" sx="112" sy="-176" r="88" cx="116" cy="-264" />
            <arc ex="48" ey="-272" sx="48" sy="-176" r="56" cx="16" cy="-224" />
            <line x2="48" y1="-272" y2="-272" x1="112" />
            <line x2="48" y1="-64" y2="-176" x1="48" />
            <line x2="48" y1="-272" y2="-384" x1="48" />
        </blockdef>
        <blockdef name="or5">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="72" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="48" y1="-320" y2="-320" x1="0" />
            <line x2="192" y1="-192" y2="-192" x1="256" />
            <arc ex="192" ey="-192" sx="112" sy="-144" r="88" cx="116" cy="-232" />
            <line x2="48" y1="-240" y2="-240" x1="112" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <line x2="48" y1="-64" y2="-144" x1="48" />
            <line x2="48" y1="-320" y2="-240" x1="48" />
            <arc ex="112" ey="-240" sx="192" sy="-192" r="88" cx="116" cy="-152" />
            <arc ex="48" ey="-240" sx="48" sy="-144" r="56" cx="16" cy="-192" />
        </blockdef>
        <blockdef name="d4_16e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-1152" height="1088" />
            <line x2="320" y1="-1088" y2="-1088" x1="384" />
            <line x2="320" y1="-1024" y2="-1024" x1="384" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-1088" y2="-1088" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="or4" name="XLXI_1">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="XLXN_36" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="XLXN_56" name="O" />
        </block>
        <block symbolname="or6" name="XLXI_2">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="XLXN_36" name="I2" />
            <blockpin signalname="XLXN_11" name="I3" />
            <blockpin signalname="XLXN_13" name="I4" />
            <blockpin signalname="XLXN_14" name="I5" />
            <blockpin signalname="XLXN_57" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_3">
            <blockpin signalname="XLXN_35" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_14" name="I3" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="or5" name="XLXI_4">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="XLXN_53" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_14" name="I4" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="d4_16e" name="XLXI_5">
            <blockpin signalname="HEX0" name="A0" />
            <blockpin signalname="HEX1" name="A1" />
            <blockpin signalname="HEX2" name="A2" />
            <blockpin signalname="HEX3" name="A3" />
            <blockpin signalname="XLXN_74" name="E" />
            <blockpin signalname="XLXN_1" name="D0" />
            <blockpin signalname="XLXN_2" name="D1" />
            <blockpin signalname="XLXN_9" name="D10" />
            <blockpin signalname="XLXN_36" name="D11" />
            <blockpin signalname="XLXN_11" name="D12" />
            <blockpin signalname="XLXN_12" name="D13" />
            <blockpin signalname="XLXN_13" name="D14" />
            <blockpin signalname="XLXN_14" name="D15" />
            <blockpin signalname="XLXN_35" name="D2" />
            <blockpin signalname="XLXN_4" name="D3" />
            <blockpin signalname="XLXN_5" name="D4" />
            <blockpin signalname="XLXN_6" name="D5" />
            <blockpin signalname="XLXN_7" name="D6" />
            <blockpin signalname="XLXN_53" name="D7" />
            <blockpin name="D8" />
            <blockpin signalname="XLXN_8" name="D9" />
        </block>
        <block symbolname="or6" name="XLXI_6">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_5" name="I2" />
            <blockpin signalname="XLXN_6" name="I3" />
            <blockpin signalname="XLXN_53" name="I4" />
            <blockpin signalname="XLXN_8" name="I5" />
            <blockpin signalname="XLXN_60" name="O" />
        </block>
        <block symbolname="or5" name="XLXI_18">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_35" name="I1" />
            <blockpin signalname="XLXN_4" name="I2" />
            <blockpin signalname="XLXN_53" name="I3" />
            <blockpin signalname="XLXN_12" name="I4" />
            <blockpin signalname="XLXN_61" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_19">
            <blockpin signalname="XLXN_1" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_53" name="I2" />
            <blockpin signalname="XLXN_11" name="I3" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_20">
            <blockpin signalname="XLXN_56" name="I" />
            <blockpin signalname="SEG_A" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_21">
            <blockpin signalname="XLXN_57" name="I" />
            <blockpin signalname="SEG_B" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_22">
            <blockpin signalname="XLXN_58" name="I" />
            <blockpin signalname="SEG_C" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_23">
            <blockpin signalname="XLXN_59" name="I" />
            <blockpin signalname="SEG_D" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_24">
            <blockpin signalname="XLXN_60" name="I" />
            <blockpin signalname="SEG_E" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_25">
            <blockpin signalname="XLXN_61" name="I" />
            <blockpin signalname="SEG_F" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="XLXN_62" name="I" />
            <blockpin signalname="SEG_G" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_27">
            <blockpin signalname="XLXN_74" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="992" y="1728" name="XLXI_1" orien="R90" />
        <instance x="1216" y="1728" name="XLXI_2" orien="R90" />
        <instance x="1568" y="1728" name="XLXI_3" orien="R90" />
        <instance x="1792" y="1728" name="XLXI_4" orien="R90" />
        <branch name="XLXN_1">
            <wire x2="2784" y1="304" y2="304" x1="1024" />
            <wire x2="2784" y1="304" y2="1728" x1="2784" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1056" y1="368" y2="368" x1="1024" />
            <wire x2="1056" y1="368" y2="1728" x1="1056" />
            <wire x2="1856" y1="368" y2="368" x1="1056" />
            <wire x2="1856" y1="368" y2="1728" x1="1856" />
            <wire x2="2144" y1="368" y2="368" x1="1856" />
            <wire x2="2144" y1="368" y2="1728" x1="2144" />
            <wire x2="2496" y1="368" y2="368" x1="2144" />
            <wire x2="2496" y1="368" y2="1728" x1="2496" />
            <wire x2="2848" y1="368" y2="368" x1="2496" />
            <wire x2="2848" y1="368" y2="1728" x1="2848" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="1632" y1="432" y2="432" x1="1024" />
            <wire x2="1632" y1="432" y2="1728" x1="1632" />
            <wire x2="2560" y1="432" y2="432" x1="1632" />
            <wire x2="2560" y1="432" y2="1728" x1="2560" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2208" y1="496" y2="496" x1="1024" />
            <wire x2="2208" y1="496" y2="1728" x1="2208" />
            <wire x2="2624" y1="496" y2="496" x1="2208" />
            <wire x2="2624" y1="496" y2="1728" x1="2624" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1120" y1="560" y2="560" x1="1024" />
            <wire x2="1120" y1="560" y2="1728" x1="1120" />
            <wire x2="1920" y1="560" y2="560" x1="1120" />
            <wire x2="1920" y1="560" y2="1728" x1="1920" />
            <wire x2="2272" y1="560" y2="560" x1="1920" />
            <wire x2="2272" y1="560" y2="1728" x1="2272" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1280" y1="624" y2="624" x1="1024" />
            <wire x2="1280" y1="624" y2="1728" x1="1280" />
            <wire x2="2336" y1="624" y2="624" x1="1280" />
            <wire x2="2336" y1="624" y2="1728" x1="2336" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1344" y1="688" y2="688" x1="1024" />
            <wire x2="1344" y1="688" y2="1728" x1="1344" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="2464" y1="880" y2="880" x1="1024" />
            <wire x2="2464" y1="880" y2="1728" x1="2464" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="2048" y1="944" y2="944" x1="1024" />
            <wire x2="2048" y1="944" y2="1728" x1="2048" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="1184" y1="1008" y2="1008" x1="1024" />
            <wire x2="1184" y1="1008" y2="1728" x1="1184" />
            <wire x2="1408" y1="1008" y2="1008" x1="1184" />
            <wire x2="1408" y1="1008" y2="1728" x1="1408" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1472" y1="1072" y2="1072" x1="1024" />
            <wire x2="1472" y1="1072" y2="1728" x1="1472" />
            <wire x2="1696" y1="1072" y2="1072" x1="1472" />
            <wire x2="1696" y1="1072" y2="1728" x1="1696" />
            <wire x2="2976" y1="1072" y2="1072" x1="1696" />
            <wire x2="2976" y1="1072" y2="1728" x1="2976" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1248" y1="1136" y2="1136" x1="1024" />
            <wire x2="1248" y1="1136" y2="1728" x1="1248" />
            <wire x2="2752" y1="1136" y2="1136" x1="1248" />
            <wire x2="2752" y1="1136" y2="1728" x1="2752" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1536" y1="1200" y2="1200" x1="1024" />
            <wire x2="1536" y1="1200" y2="1728" x1="1536" />
            <wire x2="1760" y1="1200" y2="1200" x1="1536" />
            <wire x2="1760" y1="1200" y2="1728" x1="1760" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1600" y1="1264" y2="1264" x1="1024" />
            <wire x2="1600" y1="1264" y2="1728" x1="1600" />
            <wire x2="1824" y1="1264" y2="1264" x1="1600" />
            <wire x2="1824" y1="1264" y2="1728" x1="1824" />
            <wire x2="2112" y1="1264" y2="1264" x1="1824" />
            <wire x2="2112" y1="1264" y2="1728" x1="2112" />
        </branch>
        <instance x="640" y="1392" name="XLXI_5" orien="R0" />
        <branch name="XLXN_53">
            <wire x2="1984" y1="752" y2="752" x1="1024" />
            <wire x2="1984" y1="752" y2="1728" x1="1984" />
            <wire x2="2400" y1="752" y2="752" x1="1984" />
            <wire x2="2528" y1="752" y2="752" x1="2400" />
            <wire x2="2688" y1="752" y2="752" x1="2528" />
            <wire x2="2688" y1="752" y2="1728" x1="2688" />
            <wire x2="2912" y1="752" y2="752" x1="2688" />
            <wire x2="2912" y1="752" y2="1728" x1="2912" />
            <wire x2="2400" y1="752" y2="1728" x1="2400" />
        </branch>
        <instance x="2080" y="1728" name="XLXI_6" orien="R90" />
        <instance x="2432" y="1728" name="XLXI_18" orien="R90" />
        <instance x="2720" y="1728" name="XLXI_19" orien="R90" />
        <branch name="XLXN_56">
            <wire x2="1152" y1="1984" y2="2016" x1="1152" />
        </branch>
        <instance x="1120" y="2016" name="XLXI_20" orien="R90" />
        <branch name="XLXN_57">
            <wire x2="1440" y1="1984" y2="2016" x1="1440" />
        </branch>
        <instance x="1408" y="2016" name="XLXI_21" orien="R90" />
        <branch name="XLXN_58">
            <wire x2="1728" y1="1984" y2="2016" x1="1728" />
        </branch>
        <instance x="1696" y="2016" name="XLXI_22" orien="R90" />
        <branch name="XLXN_59">
            <wire x2="1984" y1="1984" y2="2016" x1="1984" />
        </branch>
        <instance x="1952" y="2016" name="XLXI_23" orien="R90" />
        <branch name="XLXN_60">
            <wire x2="2304" y1="1984" y2="2016" x1="2304" />
        </branch>
        <instance x="2272" y="2016" name="XLXI_24" orien="R90" />
        <branch name="XLXN_61">
            <wire x2="2624" y1="1984" y2="2016" x1="2624" />
        </branch>
        <instance x="2592" y="2016" name="XLXI_25" orien="R90" />
        <branch name="XLXN_62">
            <wire x2="2880" y1="1984" y2="2016" x1="2880" />
        </branch>
        <instance x="2848" y="2016" name="XLXI_26" orien="R90" />
        <branch name="SEG_A">
            <wire x2="1152" y1="2240" y2="2272" x1="1152" />
        </branch>
        <branch name="SEG_B">
            <wire x2="1440" y1="2240" y2="2272" x1="1440" />
        </branch>
        <branch name="SEG_C">
            <wire x2="1728" y1="2240" y2="2272" x1="1728" />
        </branch>
        <branch name="SEG_D">
            <wire x2="1984" y1="2240" y2="2272" x1="1984" />
        </branch>
        <branch name="SEG_E">
            <wire x2="2304" y1="2240" y2="2272" x1="2304" />
        </branch>
        <branch name="SEG_F">
            <wire x2="2624" y1="2240" y2="2272" x1="2624" />
        </branch>
        <branch name="SEG_G">
            <wire x2="2880" y1="2240" y2="2272" x1="2880" />
        </branch>
        <branch name="HEX0">
            <wire x2="640" y1="304" y2="304" x1="608" />
        </branch>
        <branch name="HEX1">
            <wire x2="640" y1="368" y2="368" x1="608" />
        </branch>
        <branch name="HEX2">
            <wire x2="640" y1="432" y2="432" x1="608" />
        </branch>
        <branch name="HEX3">
            <wire x2="640" y1="496" y2="496" x1="608" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="640" y1="1264" y2="1264" x1="608" />
        </branch>
        <instance x="608" y="1328" name="XLXI_27" orien="R270" />
        <iomarker fontsize="28" x="1152" y="2272" name="SEG_A" orien="R90" />
        <iomarker fontsize="28" x="1440" y="2272" name="SEG_B" orien="R90" />
        <iomarker fontsize="28" x="1728" y="2272" name="SEG_C" orien="R90" />
        <iomarker fontsize="28" x="1984" y="2272" name="SEG_D" orien="R90" />
        <iomarker fontsize="28" x="2304" y="2272" name="SEG_E" orien="R90" />
        <iomarker fontsize="28" x="2624" y="2272" name="SEG_F" orien="R90" />
        <iomarker fontsize="28" x="2880" y="2272" name="SEG_G" orien="R90" />
        <iomarker fontsize="28" x="608" y="304" name="HEX0" orien="R180" />
        <iomarker fontsize="28" x="608" y="368" name="HEX1" orien="R180" />
        <iomarker fontsize="28" x="608" y="432" name="HEX2" orien="R180" />
        <iomarker fontsize="28" x="608" y="496" name="HEX3" orien="R180" />
    </sheet>
</drawing>