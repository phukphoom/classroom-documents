<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_76" />
        <signal name="A_L0_P82" />
        <signal name="XLXN_89" />
        <signal name="XLXN_88" />
        <signal name="XLXN_79" />
        <signal name="B_L1_P81" />
        <signal name="PB1_P45" />
        <signal name="XLXN_138" />
        <signal name="XLXN_151" />
        <signal name="XLXN_153" />
        <signal name="XLXN_156" />
        <signal name="XLXN_157" />
        <signal name="XLXN_158" />
        <signal name="C_L2_P80" />
        <signal name="XLXN_161" />
        <signal name="XLXN_162" />
        <signal name="a_P41" />
        <signal name="b_P40" />
        <signal name="c_P35" />
        <signal name="d_P34" />
        <signal name="e_P32" />
        <signal name="f_P29" />
        <signal name="g_P27" />
        <signal name="p_P26" />
        <signal name="common3_P30" />
        <signal name="common2_P33" />
        <signal name="common1_P43" />
        <signal name="XLXN_225" />
        <signal name="XLXN_228" />
        <signal name="XLXN_240" />
        <signal name="XLXN_239" />
        <signal name="XLXN_246" />
        <signal name="XLXN_252" />
        <port polarity="Output" name="A_L0_P82" />
        <port polarity="Output" name="B_L1_P81" />
        <port polarity="Input" name="PB1_P45" />
        <port polarity="Output" name="C_L2_P80" />
        <port polarity="Output" name="a_P41" />
        <port polarity="Output" name="b_P40" />
        <port polarity="Output" name="c_P35" />
        <port polarity="Output" name="d_P34" />
        <port polarity="Output" name="e_P32" />
        <port polarity="Output" name="f_P29" />
        <port polarity="Output" name="g_P27" />
        <port polarity="Output" name="p_P26" />
        <port polarity="Output" name="common3_P30" />
        <port polarity="Output" name="common2_P33" />
        <port polarity="Output" name="common1_P43" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="fjkc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="256" x="64" y="-384" height="320" />
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
        <blockdef name="and2b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
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
        <blockdef name="or2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="32" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="44" cy="-64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
        </blockdef>
        <block symbolname="and2" name="XLXI_47">
            <blockpin signalname="B_L1_P81" name="I0" />
            <blockpin signalname="A_L0_P82" name="I1" />
            <blockpin signalname="XLXN_76" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_49">
            <blockpin signalname="A_L0_P82" name="I0" />
            <blockpin signalname="B_L1_P81" name="I1" />
            <blockpin signalname="XLXN_79" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_50">
            <blockpin signalname="XLXN_88" name="I0" />
            <blockpin signalname="A_L0_P82" name="I1" />
            <blockpin signalname="XLXN_89" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_51">
            <blockpin signalname="B_L1_P81" name="I0" />
            <blockpin signalname="C_L2_P80" name="I1" />
            <blockpin signalname="XLXN_88" name="O" />
        </block>
        <block symbolname="fjkc" name="XLXI_72">
            <blockpin signalname="XLXN_138" name="C" />
            <blockpin signalname="XLXN_151" name="CLR" />
            <blockpin signalname="XLXN_76" name="J" />
            <blockpin signalname="XLXN_79" name="K" />
            <blockpin signalname="C_L2_P80" name="Q" />
        </block>
        <block symbolname="fjkc" name="XLXI_73">
            <blockpin signalname="XLXN_138" name="C" />
            <blockpin signalname="XLXN_151" name="CLR" />
            <blockpin signalname="XLXN_153" name="J" />
            <blockpin signalname="XLXN_153" name="K" />
            <blockpin signalname="A_L0_P82" name="Q" />
        </block>
        <block symbolname="fjkc" name="XLXI_74">
            <blockpin signalname="XLXN_138" name="C" />
            <blockpin signalname="XLXN_151" name="CLR" />
            <blockpin signalname="A_L0_P82" name="J" />
            <blockpin signalname="XLXN_89" name="K" />
            <blockpin signalname="B_L1_P81" name="Q" />
        </block>
        <block symbolname="and2" name="XLXI_77">
            <blockpin signalname="PB1_P45" name="I0" />
            <blockpin signalname="XLXN_153" name="I1" />
            <blockpin signalname="XLXN_138" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_78">
            <blockpin signalname="XLXN_153" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_79">
            <blockpin signalname="XLXN_151" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_125">
            <blockpin signalname="p_P26" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_126">
            <blockpin signalname="common3_P30" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_127">
            <blockpin signalname="common2_P33" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_128">
            <blockpin signalname="common1_P43" name="P" />
        </block>
        <block symbolname="or2" name="XLXI_130">
            <blockpin signalname="XLXN_225" name="I0" />
            <blockpin signalname="XLXN_228" name="I1" />
            <blockpin signalname="a_P41" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_131">
            <blockpin signalname="A_L0_P82" name="I0" />
            <blockpin signalname="C_L2_P80" name="I1" />
            <blockpin signalname="XLXN_225" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_133">
            <blockpin signalname="C_L2_P80" name="I0" />
            <blockpin signalname="B_L1_P81" name="I1" />
            <blockpin signalname="XLXN_228" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_143">
            <blockpin signalname="A_L0_P82" name="I0" />
            <blockpin signalname="C_L2_P80" name="I1" />
            <blockpin signalname="c_P35" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_144">
            <blockpin signalname="B_L1_P81" name="I0" />
            <blockpin signalname="XLXN_246" name="I1" />
            <blockpin signalname="d_P34" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_145">
            <blockpin signalname="C_L2_P80" name="I0" />
            <blockpin signalname="A_L0_P82" name="I1" />
            <blockpin signalname="XLXN_246" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_150">
            <blockpin signalname="A_L0_P82" name="I0" />
            <blockpin signalname="B_L1_P81" name="I1" />
            <blockpin signalname="e_P32" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_153">
            <blockpin signalname="B_L1_P81" name="I0" />
            <blockpin signalname="C_L2_P80" name="I1" />
            <blockpin signalname="g_P27" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_156">
            <blockpin signalname="XLXN_252" name="I" />
            <blockpin signalname="f_P29" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_157">
            <blockpin signalname="C_L2_P80" name="I" />
            <blockpin signalname="XLXN_252" name="O" />
        </block>
        <block symbolname="or2b1" name="XLXI_192">
            <blockpin signalname="C_L2_P80" name="I0" />
            <blockpin signalname="XLXN_239" name="I1" />
            <blockpin signalname="b_P40" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_193">
            <blockpin signalname="B_L1_P81" name="I0" />
            <blockpin signalname="A_L0_P82" name="I1" />
            <blockpin signalname="XLXN_239" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7609" height="5382">
        <attr value="CM" name="LengthUnitName" />
        <attr value="4" name="GridsPerUnit" />
        <instance x="1248" y="640" name="XLXI_47" orien="M0" />
        <instance x="1248" y="624" name="XLXI_49" orien="R180" />
        <branch name="A_L0_P82">
            <wire x2="2432" y1="1888" y2="1888" x1="448" />
            <wire x2="448" y1="1888" y2="2288" x1="448" />
            <wire x2="544" y1="2288" y2="2288" x1="448" />
            <wire x2="544" y1="2288" y2="2448" x1="544" />
            <wire x2="1024" y1="2288" y2="2288" x1="544" />
            <wire x2="1248" y1="2288" y2="2288" x1="1024" />
            <wire x2="1648" y1="2288" y2="2288" x1="1248" />
            <wire x2="1728" y1="2288" y2="2288" x1="1648" />
            <wire x2="3024" y1="2288" y2="2288" x1="1728" />
            <wire x2="1728" y1="2288" y2="2736" x1="1728" />
            <wire x2="1648" y1="2288" y2="2448" x1="1648" />
            <wire x2="1248" y1="2288" y2="2736" x1="1248" />
            <wire x2="1024" y1="2288" y2="2432" x1="1024" />
            <wire x2="1312" y1="512" y2="512" x1="1248" />
            <wire x2="1312" y1="512" y2="688" x1="1312" />
            <wire x2="2368" y1="512" y2="512" x1="1312" />
            <wire x2="2368" y1="512" y2="1072" x1="2368" />
            <wire x2="2368" y1="1072" y2="1136" x1="2368" />
            <wire x2="2368" y1="1136" y2="1200" x1="2368" />
            <wire x2="2432" y1="1136" y2="1136" x1="2368" />
            <wire x2="2432" y1="1136" y2="1888" x1="2432" />
            <wire x2="1312" y1="688" y2="688" x1="1248" />
            <wire x2="2368" y1="1072" y2="1072" x1="1824" />
            <wire x2="2368" y1="1200" y2="1200" x1="2240" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="944" y1="1136" y2="1136" x1="768" />
            <wire x2="944" y1="720" y2="1136" x1="944" />
            <wire x2="992" y1="720" y2="720" x1="944" />
        </branch>
        <instance x="1824" y="1392" name="XLXI_74" orien="M0" />
        <branch name="XLXN_76">
            <wire x2="880" y1="1072" y2="1072" x1="768" />
            <wire x2="880" y1="544" y2="1072" x1="880" />
            <wire x2="992" y1="544" y2="544" x1="880" />
        </branch>
        <instance x="768" y="1392" name="XLXI_72" orien="M0" />
        <branch name="PB1_P45">
            <wire x2="3024" y1="1776" y2="1776" x1="2912" />
        </branch>
        <branch name="XLXN_138">
            <wire x2="784" y1="1264" y2="1264" x1="768" />
            <wire x2="784" y1="1264" y2="1744" x1="784" />
            <wire x2="1856" y1="1744" y2="1744" x1="784" />
            <wire x2="2592" y1="1744" y2="1744" x1="1856" />
            <wire x2="2656" y1="1744" y2="1744" x1="2592" />
            <wire x2="1856" y1="1264" y2="1264" x1="1824" />
            <wire x2="1856" y1="1264" y2="1744" x1="1856" />
            <wire x2="2592" y1="1648" y2="1744" x1="2592" />
            <wire x2="2848" y1="1648" y2="1648" x1="2592" />
            <wire x2="2848" y1="1264" y2="1264" x1="2816" />
            <wire x2="2848" y1="1264" y2="1648" x1="2848" />
        </branch>
        <instance x="3104" y="496" name="XLXI_78" orien="R0" />
        <instance x="2240" y="1328" name="XLXI_50" orien="M0" />
        <branch name="XLXN_89">
            <wire x2="1840" y1="1136" y2="1136" x1="1824" />
            <wire x2="1840" y1="1136" y2="1232" x1="1840" />
            <wire x2="1984" y1="1232" y2="1232" x1="1840" />
        </branch>
        <instance x="3360" y="384" name="XLXI_79" orien="R180" />
        <instance x="2256" y="1616" name="XLXI_51" orien="M0" />
        <branch name="XLXN_88">
            <wire x2="1920" y1="1408" y2="1520" x1="1920" />
            <wire x2="2000" y1="1520" y2="1520" x1="1920" />
            <wire x2="2256" y1="1408" y2="1408" x1="1920" />
            <wire x2="2256" y1="1264" y2="1264" x1="2240" />
            <wire x2="2256" y1="1264" y2="1408" x1="2256" />
        </branch>
        <instance x="2912" y="1840" name="XLXI_77" orien="M0" />
        <iomarker fontsize="28" x="3024" y="1776" name="PB1_P45" orien="R0" />
        <instance x="2816" y="1392" name="XLXI_73" orien="M0" />
        <branch name="XLXN_151">
            <wire x2="768" y1="1360" y2="1392" x1="768" />
            <wire x2="1824" y1="1392" y2="1392" x1="768" />
            <wire x2="2816" y1="1392" y2="1392" x1="1824" />
            <wire x2="3296" y1="1392" y2="1392" x1="2816" />
            <wire x2="1824" y1="1360" y2="1392" x1="1824" />
            <wire x2="2816" y1="1360" y2="1392" x1="2816" />
            <wire x2="3296" y1="512" y2="1392" x1="3296" />
        </branch>
        <branch name="XLXN_153">
            <wire x2="3056" y1="1072" y2="1072" x1="2816" />
            <wire x2="3168" y1="1072" y2="1072" x1="3056" />
            <wire x2="3056" y1="1072" y2="1136" x1="3056" />
            <wire x2="3056" y1="1136" y2="1712" x1="3056" />
            <wire x2="3056" y1="1136" y2="1136" x1="2816" />
            <wire x2="3056" y1="1712" y2="1712" x1="2912" />
            <wire x2="3168" y1="496" y2="1072" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3024" y="2240" name="B_L1_P81" orien="R0" />
        <iomarker fontsize="28" x="3024" y="2176" name="C_L2_P80" orien="R0" />
        <iomarker fontsize="28" x="3024" y="2288" name="A_L0_P82" orien="R0" />
        <branch name="C_L2_P80">
            <wire x2="384" y1="1136" y2="1664" x1="384" />
            <wire x2="384" y1="1664" y2="2176" x1="384" />
            <wire x2="608" y1="2176" y2="2176" x1="384" />
            <wire x2="608" y1="2176" y2="2448" x1="608" />
            <wire x2="672" y1="2176" y2="2176" x1="608" />
            <wire x2="672" y1="2176" y2="2448" x1="672" />
            <wire x2="880" y1="2176" y2="2176" x1="672" />
            <wire x2="880" y1="2176" y2="2464" x1="880" />
            <wire x2="880" y1="2464" y2="2688" x1="880" />
            <wire x2="880" y1="2688" y2="2736" x1="880" />
            <wire x2="1312" y1="2176" y2="2176" x1="880" />
            <wire x2="1584" y1="2176" y2="2176" x1="1312" />
            <wire x2="2000" y1="2176" y2="2176" x1="1584" />
            <wire x2="2240" y1="2176" y2="2176" x1="2000" />
            <wire x2="3024" y1="2176" y2="2176" x1="2240" />
            <wire x2="2240" y1="2176" y2="2736" x1="2240" />
            <wire x2="2000" y1="2176" y2="2512" x1="2000" />
            <wire x2="1584" y1="2176" y2="2448" x1="1584" />
            <wire x2="1312" y1="2176" y2="2736" x1="1312" />
            <wire x2="2320" y1="1664" y2="1664" x1="384" />
            <wire x2="2320" y1="1488" y2="1488" x1="2256" />
            <wire x2="2320" y1="1488" y2="1664" x1="2320" />
        </branch>
        <branch name="B_L1_P81">
            <wire x2="1440" y1="1840" y2="1840" x1="416" />
            <wire x2="416" y1="1840" y2="2240" x1="416" />
            <wire x2="736" y1="2240" y2="2240" x1="416" />
            <wire x2="736" y1="2240" y2="2448" x1="736" />
            <wire x2="960" y1="2240" y2="2240" x1="736" />
            <wire x2="1024" y1="2240" y2="2240" x1="960" />
            <wire x2="1552" y1="2240" y2="2240" x1="1024" />
            <wire x2="1792" y1="2240" y2="2240" x1="1552" />
            <wire x2="2176" y1="2240" y2="2240" x1="1792" />
            <wire x2="3024" y1="2240" y2="2240" x1="2176" />
            <wire x2="2176" y1="2240" y2="2736" x1="2176" />
            <wire x2="1792" y1="2240" y2="2736" x1="1792" />
            <wire x2="1552" y1="2240" y2="2736" x1="1552" />
            <wire x2="960" y1="2240" y2="2432" x1="960" />
            <wire x2="1344" y1="576" y2="576" x1="1248" />
            <wire x2="1344" y1="576" y2="752" x1="1344" />
            <wire x2="1344" y1="752" y2="1136" x1="1344" />
            <wire x2="1440" y1="1136" y2="1136" x1="1344" />
            <wire x2="1440" y1="1136" y2="1840" x1="1440" />
            <wire x2="1344" y1="1136" y2="1600" x1="1344" />
            <wire x2="2304" y1="1600" y2="1600" x1="1344" />
            <wire x2="1344" y1="752" y2="752" x1="1248" />
            <wire x2="2304" y1="1552" y2="1552" x1="2256" />
            <wire x2="2304" y1="1552" y2="1600" x1="2304" />
        </branch>
        <instance x="2448" y="2864" name="XLXI_125" orien="R180" />
        <branch name="a_P41">
            <wire x2="640" y1="2992" y2="3024" x1="640" />
        </branch>
        <branch name="b_P40">
            <wire x2="912" y1="2992" y2="3024" x1="912" />
        </branch>
        <branch name="c_P35">
            <wire x2="1280" y1="2992" y2="3024" x1="1280" />
        </branch>
        <branch name="d_P34">
            <wire x2="1584" y1="2992" y2="3008" x1="1584" />
            <wire x2="1584" y1="3008" y2="3024" x1="1584" />
        </branch>
        <branch name="e_P32">
            <wire x2="1760" y1="2992" y2="3024" x1="1760" />
        </branch>
        <branch name="f_P29">
            <wire x2="2000" y1="2992" y2="3024" x1="2000" />
        </branch>
        <branch name="g_P27">
            <wire x2="2208" y1="2992" y2="3024" x1="2208" />
        </branch>
        <branch name="p_P26">
            <wire x2="2384" y1="2992" y2="3024" x1="2384" />
        </branch>
        <instance x="2544" y="2960" name="XLXI_126" orien="R0" />
        <instance x="2608" y="2960" name="XLXI_127" orien="R0" />
        <instance x="2672" y="2960" name="XLXI_128" orien="R0" />
        <branch name="common3_P30">
            <wire x2="2608" y1="2960" y2="3024" x1="2608" />
        </branch>
        <branch name="common2_P33">
            <wire x2="2672" y1="2960" y2="3024" x1="2672" />
        </branch>
        <branch name="common1_P43">
            <wire x2="2736" y1="2960" y2="3024" x1="2736" />
        </branch>
        <instance x="544" y="2736" name="XLXI_130" orien="R90" />
        <branch name="XLXN_225">
            <wire x2="576" y1="2704" y2="2720" x1="576" />
            <wire x2="608" y1="2720" y2="2720" x1="576" />
            <wire x2="608" y1="2720" y2="2736" x1="608" />
        </branch>
        <instance x="480" y="2448" name="XLXI_131" orien="R90" />
        <instance x="608" y="2448" name="XLXI_133" orien="R90" />
        <branch name="XLXN_228">
            <wire x2="672" y1="2720" y2="2736" x1="672" />
            <wire x2="704" y1="2720" y2="2720" x1="672" />
            <wire x2="704" y1="2704" y2="2720" x1="704" />
        </branch>
        <branch name="XLXN_239">
            <wire x2="944" y1="2720" y2="2736" x1="944" />
            <wire x2="992" y1="2720" y2="2720" x1="944" />
            <wire x2="992" y1="2688" y2="2720" x1="992" />
        </branch>
        <instance x="1184" y="2736" name="XLXI_143" orien="R90" />
        <instance x="1488" y="2736" name="XLXI_144" orien="R90" />
        <branch name="XLXN_246">
            <wire x2="1616" y1="2704" y2="2736" x1="1616" />
        </branch>
        <instance x="1520" y="2448" name="XLXI_145" orien="R90" />
        <instance x="1664" y="2736" name="XLXI_150" orien="R90" />
        <instance x="2112" y="2736" name="XLXI_153" orien="R90" />
        <instance x="1968" y="2768" name="XLXI_156" orien="R90" />
        <branch name="XLXN_252">
            <wire x2="2000" y1="2736" y2="2768" x1="2000" />
        </branch>
        <instance x="1968" y="2512" name="XLXI_157" orien="R90" />
        <iomarker fontsize="28" x="640" y="3024" name="a_P41" orien="R90" />
        <iomarker fontsize="28" x="912" y="3024" name="b_P40" orien="R90" />
        <iomarker fontsize="28" x="1280" y="3024" name="c_P35" orien="R90" />
        <iomarker fontsize="28" x="1584" y="3024" name="d_P34" orien="R90" />
        <iomarker fontsize="28" x="1760" y="3024" name="e_P32" orien="R90" />
        <iomarker fontsize="28" x="2000" y="3024" name="f_P29" orien="R90" />
        <iomarker fontsize="28" x="2208" y="3024" name="g_P27" orien="R90" />
        <iomarker fontsize="28" x="2384" y="3024" name="p_P26" orien="R90" />
        <iomarker fontsize="28" x="2608" y="3024" name="common3_P30" orien="R90" />
        <iomarker fontsize="28" x="2672" y="3024" name="common2_P33" orien="R90" />
        <iomarker fontsize="28" x="2736" y="3024" name="common1_P43" orien="R90" />
        <instance x="816" y="2736" name="XLXI_192" orien="R90" />
        <instance x="896" y="2432" name="XLXI_193" orien="R90" />
    </sheet>
</drawing>