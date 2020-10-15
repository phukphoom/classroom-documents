<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_15">
        </signal>
        <signal name="XLXN_40" />
        <signal name="XLXN_53" />
        <signal name="XLXN_55" />
        <signal name="XLXN_57" />
        <signal name="XLXN_61" />
        <signal name="XLXN_66" />
        <signal name="XLXN_69" />
        <signal name="XLXN_75" />
        <signal name="XLXN_78" />
        <signal name="XLXN_81" />
        <signal name="XLXN_84" />
        <signal name="XLXN_86" />
        <signal name="XLXN_89" />
        <signal name="XLXN_96" />
        <signal name="XLXN_98" />
        <signal name="XLXN_111" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_30" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_37" />
        <signal name="XLXN_41" />
        <signal name="XLXN_47" />
        <signal name="XLXN_120" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_58" />
        <signal name="XLXN_124" />
        <signal name="XLXN_59" />
        <signal name="XLXN_73" />
        <signal name="XLXN_71" />
        <signal name="XLXN_128" />
        <signal name="XLXN_72" />
        <signal name="XLXN_94" />
        <signal name="XLXN_131" />
        <signal name="XLXN_133" />
        <signal name="C" />
        <signal name="XLXN_135" />
        <signal name="D" />
        <signal name="XLXN_137" />
        <signal name="B" />
        <signal name="out_a" />
        <signal name="out_b" />
        <signal name="out_c" />
        <signal name="out_d" />
        <signal name="out_e" />
        <signal name="out_f" />
        <signal name="out_g" />
        <signal name="XLXN_92" />
        <signal name="XLXN_147" />
        <signal name="XLXN_93" />
        <signal name="XLXN_149" />
        <signal name="XLXN_150" />
        <signal name="XLXN_151" />
        <signal name="XLXN_152" />
        <signal name="XLXN_153" />
        <signal name="XLXN_154" />
        <signal name="XLXN_155" />
        <signal name="XLXN_156" />
        <signal name="XLXN_159" />
        <signal name="XLXN_162" />
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
        <block symbolname="or4" name="XLXI_28">
            <blockpin signalname="XLXN_20" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="C" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="out_a" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_35">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_36">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_32">
            <blockpin signalname="XLXN_33" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_30" name="I2" />
            <blockpin signalname="out_b" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_38">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_37">
            <blockpin signalname="B" name="I" />
            <blockpin signalname="XLXN_30" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_39">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_33">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_37" name="I2" />
            <blockpin signalname="out_c" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_44">
            <blockpin signalname="C" name="I" />
            <blockpin signalname="XLXN_37" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_45">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_31">
            <blockpin signalname="XLXN_50" name="I0" />
            <blockpin signalname="XLXN_49" name="I1" />
            <blockpin signalname="XLXN_41" name="I2" />
            <blockpin signalname="XLXN_47" name="I3" />
            <blockpin signalname="out_d" name="O" />
        </block>
        <block symbolname="and2b2" name="XLXI_46">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_47">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_48">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="B" name="I2" />
            <blockpin signalname="XLXN_50" name="O" />
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
        <block symbolname="or4" name="XLXI_29">
            <blockpin signalname="XLXN_73" name="I0" />
            <blockpin signalname="XLXN_72" name="I1" />
            <blockpin signalname="XLXN_71" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="out_f" name="O" />
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
        <block symbolname="or4" name="XLXI_30">
            <blockpin signalname="XLXN_94" name="I0" />
            <blockpin signalname="XLXN_93" name="I1" />
            <blockpin signalname="XLXN_92" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="out_g" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7609" height="5382">
        <attr value="CM" name="LengthUnitName" />
        <attr value="4" name="GridsPerUnit" />
        <instance x="6832" y="688" name="XLXI_28" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="6832" y1="560" y2="560" x1="6800" />
        </branch>
        <instance x="6544" y="656" name="XLXI_35" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="6832" y1="688" y2="688" x1="6800" />
            <wire x2="6832" y1="624" y2="688" x1="6832" />
        </branch>
        <instance x="6544" y="784" name="XLXI_36" orien="R0" />
        <instance x="6848" y="1056" name="XLXI_32" orien="R0" />
        <branch name="XLXN_30">
            <wire x2="6832" y1="832" y2="832" x1="6784" />
            <wire x2="6832" y1="832" y2="864" x1="6832" />
            <wire x2="6848" y1="864" y2="864" x1="6832" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="6848" y1="928" y2="928" x1="6816" />
        </branch>
        <instance x="6560" y="1024" name="XLXI_38" orien="R0" />
        <instance x="6560" y="864" name="XLXI_37" orien="R0" />
        <instance x="6560" y="1152" name="XLXI_39" orien="R0" />
        <branch name="XLXN_33">
            <wire x2="6848" y1="1056" y2="1056" x1="6816" />
            <wire x2="6848" y1="992" y2="1056" x1="6848" />
        </branch>
        <instance x="6848" y="1408" name="XLXI_33" orien="R0" />
        <branch name="XLXN_37">
            <wire x2="6848" y1="1216" y2="1216" x1="6784" />
        </branch>
        <instance x="6560" y="1248" name="XLXI_44" orien="R0" />
        <instance x="6560" y="1680" name="XLXI_45" orien="R0" />
        <instance x="6848" y="1808" name="XLXI_31" orien="R0" />
        <branch name="XLXN_41">
            <wire x2="6832" y1="1584" y2="1584" x1="6816" />
            <wire x2="6832" y1="1584" y2="1616" x1="6832" />
            <wire x2="6848" y1="1616" y2="1616" x1="6832" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="6832" y1="1456" y2="1456" x1="6816" />
            <wire x2="6832" y1="1456" y2="1552" x1="6832" />
            <wire x2="6848" y1="1552" y2="1552" x1="6832" />
        </branch>
        <instance x="6560" y="1552" name="XLXI_46" orien="R0" />
        <branch name="XLXN_49">
            <wire x2="6832" y1="1712" y2="1712" x1="6816" />
            <wire x2="6848" y1="1680" y2="1680" x1="6832" />
            <wire x2="6832" y1="1680" y2="1712" x1="6832" />
        </branch>
        <instance x="6560" y="1808" name="XLXI_47" orien="R0" />
        <instance x="6560" y="1984" name="XLXI_48" orien="R0" />
        <branch name="XLXN_50">
            <wire x2="6848" y1="1856" y2="1856" x1="6816" />
            <wire x2="6848" y1="1744" y2="1856" x1="6848" />
        </branch>
        <instance x="6560" y="2144" name="XLXI_60" orien="R0" />
        <instance x="6560" y="2272" name="XLXI_61" orien="R0" />
        <instance x="6848" y="2208" name="XLXI_34" orien="R0" />
        <branch name="XLXN_58">
            <wire x2="6832" y1="2048" y2="2048" x1="6816" />
            <wire x2="6832" y1="2048" y2="2080" x1="6832" />
            <wire x2="6848" y1="2080" y2="2080" x1="6832" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="6832" y1="2176" y2="2176" x1="6816" />
            <wire x2="6848" y1="2144" y2="2144" x1="6832" />
            <wire x2="6832" y1="2144" y2="2176" x1="6832" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="6864" y1="2720" y2="2720" x1="6816" />
            <wire x2="6864" y1="2624" y2="2720" x1="6864" />
        </branch>
        <instance x="6560" y="2688" name="XLXI_73" orien="R0" />
        <instance x="6560" y="2816" name="XLXI_72" orien="R0" />
        <instance x="6560" y="2560" name="XLXI_71" orien="R0" />
        <branch name="XLXN_94">
            <wire x2="6880" y1="3296" y2="3296" x1="6816" />
            <wire x2="6880" y1="3200" y2="3296" x1="6880" />
        </branch>
        <branch name="A">
            <wire x2="6000" y1="512" y2="512" x1="5600" />
            <wire x2="6000" y1="512" y2="2352" x1="6000" />
            <wire x2="6864" y1="2352" y2="2352" x1="6000" />
            <wire x2="6864" y1="2352" y2="2432" x1="6864" />
            <wire x2="6000" y1="2352" y2="2656" x1="6000" />
            <wire x2="6880" y1="2656" y2="2656" x1="6000" />
            <wire x2="6880" y1="2656" y2="3008" x1="6880" />
            <wire x2="6832" y1="432" y2="432" x1="6000" />
            <wire x2="6000" y1="432" y2="512" x1="6000" />
        </branch>
        <branch name="C">
            <wire x2="6160" y1="672" y2="672" x1="5600" />
            <wire x2="6160" y1="672" y2="896" x1="6160" />
            <wire x2="6560" y1="896" y2="896" x1="6160" />
            <wire x2="6160" y1="896" y2="1024" x1="6160" />
            <wire x2="6560" y1="1024" y2="1024" x1="6160" />
            <wire x2="6160" y1="1024" y2="1216" x1="6160" />
            <wire x2="6560" y1="1216" y2="1216" x1="6160" />
            <wire x2="6160" y1="1216" y2="1616" x1="6160" />
            <wire x2="6560" y1="1616" y2="1616" x1="6160" />
            <wire x2="6160" y1="1616" y2="1680" x1="6160" />
            <wire x2="6560" y1="1680" y2="1680" x1="6160" />
            <wire x2="6160" y1="1680" y2="1920" x1="6160" />
            <wire x2="6560" y1="1920" y2="1920" x1="6160" />
            <wire x2="6160" y1="1920" y2="2144" x1="6160" />
            <wire x2="6560" y1="2144" y2="2144" x1="6160" />
            <wire x2="6160" y1="2144" y2="2432" x1="6160" />
            <wire x2="6560" y1="2432" y2="2432" x1="6160" />
            <wire x2="6160" y1="2432" y2="2624" x1="6160" />
            <wire x2="6560" y1="2624" y2="2624" x1="6160" />
            <wire x2="6160" y1="2624" y2="3008" x1="6160" />
            <wire x2="6160" y1="3008" y2="3136" x1="6160" />
            <wire x2="6560" y1="3136" y2="3136" x1="6160" />
            <wire x2="6160" y1="3136" y2="3328" x1="6160" />
            <wire x2="6560" y1="3328" y2="3328" x1="6160" />
            <wire x2="6560" y1="3008" y2="3008" x1="6160" />
            <wire x2="6832" y1="496" y2="496" x1="6160" />
            <wire x2="6160" y1="496" y2="672" x1="6160" />
        </branch>
        <branch name="D">
            <wire x2="6240" y1="752" y2="752" x1="5600" />
            <wire x2="6240" y1="752" y2="960" x1="6240" />
            <wire x2="6560" y1="960" y2="960" x1="6240" />
            <wire x2="6240" y1="960" y2="1088" x1="6240" />
            <wire x2="6560" y1="1088" y2="1088" x1="6240" />
            <wire x2="6240" y1="1088" y2="1280" x1="6240" />
            <wire x2="6848" y1="1280" y2="1280" x1="6240" />
            <wire x2="6240" y1="1280" y2="1488" x1="6240" />
            <wire x2="6560" y1="1488" y2="1488" x1="6240" />
            <wire x2="6240" y1="1488" y2="1744" x1="6240" />
            <wire x2="6560" y1="1744" y2="1744" x1="6240" />
            <wire x2="6240" y1="1744" y2="1856" x1="6240" />
            <wire x2="6560" y1="1856" y2="1856" x1="6240" />
            <wire x2="6240" y1="1856" y2="2080" x1="6240" />
            <wire x2="6560" y1="2080" y2="2080" x1="6240" />
            <wire x2="6240" y1="2080" y2="2208" x1="6240" />
            <wire x2="6560" y1="2208" y2="2208" x1="6240" />
            <wire x2="6240" y1="2208" y2="2496" x1="6240" />
            <wire x2="6560" y1="2496" y2="2496" x1="6240" />
            <wire x2="6240" y1="2496" y2="2752" x1="6240" />
            <wire x2="6560" y1="2752" y2="2752" x1="6240" />
            <wire x2="6240" y1="2752" y2="3200" x1="6240" />
            <wire x2="6560" y1="3200" y2="3200" x1="6240" />
            <wire x2="6544" y1="592" y2="592" x1="6240" />
            <wire x2="6240" y1="592" y2="720" x1="6240" />
            <wire x2="6544" y1="720" y2="720" x1="6240" />
            <wire x2="6240" y1="720" y2="752" x1="6240" />
        </branch>
        <branch name="B">
            <wire x2="6080" y1="592" y2="592" x1="5600" />
            <wire x2="6080" y1="592" y2="656" x1="6080" />
            <wire x2="6544" y1="656" y2="656" x1="6080" />
            <wire x2="6080" y1="656" y2="832" x1="6080" />
            <wire x2="6560" y1="832" y2="832" x1="6080" />
            <wire x2="6080" y1="832" y2="1344" x1="6080" />
            <wire x2="6080" y1="1344" y2="1424" x1="6080" />
            <wire x2="6080" y1="1424" y2="1552" x1="6080" />
            <wire x2="6560" y1="1552" y2="1552" x1="6080" />
            <wire x2="6080" y1="1552" y2="1792" x1="6080" />
            <wire x2="6560" y1="1792" y2="1792" x1="6080" />
            <wire x2="6080" y1="1792" y2="2016" x1="6080" />
            <wire x2="6560" y1="2016" y2="2016" x1="6080" />
            <wire x2="6080" y1="2016" y2="2560" x1="6080" />
            <wire x2="6560" y1="2560" y2="2560" x1="6080" />
            <wire x2="6080" y1="2560" y2="2688" x1="6080" />
            <wire x2="6560" y1="2688" y2="2688" x1="6080" />
            <wire x2="6080" y1="2688" y2="3072" x1="6080" />
            <wire x2="6560" y1="3072" y2="3072" x1="6080" />
            <wire x2="6080" y1="3072" y2="3264" x1="6080" />
            <wire x2="6560" y1="3264" y2="3264" x1="6080" />
            <wire x2="6560" y1="1424" y2="1424" x1="6080" />
            <wire x2="6848" y1="1344" y2="1344" x1="6080" />
            <wire x2="6544" y1="528" y2="528" x1="6080" />
            <wire x2="6080" y1="528" y2="592" x1="6080" />
        </branch>
        <branch name="out_a">
            <wire x2="7104" y1="528" y2="528" x1="7088" />
            <wire x2="7184" y1="528" y2="528" x1="7104" />
        </branch>
        <branch name="out_b">
            <wire x2="7120" y1="928" y2="928" x1="7104" />
            <wire x2="7184" y1="928" y2="928" x1="7120" />
        </branch>
        <branch name="out_c">
            <wire x2="7120" y1="1280" y2="1280" x1="7104" />
            <wire x2="7184" y1="1280" y2="1280" x1="7120" />
        </branch>
        <branch name="out_d">
            <wire x2="7120" y1="1648" y2="1648" x1="7104" />
            <wire x2="7184" y1="1648" y2="1648" x1="7120" />
        </branch>
        <branch name="out_e">
            <wire x2="7120" y1="2112" y2="2112" x1="7104" />
            <wire x2="7184" y1="2112" y2="2112" x1="7120" />
        </branch>
        <branch name="out_f">
            <wire x2="7200" y1="2528" y2="2528" x1="7120" />
        </branch>
        <branch name="out_g">
            <wire x2="7200" y1="3104" y2="3104" x1="7136" />
        </branch>
        <rect width="1444" x="5692" y="360" height="3048" />
        <text style="fontsize:100;fontname:Arial" x="5692" y="300">BCD27SEG</text>
        <iomarker fontsize="28" x="5600" y="512" name="A" orien="R180" />
        <iomarker fontsize="28" x="5600" y="672" name="C" orien="R180" />
        <iomarker fontsize="28" x="5600" y="752" name="D" orien="R180" />
        <iomarker fontsize="28" x="5600" y="592" name="B" orien="R180" />
        <iomarker fontsize="28" x="7200" y="3104" name="out_g" orien="R0" />
        <iomarker fontsize="28" x="7200" y="2528" name="out_f" orien="R0" />
        <iomarker fontsize="28" x="7184" y="2112" name="out_e" orien="R0" />
        <iomarker fontsize="28" x="7184" y="1648" name="out_d" orien="R0" />
        <iomarker fontsize="28" x="7184" y="1280" name="out_c" orien="R0" />
        <iomarker fontsize="28" x="7184" y="928" name="out_b" orien="R0" />
        <iomarker fontsize="28" x="7184" y="528" name="out_a" orien="R0" />
        <instance x="6560" y="3136" name="XLXI_85" orien="R0" />
        <instance x="6560" y="3264" name="XLXI_86" orien="R0" />
        <instance x="6560" y="3392" name="XLXI_87" orien="R0" />
        <instance x="6864" y="2688" name="XLXI_29" orien="R0" />
        <branch name="XLXN_71">
            <wire x2="6832" y1="2464" y2="2464" x1="6816" />
            <wire x2="6832" y1="2464" y2="2496" x1="6832" />
            <wire x2="6864" y1="2496" y2="2496" x1="6832" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="6832" y1="2592" y2="2592" x1="6816" />
            <wire x2="6864" y1="2560" y2="2560" x1="6832" />
            <wire x2="6832" y1="2560" y2="2592" x1="6832" />
        </branch>
        <instance x="6880" y="3264" name="XLXI_30" orien="R0" />
        <branch name="XLXN_92">
            <wire x2="6832" y1="3040" y2="3040" x1="6816" />
            <wire x2="6832" y1="3040" y2="3072" x1="6832" />
            <wire x2="6880" y1="3072" y2="3072" x1="6832" />
        </branch>
        <branch name="XLXN_93">
            <wire x2="6832" y1="3168" y2="3168" x1="6816" />
            <wire x2="6880" y1="3136" y2="3136" x1="6832" />
            <wire x2="6832" y1="3136" y2="3168" x1="6832" />
        </branch>
    </sheet>
</drawing>