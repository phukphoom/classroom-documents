<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_3" />
        <signal name="XLXN_5" />
        <signal name="XLXN_7" />
        <signal name="XLXN_9" />
        <signal name="XLXN_11" />
        <signal name="XLXN_13" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_54" />
        <signal name="XLXN_56" />
        <signal name="XLXN_58" />
        <signal name="XLXN_60" />
        <signal name="XLXN_62" />
        <signal name="XLXN_64" />
        <signal name="XLXN_68" />
        <signal name="XLXN_2" />
        <signal name="XLXN_70" />
        <signal name="XLXN_4" />
        <signal name="XLXN_72" />
        <signal name="XLXN_6" />
        <signal name="XLXN_74" />
        <signal name="XLXN_8" />
        <signal name="XLXN_76" />
        <signal name="XLXN_10" />
        <signal name="XLXN_78" />
        <signal name="XLXN_12" />
        <signal name="XLXN_80" />
        <signal name="XLXN_14" />
        <signal name="XLXN_33" />
        <signal name="A(7:0)" />
        <signal name="A(0)" />
        <signal name="A(1)" />
        <signal name="A(2)" />
        <signal name="A(3)" />
        <signal name="A(4)" />
        <signal name="A(5)" />
        <signal name="A(6)" />
        <signal name="A(7)" />
        <signal name="B(7:0)" />
        <signal name="B(0)" />
        <signal name="B(1)" />
        <signal name="B(2)" />
        <signal name="B(3)" />
        <signal name="B(4)" />
        <signal name="B(5)" />
        <signal name="B(6)" />
        <signal name="B(7)" />
        <signal name="XLXN_97" />
        <signal name="SUM(7:0)" />
        <signal name="SUM(0)" />
        <signal name="SUM(1)" />
        <signal name="SUM(2)" />
        <signal name="SUM(3)" />
        <signal name="SUM(4)" />
        <signal name="SUM(5)" />
        <signal name="SUM(6)" />
        <signal name="SUM(7)" />
        <signal name="C_OUT" />
        <port polarity="Input" name="A(7:0)" />
        <port polarity="Input" name="B(7:0)" />
        <port polarity="Output" name="SUM(7:0)" />
        <port polarity="Output" name="C_OUT" />
        <blockdef name="FullAdder">
            <timestamp>2020-10-28T16:16:57</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <block symbolname="FullAdder" name="XLXI_1">
            <blockpin signalname="XLXN_33" name="C_IN" />
            <blockpin signalname="A(0)" name="A_BIT" />
            <blockpin signalname="B(0)" name="B_BIT" />
            <blockpin signalname="SUM(0)" name="SUM" />
            <blockpin signalname="XLXN_2" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_2">
            <blockpin signalname="XLXN_2" name="C_IN" />
            <blockpin signalname="A(1)" name="A_BIT" />
            <blockpin signalname="B(1)" name="B_BIT" />
            <blockpin signalname="SUM(1)" name="SUM" />
            <blockpin signalname="XLXN_4" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_35">
            <blockpin signalname="XLXN_4" name="C_IN" />
            <blockpin signalname="A(2)" name="A_BIT" />
            <blockpin signalname="B(2)" name="B_BIT" />
            <blockpin signalname="SUM(2)" name="SUM" />
            <blockpin signalname="XLXN_6" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_36">
            <blockpin signalname="XLXN_6" name="C_IN" />
            <blockpin signalname="A(3)" name="A_BIT" />
            <blockpin signalname="B(3)" name="B_BIT" />
            <blockpin signalname="SUM(3)" name="SUM" />
            <blockpin signalname="XLXN_8" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_40">
            <blockpin signalname="XLXN_8" name="C_IN" />
            <blockpin signalname="A(4)" name="A_BIT" />
            <blockpin signalname="B(4)" name="B_BIT" />
            <blockpin signalname="SUM(4)" name="SUM" />
            <blockpin signalname="XLXN_10" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_41">
            <blockpin signalname="XLXN_10" name="C_IN" />
            <blockpin signalname="A(5)" name="A_BIT" />
            <blockpin signalname="B(5)" name="B_BIT" />
            <blockpin signalname="SUM(5)" name="SUM" />
            <blockpin signalname="XLXN_12" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_42">
            <blockpin signalname="XLXN_12" name="C_IN" />
            <blockpin signalname="A(6)" name="A_BIT" />
            <blockpin signalname="B(6)" name="B_BIT" />
            <blockpin signalname="SUM(6)" name="SUM" />
            <blockpin signalname="XLXN_14" name="C_OUT" />
        </block>
        <block symbolname="FullAdder" name="XLXI_43">
            <blockpin signalname="XLXN_14" name="C_IN" />
            <blockpin signalname="A(7)" name="A_BIT" />
            <blockpin signalname="B(7)" name="B_BIT" />
            <blockpin signalname="SUM(7)" name="SUM" />
            <blockpin signalname="C_OUT" name="C_OUT" />
        </block>
        <block symbolname="gnd" name="XLXI_76">
            <blockpin signalname="XLXN_33" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2432" y="656" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2432" y="992" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2432" y="1328" name="XLXI_35" orien="R0">
        </instance>
        <instance x="2432" y="1664" name="XLXI_36" orien="R0">
        </instance>
        <instance x="2432" y="2000" name="XLXI_40" orien="R0">
        </instance>
        <instance x="2432" y="2336" name="XLXI_41" orien="R0">
        </instance>
        <instance x="2432" y="2672" name="XLXI_42" orien="R0">
        </instance>
        <instance x="2432" y="3008" name="XLXI_43" orien="R0">
        </instance>
        <branch name="XLXN_2">
            <wire x2="2336" y1="688" y2="832" x1="2336" />
            <wire x2="2432" y1="832" y2="832" x1="2336" />
            <wire x2="2896" y1="688" y2="688" x1="2336" />
            <wire x2="2896" y1="624" y2="624" x1="2816" />
            <wire x2="2896" y1="624" y2="688" x1="2896" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2336" y1="1024" y2="1168" x1="2336" />
            <wire x2="2432" y1="1168" y2="1168" x1="2336" />
            <wire x2="2896" y1="1024" y2="1024" x1="2336" />
            <wire x2="2896" y1="960" y2="960" x1="2816" />
            <wire x2="2896" y1="960" y2="1024" x1="2896" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="2896" y1="1360" y2="1360" x1="2336" />
            <wire x2="2336" y1="1360" y2="1504" x1="2336" />
            <wire x2="2432" y1="1504" y2="1504" x1="2336" />
            <wire x2="2896" y1="1296" y2="1296" x1="2816" />
            <wire x2="2896" y1="1296" y2="1360" x1="2896" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="2336" y1="1696" y2="1840" x1="2336" />
            <wire x2="2432" y1="1840" y2="1840" x1="2336" />
            <wire x2="2896" y1="1696" y2="1696" x1="2336" />
            <wire x2="2896" y1="1632" y2="1632" x1="2816" />
            <wire x2="2896" y1="1632" y2="1696" x1="2896" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="2336" y1="2032" y2="2176" x1="2336" />
            <wire x2="2432" y1="2176" y2="2176" x1="2336" />
            <wire x2="2896" y1="2032" y2="2032" x1="2336" />
            <wire x2="2896" y1="1968" y2="1968" x1="2816" />
            <wire x2="2896" y1="1968" y2="2032" x1="2896" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="2336" y1="2368" y2="2512" x1="2336" />
            <wire x2="2432" y1="2512" y2="2512" x1="2336" />
            <wire x2="2896" y1="2368" y2="2368" x1="2336" />
            <wire x2="2896" y1="2304" y2="2304" x1="2816" />
            <wire x2="2896" y1="2304" y2="2368" x1="2896" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2336" y1="2704" y2="2848" x1="2336" />
            <wire x2="2432" y1="2848" y2="2848" x1="2336" />
            <wire x2="2880" y1="2704" y2="2704" x1="2336" />
            <wire x2="2880" y1="2640" y2="2640" x1="2816" />
            <wire x2="2880" y1="2640" y2="2704" x1="2880" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="2432" y1="496" y2="496" x1="2400" />
        </branch>
        <instance x="2272" y="432" name="XLXI_76" orien="R90" />
        <branch name="A(7:0)">
            <wire x2="2096" y1="416" y2="416" x1="1872" />
            <wire x2="2096" y1="416" y2="560" x1="2096" />
            <wire x2="2096" y1="560" y2="896" x1="2096" />
            <wire x2="2096" y1="896" y2="1232" x1="2096" />
            <wire x2="2096" y1="1232" y2="1568" x1="2096" />
            <wire x2="2096" y1="1568" y2="1904" x1="2096" />
            <wire x2="2096" y1="1904" y2="2240" x1="2096" />
            <wire x2="2096" y1="2240" y2="2576" x1="2096" />
            <wire x2="2096" y1="2576" y2="2912" x1="2096" />
        </branch>
        <bustap x2="2192" y1="560" y2="560" x1="2096" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="560" type="branch" />
            <wire x2="2224" y1="560" y2="560" x1="2192" />
            <wire x2="2432" y1="560" y2="560" x1="2224" />
        </branch>
        <bustap x2="2192" y1="896" y2="896" x1="2096" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="896" type="branch" />
            <wire x2="2224" y1="896" y2="896" x1="2192" />
            <wire x2="2432" y1="896" y2="896" x1="2224" />
        </branch>
        <bustap x2="2192" y1="1232" y2="1232" x1="2096" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="1232" type="branch" />
            <wire x2="2224" y1="1232" y2="1232" x1="2192" />
            <wire x2="2432" y1="1232" y2="1232" x1="2224" />
        </branch>
        <bustap x2="2192" y1="1568" y2="1568" x1="2096" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="1568" type="branch" />
            <wire x2="2224" y1="1568" y2="1568" x1="2192" />
            <wire x2="2432" y1="1568" y2="1568" x1="2224" />
        </branch>
        <bustap x2="2192" y1="1904" y2="1904" x1="2096" />
        <branch name="A(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="1904" type="branch" />
            <wire x2="2224" y1="1904" y2="1904" x1="2192" />
            <wire x2="2432" y1="1904" y2="1904" x1="2224" />
        </branch>
        <bustap x2="2192" y1="2240" y2="2240" x1="2096" />
        <branch name="A(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="2240" type="branch" />
            <wire x2="2224" y1="2240" y2="2240" x1="2192" />
            <wire x2="2432" y1="2240" y2="2240" x1="2224" />
        </branch>
        <bustap x2="2192" y1="2576" y2="2576" x1="2096" />
        <branch name="A(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="2576" type="branch" />
            <wire x2="2224" y1="2576" y2="2576" x1="2192" />
            <wire x2="2432" y1="2576" y2="2576" x1="2224" />
        </branch>
        <bustap x2="2192" y1="2912" y2="2912" x1="2096" />
        <branch name="A(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="2912" type="branch" />
            <wire x2="2224" y1="2912" y2="2912" x1="2192" />
            <wire x2="2432" y1="2912" y2="2912" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="1872" y="416" name="A(7:0)" orien="R180" />
        <bustap x2="2272" y1="624" y2="624" x1="2176" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="624" type="branch" />
            <wire x2="2336" y1="624" y2="624" x1="2272" />
            <wire x2="2432" y1="624" y2="624" x1="2336" />
        </branch>
        <bustap x2="2272" y1="960" y2="960" x1="2176" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="960" type="branch" />
            <wire x2="2336" y1="960" y2="960" x1="2272" />
            <wire x2="2432" y1="960" y2="960" x1="2336" />
        </branch>
        <bustap x2="2272" y1="1296" y2="1296" x1="2176" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="1296" type="branch" />
            <wire x2="2336" y1="1296" y2="1296" x1="2272" />
            <wire x2="2432" y1="1296" y2="1296" x1="2336" />
        </branch>
        <bustap x2="2272" y1="1632" y2="1632" x1="2176" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="1632" type="branch" />
            <wire x2="2336" y1="1632" y2="1632" x1="2272" />
            <wire x2="2432" y1="1632" y2="1632" x1="2336" />
        </branch>
        <bustap x2="2272" y1="1968" y2="1968" x1="2176" />
        <branch name="B(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="1968" type="branch" />
            <wire x2="2336" y1="1968" y2="1968" x1="2272" />
            <wire x2="2432" y1="1968" y2="1968" x1="2336" />
        </branch>
        <bustap x2="2272" y1="2304" y2="2304" x1="2176" />
        <branch name="B(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="2304" type="branch" />
            <wire x2="2336" y1="2304" y2="2304" x1="2272" />
            <wire x2="2432" y1="2304" y2="2304" x1="2336" />
        </branch>
        <bustap x2="2272" y1="2640" y2="2640" x1="2176" />
        <branch name="B(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="2640" type="branch" />
            <wire x2="2336" y1="2640" y2="2640" x1="2272" />
            <wire x2="2432" y1="2640" y2="2640" x1="2336" />
        </branch>
        <bustap x2="2272" y1="2976" y2="2976" x1="2176" />
        <branch name="B(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2336" y="2976" type="branch" />
            <wire x2="2336" y1="2976" y2="2976" x1="2272" />
            <wire x2="2432" y1="2976" y2="2976" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="1872" y="496" name="B(7:0)" orien="R180" />
        <branch name="B(7:0)">
            <wire x2="2176" y1="496" y2="496" x1="1872" />
            <wire x2="2176" y1="496" y2="624" x1="2176" />
            <wire x2="2176" y1="624" y2="960" x1="2176" />
            <wire x2="2176" y1="960" y2="1296" x1="2176" />
            <wire x2="2176" y1="1296" y2="1632" x1="2176" />
            <wire x2="2176" y1="1632" y2="1968" x1="2176" />
            <wire x2="2176" y1="1968" y2="2304" x1="2176" />
            <wire x2="2176" y1="2304" y2="2640" x1="2176" />
            <wire x2="2176" y1="2640" y2="2976" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="3424" y="480" name="SUM(7:0)" orien="R0" />
        <branch name="SUM(7:0)">
            <wire x2="3424" y1="480" y2="480" x1="3232" />
            <wire x2="3232" y1="480" y2="496" x1="3232" />
            <wire x2="3232" y1="496" y2="832" x1="3232" />
            <wire x2="3232" y1="832" y2="1168" x1="3232" />
            <wire x2="3232" y1="1168" y2="1504" x1="3232" />
            <wire x2="3232" y1="1504" y2="1840" x1="3232" />
            <wire x2="3232" y1="1840" y2="2176" x1="3232" />
            <wire x2="3232" y1="2176" y2="2512" x1="3232" />
            <wire x2="3232" y1="2512" y2="2848" x1="3232" />
        </branch>
        <bustap x2="3136" y1="496" y2="496" x1="3232" />
        <branch name="SUM(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="496" type="branch" />
            <wire x2="3040" y1="496" y2="496" x1="2816" />
            <wire x2="3136" y1="496" y2="496" x1="3040" />
        </branch>
        <bustap x2="3136" y1="832" y2="832" x1="3232" />
        <branch name="SUM(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="832" type="branch" />
            <wire x2="3040" y1="832" y2="832" x1="2816" />
            <wire x2="3136" y1="832" y2="832" x1="3040" />
        </branch>
        <bustap x2="3136" y1="1168" y2="1168" x1="3232" />
        <branch name="SUM(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="1168" type="branch" />
            <wire x2="3040" y1="1168" y2="1168" x1="2816" />
            <wire x2="3136" y1="1168" y2="1168" x1="3040" />
        </branch>
        <bustap x2="3136" y1="1504" y2="1504" x1="3232" />
        <branch name="SUM(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="1504" type="branch" />
            <wire x2="3040" y1="1504" y2="1504" x1="2816" />
            <wire x2="3136" y1="1504" y2="1504" x1="3040" />
        </branch>
        <bustap x2="3136" y1="1840" y2="1840" x1="3232" />
        <branch name="SUM(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="1840" type="branch" />
            <wire x2="3040" y1="1840" y2="1840" x1="2816" />
            <wire x2="3136" y1="1840" y2="1840" x1="3040" />
        </branch>
        <bustap x2="3136" y1="2176" y2="2176" x1="3232" />
        <branch name="SUM(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="2176" type="branch" />
            <wire x2="3040" y1="2176" y2="2176" x1="2816" />
            <wire x2="3136" y1="2176" y2="2176" x1="3040" />
        </branch>
        <bustap x2="3136" y1="2512" y2="2512" x1="3232" />
        <branch name="SUM(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="2512" type="branch" />
            <wire x2="3040" y1="2512" y2="2512" x1="2816" />
            <wire x2="3136" y1="2512" y2="2512" x1="3040" />
        </branch>
        <bustap x2="3136" y1="2848" y2="2848" x1="3232" />
        <branch name="SUM(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="2848" type="branch" />
            <wire x2="3040" y1="2848" y2="2848" x1="2816" />
            <wire x2="3136" y1="2848" y2="2848" x1="3040" />
        </branch>
        <branch name="C_OUT">
            <wire x2="2832" y1="2976" y2="2976" x1="2816" />
            <wire x2="3424" y1="2976" y2="2976" x1="2832" />
        </branch>
        <iomarker fontsize="28" x="3424" y="2976" name="C_OUT" orien="R0" />
    </sheet>
</drawing>