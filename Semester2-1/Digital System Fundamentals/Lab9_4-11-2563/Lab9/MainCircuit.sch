<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_97" />
        <signal name="XLXN_98" />
        <signal name="XLXN_99" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101" />
        <signal name="COMMON3_P30" />
        <signal name="COMMON2_P33" />
        <signal name="COMMON1_P43" />
        <signal name="COMMON0_P44" />
        <signal name="CLK_P123" />
        <signal name="XLXN_151" />
        <signal name="XLXN_152" />
        <signal name="XLXN_153" />
        <signal name="S(0)" />
        <signal name="S(1)" />
        <signal name="S(1:0)" />
        <signal name="SW(7:0)" />
        <signal name="DIP(7:0)" />
        <signal name="XLXN_226(3:0)" />
        <signal name="SEG_A_P41" />
        <signal name="SEG_B_P40" />
        <signal name="SEG_C_P35" />
        <signal name="SEG_D_P34" />
        <signal name="SEG_E_P32" />
        <signal name="SEG_F_P29" />
        <signal name="SEG_G_P27" />
        <signal name="XLXN_241" />
        <signal name="MODE_SW_P45" />
        <signal name="XLXN_243" />
        <signal name="XLXN_244(7:0)" />
        <signal name="XLXN_245(7:0)" />
        <signal name="XLXN_246(7:0)" />
        <signal name="XLXN_247(7:0)" />
        <signal name="O(7:0)" />
        <signal name="O(7:4)" />
        <signal name="O(3:0)" />
        <signal name="ModeSel(1:0)" />
        <signal name="ModeSel(0)" />
        <signal name="ModeSel(1)" />
        <signal name="XLXN_257(3:0)" />
        <signal name="XLXN_258(3:0)" />
        <signal name="XLXN_259" />
        <signal name="XLXN_260" />
        <signal name="XLXN_261" />
        <signal name="XLXN_262" />
        <port polarity="Output" name="COMMON3_P30" />
        <port polarity="Output" name="COMMON2_P33" />
        <port polarity="Output" name="COMMON1_P43" />
        <port polarity="Output" name="COMMON0_P44" />
        <port polarity="Input" name="CLK_P123" />
        <port polarity="Input" name="SW(7:0)" />
        <port polarity="Input" name="DIP(7:0)" />
        <port polarity="Output" name="SEG_A_P41" />
        <port polarity="Output" name="SEG_B_P40" />
        <port polarity="Output" name="SEG_C_P35" />
        <port polarity="Output" name="SEG_D_P34" />
        <port polarity="Output" name="SEG_E_P32" />
        <port polarity="Output" name="SEG_F_P29" />
        <port polarity="Output" name="SEG_G_P27" />
        <port polarity="Input" name="MODE_SW_P45" />
        <port polarity="Output" name="ModeSel(0)" />
        <port polarity="Output" name="ModeSel(1)" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="cb2ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="d2_4e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
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
        <blockdef name="cc16re">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
        </blockdef>
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
        <blockdef name="SHL8Bits_Bus">
            <timestamp>2020-11-4T19:10:13</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Xor8Bits_Bus">
            <timestamp>2020-11-4T19:41:22</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Sub8Bits_Bus">
            <timestamp>2020-11-4T18:19:57</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="HEX27SEG_Bus">
            <timestamp>2020-11-4T17:29:45</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Mux4To1_8_Bus">
            <timestamp>2020-11-4T18:56:54</timestamp>
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
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <block symbolname="d2_4e" name="XLXI_25">
            <blockpin signalname="S(0)" name="A0" />
            <blockpin signalname="S(1)" name="A1" />
            <blockpin signalname="XLXN_97" name="E" />
            <blockpin signalname="XLXN_98" name="D0" />
            <blockpin signalname="XLXN_99" name="D1" />
            <blockpin signalname="XLXN_100" name="D2" />
            <blockpin signalname="XLXN_101" name="D3" />
        </block>
        <block symbolname="inv" name="XLXI_31">
            <blockpin signalname="XLXN_101" name="I" />
            <blockpin signalname="COMMON3_P30" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_30">
            <blockpin signalname="XLXN_100" name="I" />
            <blockpin signalname="COMMON2_P33" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_29">
            <blockpin signalname="XLXN_99" name="I" />
            <blockpin signalname="COMMON1_P43" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_28">
            <blockpin signalname="XLXN_98" name="I" />
            <blockpin signalname="COMMON0_P44" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_26">
            <blockpin signalname="XLXN_97" name="P" />
        </block>
        <block symbolname="cb2ce" name="XLXI_18">
            <blockpin signalname="XLXN_151" name="C" />
            <blockpin signalname="XLXN_153" name="CE" />
            <blockpin signalname="XLXN_152" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="S(0)" name="Q0" />
            <blockpin signalname="S(1)" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="cc16re" name="XLXI_53">
            <blockpin signalname="CLK_P123" name="C" />
            <blockpin signalname="XLXN_153" name="CE" />
            <blockpin signalname="XLXN_152" name="R" />
            <blockpin name="CEO" />
            <blockpin name="Q(15:0)" />
            <blockpin signalname="XLXN_151" name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_71">
            <blockpin signalname="XLXN_153" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_72">
            <blockpin signalname="XLXN_152" name="G" />
        </block>
        <block symbolname="Mux4To1_4_Bus" name="XLXI_74">
            <blockpin signalname="XLXN_226(3:0)" name="O(3:0)" />
            <blockpin signalname="O(3:0)" name="A(3:0)" />
            <blockpin signalname="O(7:4)" name="B(3:0)" />
            <blockpin signalname="XLXN_257(3:0)" name="C(3:0)" />
            <blockpin signalname="XLXN_258(3:0)" name="D(3:0)" />
            <blockpin signalname="S(1:0)" name="S(1:0)" />
        </block>
        <block symbolname="Adder8Bits_Bus" name="XLXI_75">
            <blockpin signalname="SW(7:0)" name="A(7:0)" />
            <blockpin signalname="DIP(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_244(7:0)" name="SUM(7:0)" />
            <blockpin name="C_OUT" />
        </block>
        <block symbolname="Sub8Bits_Bus" name="XLXI_78">
            <blockpin signalname="SW(7:0)" name="A(7:0)" />
            <blockpin signalname="DIP(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_245(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="HEX27SEG_Bus" name="XLXI_83">
            <blockpin signalname="XLXN_226(3:0)" name="HEX(3:0)" />
            <blockpin signalname="SEG_A_P41" name="SEG_A" />
            <blockpin signalname="SEG_B_P40" name="SEG_B" />
            <blockpin signalname="SEG_C_P35" name="SEG_C" />
            <blockpin signalname="SEG_D_P34" name="SEG_D" />
            <blockpin signalname="SEG_E_P32" name="SEG_E" />
            <blockpin signalname="SEG_F_P29" name="SEG_F" />
            <blockpin signalname="SEG_G_P27" name="SEG_G" />
        </block>
        <block symbolname="cb2ce" name="XLXI_86">
            <blockpin signalname="MODE_SW_P45" name="C" />
            <blockpin signalname="XLXN_241" name="CE" />
            <blockpin signalname="XLXN_243" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="ModeSel(0)" name="Q0" />
            <blockpin signalname="ModeSel(1)" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_88">
            <blockpin signalname="XLXN_241" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_89">
            <blockpin signalname="XLXN_243" name="G" />
        </block>
        <block symbolname="Mux4To1_8_Bus" name="XLXI_90">
            <blockpin signalname="O(7:0)" name="O(7:0)" />
            <blockpin signalname="XLXN_244(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_245(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_246(7:0)" name="C(7:0)" />
            <blockpin signalname="XLXN_247(7:0)" name="D(7:0)" />
            <blockpin signalname="ModeSel(1:0)" name="S(1:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_92(3:0)">
            <blockpin signalname="XLXN_257(3:0)" name="G" />
        </block>
        <block symbolname="SHL8Bits_Bus" name="XLXI_76">
            <blockpin signalname="SW(7:0)" name="A(7:0)" />
            <blockpin signalname="XLXN_247(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="Xor8Bits_Bus" name="XLXI_93">
            <blockpin signalname="SW(7:0)" name="A(7:0)" />
            <blockpin signalname="DIP(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_246(7:0)" name="O(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_94(3:0)">
            <blockpin signalname="XLXN_258(3:0)" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_97">
            <wire x2="4176" y1="4720" y2="4720" x1="4128" />
        </branch>
        <branch name="XLXN_98">
            <wire x2="4592" y1="4528" y2="4528" x1="4560" />
        </branch>
        <branch name="XLXN_99">
            <wire x2="4592" y1="4592" y2="4592" x1="4560" />
        </branch>
        <branch name="XLXN_100">
            <wire x2="4592" y1="4656" y2="4656" x1="4560" />
        </branch>
        <branch name="XLXN_101">
            <wire x2="4592" y1="4720" y2="4720" x1="4560" />
        </branch>
        <instance x="4176" y="4848" name="XLXI_25" orien="R0" />
        <instance x="4592" y="4752" name="XLXI_31" orien="R0" />
        <instance x="4592" y="4688" name="XLXI_30" orien="R0" />
        <instance x="4592" y="4624" name="XLXI_29" orien="R0" />
        <instance x="4592" y="4560" name="XLXI_28" orien="R0" />
        <branch name="COMMON3_P30">
            <wire x2="4848" y1="4720" y2="4720" x1="4816" />
        </branch>
        <branch name="COMMON2_P33">
            <wire x2="4848" y1="4656" y2="4656" x1="4816" />
        </branch>
        <branch name="COMMON1_P43">
            <wire x2="4848" y1="4592" y2="4592" x1="4816" />
        </branch>
        <branch name="COMMON0_P44">
            <wire x2="4848" y1="4528" y2="4528" x1="4816" />
        </branch>
        <instance x="4128" y="4784" name="XLXI_26" orien="R270" />
        <instance x="2208" y="4608" name="XLXI_18" orien="R0" />
        <branch name="CLK_P123">
            <wire x2="1744" y1="4480" y2="4480" x1="1440" />
        </branch>
        <instance x="1744" y="4608" name="XLXI_53" orien="R0" />
        <branch name="XLXN_151">
            <wire x2="2208" y1="4480" y2="4480" x1="2128" />
        </branch>
        <branch name="XLXN_152">
            <wire x2="1744" y1="4752" y2="4752" x1="1600" />
            <wire x2="2208" y1="4752" y2="4752" x1="1744" />
            <wire x2="1744" y1="4576" y2="4752" x1="1744" />
            <wire x2="2208" y1="4576" y2="4752" x1="2208" />
        </branch>
        <branch name="XLXN_153">
            <wire x2="1680" y1="4672" y2="4672" x1="1600" />
            <wire x2="2160" y1="4672" y2="4672" x1="1680" />
            <wire x2="1744" y1="4416" y2="4416" x1="1680" />
            <wire x2="1680" y1="4416" y2="4672" x1="1680" />
            <wire x2="2160" y1="4416" y2="4672" x1="2160" />
            <wire x2="2208" y1="4416" y2="4416" x1="2160" />
        </branch>
        <instance x="1600" y="4736" name="XLXI_71" orien="R270" />
        <instance x="1472" y="4688" name="XLXI_72" orien="R90" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3232" y="4080" type="branch" />
            <wire x2="2992" y1="4288" y2="4288" x1="2592" />
            <wire x2="2992" y1="4080" y2="4288" x1="2992" />
            <wire x2="3120" y1="4080" y2="4080" x1="2992" />
            <wire x2="3120" y1="4080" y2="4528" x1="3120" />
            <wire x2="4176" y1="4528" y2="4528" x1="3120" />
            <wire x2="3232" y1="4080" y2="4080" x1="3120" />
            <wire x2="3280" y1="4080" y2="4080" x1="3232" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3232" y="4144" type="branch" />
            <wire x2="3056" y1="4352" y2="4352" x1="2592" />
            <wire x2="3056" y1="4144" y2="4352" x1="3056" />
            <wire x2="3168" y1="4144" y2="4144" x1="3056" />
            <wire x2="3168" y1="4144" y2="4592" x1="3168" />
            <wire x2="4176" y1="4592" y2="4592" x1="3168" />
            <wire x2="3232" y1="4144" y2="4144" x1="3168" />
            <wire x2="3280" y1="4144" y2="4144" x1="3232" />
        </branch>
        <iomarker fontsize="28" x="4848" y="4720" name="COMMON3_P30" orien="R0" />
        <iomarker fontsize="28" x="4848" y="4656" name="COMMON2_P33" orien="R0" />
        <iomarker fontsize="28" x="4848" y="4592" name="COMMON1_P43" orien="R0" />
        <iomarker fontsize="28" x="4848" y="4528" name="COMMON0_P44" orien="R0" />
        <iomarker fontsize="28" x="1440" y="4480" name="CLK_P123" orien="R180" />
        <instance x="3568" y="3760" name="XLXI_74" orien="R0">
        </instance>
        <branch name="S(1:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3376" y="3920" type="branch" />
            <wire x2="3568" y1="3728" y2="3728" x1="3376" />
            <wire x2="3376" y1="3728" y2="3920" x1="3376" />
            <wire x2="3376" y1="3920" y2="4080" x1="3376" />
            <wire x2="3376" y1="4080" y2="4144" x1="3376" />
        </branch>
        <bustap x2="3280" y1="4080" y2="4080" x1="3376" />
        <bustap x2="3280" y1="4144" y2="4144" x1="3376" />
        <instance x="1600" y="2704" name="XLXI_75" orien="R0">
        </instance>
        <instance x="1600" y="2960" name="XLXI_78" orien="R0">
        </instance>
        <branch name="SW(7:0)">
            <wire x2="1392" y1="2400" y2="2400" x1="1264" />
            <wire x2="1392" y1="2400" y2="2608" x1="1392" />
            <wire x2="1392" y1="2608" y2="2864" x1="1392" />
            <wire x2="1392" y1="2864" y2="3136" x1="1392" />
            <wire x2="1392" y1="3136" y2="3392" x1="1392" />
            <wire x2="1600" y1="3392" y2="3392" x1="1392" />
            <wire x2="1600" y1="3136" y2="3136" x1="1392" />
            <wire x2="1600" y1="2864" y2="2864" x1="1392" />
            <wire x2="1600" y1="2608" y2="2608" x1="1392" />
        </branch>
        <branch name="DIP(7:0)">
            <wire x2="1520" y1="2480" y2="2480" x1="1264" />
            <wire x2="1520" y1="2480" y2="2672" x1="1520" />
            <wire x2="1520" y1="2672" y2="2928" x1="1520" />
            <wire x2="1520" y1="2928" y2="3200" x1="1520" />
            <wire x2="1600" y1="3200" y2="3200" x1="1520" />
            <wire x2="1600" y1="2928" y2="2928" x1="1520" />
            <wire x2="1600" y1="2672" y2="2672" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1264" y="2480" name="DIP(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1264" y="2400" name="SW(7:0)" orien="R180" />
        <branch name="XLXN_226(3:0)">
            <wire x2="4032" y1="3472" y2="3472" x1="3952" />
            <wire x2="4160" y1="3360" y2="3360" x1="4032" />
            <wire x2="4032" y1="3360" y2="3472" x1="4032" />
        </branch>
        <branch name="SEG_A_P41">
            <wire x2="4848" y1="3360" y2="3360" x1="4544" />
        </branch>
        <branch name="SEG_B_P40">
            <wire x2="4848" y1="3424" y2="3424" x1="4544" />
        </branch>
        <branch name="SEG_C_P35">
            <wire x2="4848" y1="3488" y2="3488" x1="4544" />
        </branch>
        <branch name="SEG_D_P34">
            <wire x2="4848" y1="3552" y2="3552" x1="4544" />
        </branch>
        <branch name="SEG_E_P32">
            <wire x2="4848" y1="3616" y2="3616" x1="4544" />
        </branch>
        <branch name="SEG_F_P29">
            <wire x2="4848" y1="3680" y2="3680" x1="4544" />
        </branch>
        <branch name="SEG_G_P27">
            <wire x2="4848" y1="3744" y2="3744" x1="4544" />
        </branch>
        <instance x="4160" y="3776" name="XLXI_83" orien="R0">
        </instance>
        <iomarker fontsize="28" x="4848" y="3360" name="SEG_A_P41" orien="R0" />
        <iomarker fontsize="28" x="4848" y="3424" name="SEG_B_P40" orien="R0" />
        <iomarker fontsize="28" x="4848" y="3488" name="SEG_C_P35" orien="R0" />
        <iomarker fontsize="28" x="4848" y="3552" name="SEG_D_P34" orien="R0" />
        <iomarker fontsize="28" x="4848" y="3616" name="SEG_E_P32" orien="R0" />
        <iomarker fontsize="28" x="4848" y="3680" name="SEG_F_P29" orien="R0" />
        <iomarker fontsize="28" x="4848" y="3744" name="SEG_G_P27" orien="R0" />
        <instance x="1600" y="2080" name="XLXI_86" orien="R0" />
        <instance x="1584" y="1952" name="XLXI_88" orien="R270" />
        <branch name="XLXN_241">
            <wire x2="1600" y1="1888" y2="1888" x1="1584" />
        </branch>
        <branch name="MODE_SW_P45">
            <wire x2="1600" y1="1952" y2="1952" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="1280" y="1952" name="MODE_SW_P45" orien="R180" />
        <instance x="1456" y="1984" name="XLXI_89" orien="R90" />
        <branch name="XLXN_243">
            <wire x2="1600" y1="2048" y2="2048" x1="1584" />
        </branch>
        <instance x="2752" y="2896" name="XLXI_90" orien="R0">
        </instance>
        <branch name="XLXN_244(7:0)">
            <wire x2="2752" y1="2608" y2="2608" x1="1984" />
        </branch>
        <branch name="XLXN_245(7:0)">
            <wire x2="2080" y1="2864" y2="2864" x1="1984" />
            <wire x2="2080" y1="2672" y2="2864" x1="2080" />
            <wire x2="2752" y1="2672" y2="2672" x1="2080" />
        </branch>
        <branch name="XLXN_246(7:0)">
            <wire x2="2160" y1="3136" y2="3136" x1="1984" />
            <wire x2="2160" y1="2736" y2="3136" x1="2160" />
            <wire x2="2752" y1="2736" y2="2736" x1="2160" />
        </branch>
        <branch name="XLXN_247(7:0)">
            <wire x2="2240" y1="3392" y2="3392" x1="1984" />
            <wire x2="2240" y1="2800" y2="3392" x1="2240" />
            <wire x2="2752" y1="2800" y2="2800" x1="2240" />
        </branch>
        <branch name="O(7:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="3040" type="branch" />
            <wire x2="3200" y1="2608" y2="2608" x1="3136" />
            <wire x2="3200" y1="2608" y2="3040" x1="3200" />
            <wire x2="3200" y1="3040" y2="3472" x1="3200" />
            <wire x2="3200" y1="3472" y2="3536" x1="3200" />
        </branch>
        <bustap x2="3296" y1="3536" y2="3536" x1="3200" />
        <branch name="O(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3360" y="3536" type="branch" />
            <wire x2="3360" y1="3536" y2="3536" x1="3296" />
            <wire x2="3568" y1="3536" y2="3536" x1="3360" />
        </branch>
        <bustap x2="3296" y1="3472" y2="3472" x1="3200" />
        <branch name="O(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3360" y="3472" type="branch" />
            <wire x2="3360" y1="3472" y2="3472" x1="3296" />
            <wire x2="3568" y1="3472" y2="3472" x1="3360" />
        </branch>
        <branch name="ModeSel(1:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2480" y="2160" type="branch" />
            <wire x2="2480" y1="1760" y2="1824" x1="2480" />
            <wire x2="2480" y1="1824" y2="2160" x1="2480" />
            <wire x2="2480" y1="2160" y2="2864" x1="2480" />
            <wire x2="2752" y1="2864" y2="2864" x1="2480" />
        </branch>
        <bustap x2="2384" y1="1760" y2="1760" x1="2480" />
        <bustap x2="2384" y1="1824" y2="1824" x1="2480" />
        <branch name="ModeSel(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="1760" type="branch" />
            <wire x2="2096" y1="1760" y2="1760" x1="1984" />
            <wire x2="2240" y1="1760" y2="1760" x1="2096" />
            <wire x2="2384" y1="1760" y2="1760" x1="2240" />
            <wire x2="2560" y1="1520" y2="1520" x1="2240" />
            <wire x2="2240" y1="1520" y2="1760" x1="2240" />
        </branch>
        <branch name="ModeSel(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="1824" type="branch" />
            <wire x2="2096" y1="1824" y2="1824" x1="1984" />
            <wire x2="2320" y1="1824" y2="1824" x1="2096" />
            <wire x2="2384" y1="1824" y2="1824" x1="2320" />
            <wire x2="2560" y1="1600" y2="1600" x1="2320" />
            <wire x2="2320" y1="1600" y2="1824" x1="2320" />
        </branch>
        <instance x="1600" y="3424" name="XLXI_76" orien="R0">
        </instance>
        <instance x="1600" y="3232" name="XLXI_93" orien="R0">
        </instance>
        <instance x="3136" y="3536" name="XLXI_92(3:0)" orien="R90" />
        <branch name="XLXN_257(3:0)">
            <wire x2="3568" y1="3600" y2="3600" x1="3264" />
        </branch>
        <branch name="XLXN_258(3:0)">
            <wire x2="3568" y1="3664" y2="3664" x1="3264" />
        </branch>
        <instance x="3136" y="3600" name="XLXI_94(3:0)" orien="R90" />
        <iomarker fontsize="28" x="2560" y="1520" name="ModeSel(0)" orien="R0" />
        <iomarker fontsize="28" x="2560" y="1600" name="ModeSel(1)" orien="R0" />
    </sheet>
</drawing>