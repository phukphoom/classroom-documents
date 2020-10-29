<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_24" />
        <signal name="XLXN_28" />
        <signal name="XLXN_32" />
        <signal name="XLXN_34" />
        <signal name="XLXN_36" />
        <signal name="XLXN_38" />
        <signal name="XLXN_48" />
        <signal name="XLXN_51" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_103" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_58" />
        <signal name="XLXN_107" />
        <signal name="XLXN_59" />
        <signal name="XLXN_73" />
        <signal name="XLXN_94" />
        <signal name="XLXN_111" />
        <signal name="A" />
        <signal name="XLXN_113" />
        <signal name="C" />
        <signal name="XLXN_115" />
        <signal name="D" />
        <signal name="XLXN_117" />
        <signal name="B" />
        <signal name="out_a" />
        <signal name="out_b" />
        <signal name="out_c" />
        <signal name="out_d" />
        <signal name="out_e" />
        <signal name="out_f" />
        <signal name="out_g" />
        <signal name="XLXN_71" />
        <signal name="XLXN_127" />
        <signal name="XLXN_72" />
        <signal name="XLXN_92" />
        <signal name="XLXN_130" />
        <signal name="XLXN_93" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="D" />
        <port polarity="Input" name="B" />
        <port polarity="Output" name="out_a" />
        <port polarity="Output" name="out_b" />
        <port polarity="Output" name="out_c" />
        <port polarity="Output" name="out_d" />
        <port polarity="Output" name="out_e" />
        <port polarity="Output" name="out_f" />
        <port polarity="Output" name="out_g" />
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
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
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
        <block symbolname="or4" name="XLXI_21">
            <blockpin signalname="XLXN_17" name="I0" />
            <blockpin signalname="XLXN_16" name="I1" />
            <blockpin signalname="C" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="out_a" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_22">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_23">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_24">
            <blockpin signalname="XLXN_20" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="XLXN_18" name="I2" />
            <blockpin signalname="out_b" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_25">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="B" name="I" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_27">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_28">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="out_c" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_29">
            <blockpin signalname="C" name="I" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_30">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_31">
            <blockpin signalname="XLXN_26" name="I0" />
            <blockpin signalname="XLXN_25" name="I1" />
            <blockpin signalname="XLXN_22" name="I2" />
            <blockpin signalname="XLXN_23" name="I3" />
            <blockpin signalname="out_d" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_46">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_47">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_48">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="B" name="I2" />
            <blockpin signalname="XLXN_26" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_60">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_61">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_34">
            <blockpin signalname="XLXN_59" name="I0" />
            <blockpin signalname="XLXN_58" name="I1" />
            <blockpin signalname="out_e" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_73">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_72" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_72">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_73" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_71">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_71" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_85">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_92" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_86">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_93" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_87">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_94" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_44">
            <blockpin signalname="XLXN_73" name="I0" />
            <blockpin signalname="XLXN_72" name="I1" />
            <blockpin signalname="XLXN_71" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="out_f" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_45">
            <blockpin signalname="XLXN_94" name="I0" />
            <blockpin signalname="XLXN_93" name="I1" />
            <blockpin signalname="XLXN_92" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="out_g" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2985" y="568" name="XLXI_21" orien="R0" />
        <branch name="XLXN_16">
            <wire x2="2985" y1="440" y2="440" x1="2953" />
        </branch>
        <instance x="2697" y="536" name="XLXI_22" orien="R0" />
        <branch name="XLXN_17">
            <wire x2="2985" y1="568" y2="568" x1="2953" />
            <wire x2="2985" y1="504" y2="568" x1="2985" />
        </branch>
        <instance x="2697" y="664" name="XLXI_23" orien="R0" />
        <instance x="3001" y="936" name="XLXI_24" orien="R0" />
        <branch name="XLXN_18">
            <wire x2="2985" y1="712" y2="712" x1="2937" />
            <wire x2="2985" y1="712" y2="744" x1="2985" />
            <wire x2="3001" y1="744" y2="744" x1="2985" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="3001" y1="808" y2="808" x1="2969" />
        </branch>
        <instance x="2713" y="904" name="XLXI_25" orien="R0" />
        <instance x="2713" y="744" name="XLXI_26" orien="R0" />
        <instance x="2713" y="1032" name="XLXI_27" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="3001" y1="936" y2="936" x1="2969" />
            <wire x2="3001" y1="872" y2="936" x1="3001" />
        </branch>
        <instance x="3001" y="1288" name="XLXI_28" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="3001" y1="1096" y2="1096" x1="2937" />
        </branch>
        <instance x="2713" y="1128" name="XLXI_29" orien="R0" />
        <instance x="2713" y="1560" name="XLXI_30" orien="R0" />
        <instance x="3001" y="1688" name="XLXI_31" orien="R0" />
        <branch name="XLXN_22">
            <wire x2="2985" y1="1464" y2="1464" x1="2969" />
            <wire x2="2985" y1="1464" y2="1496" x1="2985" />
            <wire x2="3001" y1="1496" y2="1496" x1="2985" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="2985" y1="1336" y2="1336" x1="2969" />
            <wire x2="2985" y1="1336" y2="1432" x1="2985" />
            <wire x2="3001" y1="1432" y2="1432" x1="2985" />
        </branch>
        <instance x="2713" y="1432" name="XLXI_46" orien="R0" />
        <branch name="XLXN_25">
            <wire x2="2985" y1="1592" y2="1592" x1="2969" />
            <wire x2="3001" y1="1560" y2="1560" x1="2985" />
            <wire x2="2985" y1="1560" y2="1592" x1="2985" />
        </branch>
        <instance x="2713" y="1688" name="XLXI_47" orien="R0" />
        <instance x="2713" y="1864" name="XLXI_48" orien="R0" />
        <branch name="XLXN_26">
            <wire x2="3001" y1="1736" y2="1736" x1="2969" />
            <wire x2="3001" y1="1624" y2="1736" x1="3001" />
        </branch>
        <instance x="2713" y="2024" name="XLXI_60" orien="R0" />
        <instance x="2713" y="2152" name="XLXI_61" orien="R0" />
        <instance x="3001" y="2088" name="XLXI_34" orien="R0" />
        <branch name="XLXN_58">
            <wire x2="2985" y1="1928" y2="1928" x1="2969" />
            <wire x2="2985" y1="1928" y2="1960" x1="2985" />
            <wire x2="3001" y1="1960" y2="1960" x1="2985" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="2985" y1="2056" y2="2056" x1="2969" />
            <wire x2="3001" y1="2024" y2="2024" x1="2985" />
            <wire x2="2985" y1="2024" y2="2056" x1="2985" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="3017" y1="2600" y2="2600" x1="2969" />
            <wire x2="3017" y1="2504" y2="2600" x1="3017" />
        </branch>
        <instance x="2713" y="2568" name="XLXI_73" orien="R0" />
        <instance x="2713" y="2696" name="XLXI_72" orien="R0" />
        <instance x="2713" y="2440" name="XLXI_71" orien="R0" />
        <branch name="XLXN_94">
            <wire x2="3033" y1="3176" y2="3176" x1="2969" />
            <wire x2="3033" y1="3080" y2="3176" x1="3033" />
        </branch>
        <branch name="A">
            <wire x2="2153" y1="392" y2="392" x1="1753" />
            <wire x2="2153" y1="392" y2="2232" x1="2153" />
            <wire x2="3017" y1="2232" y2="2232" x1="2153" />
            <wire x2="3017" y1="2232" y2="2312" x1="3017" />
            <wire x2="2153" y1="2232" y2="2536" x1="2153" />
            <wire x2="3033" y1="2536" y2="2536" x1="2153" />
            <wire x2="3033" y1="2536" y2="2888" x1="3033" />
            <wire x2="2985" y1="312" y2="312" x1="2153" />
            <wire x2="2153" y1="312" y2="392" x1="2153" />
        </branch>
        <branch name="C">
            <wire x2="2313" y1="552" y2="552" x1="1753" />
            <wire x2="2313" y1="552" y2="776" x1="2313" />
            <wire x2="2713" y1="776" y2="776" x1="2313" />
            <wire x2="2313" y1="776" y2="904" x1="2313" />
            <wire x2="2713" y1="904" y2="904" x1="2313" />
            <wire x2="2313" y1="904" y2="1096" x1="2313" />
            <wire x2="2713" y1="1096" y2="1096" x1="2313" />
            <wire x2="2313" y1="1096" y2="1496" x1="2313" />
            <wire x2="2713" y1="1496" y2="1496" x1="2313" />
            <wire x2="2313" y1="1496" y2="1560" x1="2313" />
            <wire x2="2713" y1="1560" y2="1560" x1="2313" />
            <wire x2="2313" y1="1560" y2="1800" x1="2313" />
            <wire x2="2713" y1="1800" y2="1800" x1="2313" />
            <wire x2="2313" y1="1800" y2="2024" x1="2313" />
            <wire x2="2713" y1="2024" y2="2024" x1="2313" />
            <wire x2="2313" y1="2024" y2="2312" x1="2313" />
            <wire x2="2713" y1="2312" y2="2312" x1="2313" />
            <wire x2="2313" y1="2312" y2="2504" x1="2313" />
            <wire x2="2713" y1="2504" y2="2504" x1="2313" />
            <wire x2="2313" y1="2504" y2="2888" x1="2313" />
            <wire x2="2313" y1="2888" y2="3016" x1="2313" />
            <wire x2="2713" y1="3016" y2="3016" x1="2313" />
            <wire x2="2313" y1="3016" y2="3208" x1="2313" />
            <wire x2="2713" y1="3208" y2="3208" x1="2313" />
            <wire x2="2713" y1="2888" y2="2888" x1="2313" />
            <wire x2="2985" y1="376" y2="376" x1="2313" />
            <wire x2="2313" y1="376" y2="552" x1="2313" />
        </branch>
        <branch name="D">
            <wire x2="2393" y1="632" y2="632" x1="1753" />
            <wire x2="2393" y1="632" y2="840" x1="2393" />
            <wire x2="2713" y1="840" y2="840" x1="2393" />
            <wire x2="2393" y1="840" y2="968" x1="2393" />
            <wire x2="2713" y1="968" y2="968" x1="2393" />
            <wire x2="2393" y1="968" y2="1160" x1="2393" />
            <wire x2="3001" y1="1160" y2="1160" x1="2393" />
            <wire x2="2393" y1="1160" y2="1368" x1="2393" />
            <wire x2="2713" y1="1368" y2="1368" x1="2393" />
            <wire x2="2393" y1="1368" y2="1624" x1="2393" />
            <wire x2="2713" y1="1624" y2="1624" x1="2393" />
            <wire x2="2393" y1="1624" y2="1736" x1="2393" />
            <wire x2="2713" y1="1736" y2="1736" x1="2393" />
            <wire x2="2393" y1="1736" y2="1960" x1="2393" />
            <wire x2="2713" y1="1960" y2="1960" x1="2393" />
            <wire x2="2393" y1="1960" y2="2088" x1="2393" />
            <wire x2="2713" y1="2088" y2="2088" x1="2393" />
            <wire x2="2393" y1="2088" y2="2376" x1="2393" />
            <wire x2="2713" y1="2376" y2="2376" x1="2393" />
            <wire x2="2393" y1="2376" y2="2632" x1="2393" />
            <wire x2="2713" y1="2632" y2="2632" x1="2393" />
            <wire x2="2393" y1="2632" y2="3080" x1="2393" />
            <wire x2="2713" y1="3080" y2="3080" x1="2393" />
            <wire x2="2697" y1="472" y2="472" x1="2393" />
            <wire x2="2393" y1="472" y2="600" x1="2393" />
            <wire x2="2697" y1="600" y2="600" x1="2393" />
            <wire x2="2393" y1="600" y2="632" x1="2393" />
        </branch>
        <branch name="B">
            <wire x2="2233" y1="472" y2="472" x1="1753" />
            <wire x2="2233" y1="472" y2="536" x1="2233" />
            <wire x2="2697" y1="536" y2="536" x1="2233" />
            <wire x2="2233" y1="536" y2="712" x1="2233" />
            <wire x2="2713" y1="712" y2="712" x1="2233" />
            <wire x2="2233" y1="712" y2="1224" x1="2233" />
            <wire x2="2233" y1="1224" y2="1304" x1="2233" />
            <wire x2="2233" y1="1304" y2="1432" x1="2233" />
            <wire x2="2713" y1="1432" y2="1432" x1="2233" />
            <wire x2="2233" y1="1432" y2="1672" x1="2233" />
            <wire x2="2713" y1="1672" y2="1672" x1="2233" />
            <wire x2="2233" y1="1672" y2="1896" x1="2233" />
            <wire x2="2713" y1="1896" y2="1896" x1="2233" />
            <wire x2="2233" y1="1896" y2="2440" x1="2233" />
            <wire x2="2713" y1="2440" y2="2440" x1="2233" />
            <wire x2="2233" y1="2440" y2="2568" x1="2233" />
            <wire x2="2713" y1="2568" y2="2568" x1="2233" />
            <wire x2="2233" y1="2568" y2="2952" x1="2233" />
            <wire x2="2713" y1="2952" y2="2952" x1="2233" />
            <wire x2="2233" y1="2952" y2="3144" x1="2233" />
            <wire x2="2713" y1="3144" y2="3144" x1="2233" />
            <wire x2="2713" y1="1304" y2="1304" x1="2233" />
            <wire x2="3001" y1="1224" y2="1224" x1="2233" />
            <wire x2="2697" y1="408" y2="408" x1="2233" />
            <wire x2="2233" y1="408" y2="472" x1="2233" />
        </branch>
        <branch name="out_a">
            <wire x2="3257" y1="408" y2="408" x1="3241" />
            <wire x2="3337" y1="408" y2="408" x1="3257" />
        </branch>
        <branch name="out_b">
            <wire x2="3273" y1="808" y2="808" x1="3257" />
            <wire x2="3337" y1="808" y2="808" x1="3273" />
        </branch>
        <branch name="out_c">
            <wire x2="3273" y1="1160" y2="1160" x1="3257" />
            <wire x2="3337" y1="1160" y2="1160" x1="3273" />
        </branch>
        <branch name="out_d">
            <wire x2="3273" y1="1528" y2="1528" x1="3257" />
            <wire x2="3337" y1="1528" y2="1528" x1="3273" />
        </branch>
        <branch name="out_e">
            <wire x2="3273" y1="1992" y2="1992" x1="3257" />
            <wire x2="3337" y1="1992" y2="1992" x1="3273" />
        </branch>
        <branch name="out_f">
            <wire x2="3353" y1="2408" y2="2408" x1="3273" />
        </branch>
        <branch name="out_g">
            <wire x2="3353" y1="2984" y2="2984" x1="3289" />
        </branch>
        <instance x="2713" y="3016" name="XLXI_85" orien="R0" />
        <instance x="2713" y="3144" name="XLXI_86" orien="R0" />
        <instance x="2713" y="3272" name="XLXI_87" orien="R0" />
        <instance x="3017" y="2568" name="XLXI_44" orien="R0" />
        <branch name="XLXN_71">
            <wire x2="2985" y1="2344" y2="2344" x1="2969" />
            <wire x2="2985" y1="2344" y2="2376" x1="2985" />
            <wire x2="3017" y1="2376" y2="2376" x1="2985" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="2985" y1="2472" y2="2472" x1="2969" />
            <wire x2="3017" y1="2440" y2="2440" x1="2985" />
            <wire x2="2985" y1="2440" y2="2472" x1="2985" />
        </branch>
        <instance x="3033" y="3144" name="XLXI_45" orien="R0" />
        <branch name="XLXN_92">
            <wire x2="2985" y1="2920" y2="2920" x1="2969" />
            <wire x2="2985" y1="2920" y2="2952" x1="2985" />
            <wire x2="3033" y1="2952" y2="2952" x1="2985" />
        </branch>
        <branch name="XLXN_93">
            <wire x2="2985" y1="3048" y2="3048" x1="2969" />
            <wire x2="3033" y1="3016" y2="3016" x1="2985" />
            <wire x2="2985" y1="3016" y2="3048" x1="2985" />
        </branch>
        <iomarker fontsize="28" x="1753" y="392" name="A" orien="R180" />
        <iomarker fontsize="28" x="1753" y="552" name="C" orien="R180" />
        <iomarker fontsize="28" x="1753" y="632" name="D" orien="R180" />
        <iomarker fontsize="28" x="1753" y="472" name="B" orien="R180" />
        <iomarker fontsize="28" x="3353" y="2984" name="out_g" orien="R0" />
        <iomarker fontsize="28" x="3353" y="2408" name="out_f" orien="R0" />
        <iomarker fontsize="28" x="3337" y="1992" name="out_e" orien="R0" />
        <iomarker fontsize="28" x="3337" y="1528" name="out_d" orien="R0" />
        <iomarker fontsize="28" x="3337" y="1160" name="out_c" orien="R0" />
        <iomarker fontsize="28" x="3337" y="808" name="out_b" orien="R0" />
        <iomarker fontsize="28" x="3337" y="408" name="out_a" orien="R0" />
    </sheet>
</drawing>