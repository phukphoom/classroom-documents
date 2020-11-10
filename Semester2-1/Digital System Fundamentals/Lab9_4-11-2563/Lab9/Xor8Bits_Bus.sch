<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="O(7:0)" />
        <signal name="O(0)" />
        <signal name="O(1)" />
        <signal name="O(2)" />
        <signal name="O(3)" />
        <signal name="O(4)" />
        <signal name="O(5)" />
        <signal name="O(7)" />
        <signal name="O(6)" />
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
        <port polarity="Output" name="O(7:0)" />
        <port polarity="Input" name="A(7:0)" />
        <port polarity="Input" name="B(7:0)" />
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
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="B(1)" name="I0" />
            <blockpin signalname="A(1)" name="I1" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_1">
            <blockpin signalname="B(0)" name="I0" />
            <blockpin signalname="A(0)" name="I1" />
            <blockpin signalname="O(0)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_3">
            <blockpin signalname="B(3)" name="I0" />
            <blockpin signalname="A(3)" name="I1" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_4">
            <blockpin signalname="B(2)" name="I0" />
            <blockpin signalname="A(2)" name="I1" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_5">
            <blockpin signalname="B(5)" name="I0" />
            <blockpin signalname="A(5)" name="I1" />
            <blockpin signalname="O(5)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_6">
            <blockpin signalname="B(4)" name="I0" />
            <blockpin signalname="A(4)" name="I1" />
            <blockpin signalname="O(4)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_7">
            <blockpin signalname="B(7)" name="I0" />
            <blockpin signalname="A(7)" name="I1" />
            <blockpin signalname="O(7)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_8">
            <blockpin signalname="B(6)" name="I0" />
            <blockpin signalname="A(6)" name="I1" />
            <blockpin signalname="O(6)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1584" y="1008" name="XLXI_2" orien="R0" />
        <instance x="1584" y="832" name="XLXI_1" orien="R0" />
        <instance x="1584" y="1376" name="XLXI_3" orien="R0" />
        <instance x="1584" y="1200" name="XLXI_4" orien="R0" />
        <instance x="1584" y="1728" name="XLXI_5" orien="R0" />
        <instance x="1584" y="1552" name="XLXI_6" orien="R0" />
        <instance x="1584" y="2096" name="XLXI_7" orien="R0" />
        <instance x="1584" y="1920" name="XLXI_8" orien="R0" />
        <iomarker fontsize="28" x="2320" y="704" name="O(7:0)" orien="R0" />
        <branch name="O(7:0)">
            <wire x2="2320" y1="704" y2="704" x1="2096" />
            <wire x2="2096" y1="704" y2="736" x1="2096" />
            <wire x2="2096" y1="736" y2="912" x1="2096" />
            <wire x2="2096" y1="912" y2="1104" x1="2096" />
            <wire x2="2096" y1="1104" y2="1280" x1="2096" />
            <wire x2="2096" y1="1280" y2="1456" x1="2096" />
            <wire x2="2096" y1="1456" y2="1632" x1="2096" />
            <wire x2="2096" y1="1632" y2="1824" x1="2096" />
            <wire x2="2096" y1="1824" y2="2000" x1="2096" />
        </branch>
        <bustap x2="2000" y1="736" y2="736" x1="2096" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="736" type="branch" />
            <wire x2="1920" y1="736" y2="736" x1="1840" />
            <wire x2="2000" y1="736" y2="736" x1="1920" />
        </branch>
        <bustap x2="2000" y1="912" y2="912" x1="2096" />
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="912" type="branch" />
            <wire x2="1920" y1="912" y2="912" x1="1840" />
            <wire x2="2000" y1="912" y2="912" x1="1920" />
        </branch>
        <bustap x2="2000" y1="1104" y2="1104" x1="2096" />
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1104" type="branch" />
            <wire x2="1920" y1="1104" y2="1104" x1="1840" />
            <wire x2="2000" y1="1104" y2="1104" x1="1920" />
        </branch>
        <bustap x2="2000" y1="1280" y2="1280" x1="2096" />
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1280" type="branch" />
            <wire x2="1920" y1="1280" y2="1280" x1="1840" />
            <wire x2="2000" y1="1280" y2="1280" x1="1920" />
        </branch>
        <bustap x2="2000" y1="1456" y2="1456" x1="2096" />
        <branch name="O(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1456" type="branch" />
            <wire x2="1920" y1="1456" y2="1456" x1="1840" />
            <wire x2="2000" y1="1456" y2="1456" x1="1920" />
        </branch>
        <bustap x2="2000" y1="1632" y2="1632" x1="2096" />
        <branch name="O(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1632" type="branch" />
            <wire x2="1920" y1="1632" y2="1632" x1="1840" />
            <wire x2="2000" y1="1632" y2="1632" x1="1920" />
        </branch>
        <bustap x2="2000" y1="2000" y2="2000" x1="2096" />
        <branch name="O(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="2000" type="branch" />
            <wire x2="1920" y1="2000" y2="2000" x1="1840" />
            <wire x2="2000" y1="2000" y2="2000" x1="1920" />
        </branch>
        <bustap x2="2000" y1="1824" y2="1824" x1="2096" />
        <branch name="O(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1824" type="branch" />
            <wire x2="1920" y1="1824" y2="1824" x1="1840" />
            <wire x2="2000" y1="1824" y2="1824" x1="1920" />
        </branch>
        <branch name="A(7:0)">
            <wire x2="1232" y1="688" y2="688" x1="1072" />
            <wire x2="1232" y1="688" y2="704" x1="1232" />
            <wire x2="1232" y1="704" y2="880" x1="1232" />
            <wire x2="1232" y1="880" y2="1072" x1="1232" />
            <wire x2="1232" y1="1072" y2="1248" x1="1232" />
            <wire x2="1232" y1="1248" y2="1424" x1="1232" />
            <wire x2="1232" y1="1424" y2="1600" x1="1232" />
            <wire x2="1232" y1="1600" y2="1792" x1="1232" />
            <wire x2="1232" y1="1792" y2="1968" x1="1232" />
        </branch>
        <bustap x2="1328" y1="704" y2="704" x1="1232" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="704" type="branch" />
            <wire x2="1440" y1="704" y2="704" x1="1328" />
            <wire x2="1584" y1="704" y2="704" x1="1440" />
        </branch>
        <bustap x2="1328" y1="880" y2="880" x1="1232" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="880" type="branch" />
            <wire x2="1440" y1="880" y2="880" x1="1328" />
            <wire x2="1584" y1="880" y2="880" x1="1440" />
        </branch>
        <bustap x2="1328" y1="1072" y2="1072" x1="1232" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1072" type="branch" />
            <wire x2="1440" y1="1072" y2="1072" x1="1328" />
            <wire x2="1584" y1="1072" y2="1072" x1="1440" />
        </branch>
        <bustap x2="1328" y1="1248" y2="1248" x1="1232" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1248" type="branch" />
            <wire x2="1440" y1="1248" y2="1248" x1="1328" />
            <wire x2="1584" y1="1248" y2="1248" x1="1440" />
        </branch>
        <bustap x2="1328" y1="1424" y2="1424" x1="1232" />
        <branch name="A(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1424" type="branch" />
            <wire x2="1440" y1="1424" y2="1424" x1="1328" />
            <wire x2="1584" y1="1424" y2="1424" x1="1440" />
        </branch>
        <bustap x2="1328" y1="1600" y2="1600" x1="1232" />
        <branch name="A(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1600" type="branch" />
            <wire x2="1440" y1="1600" y2="1600" x1="1328" />
            <wire x2="1584" y1="1600" y2="1600" x1="1440" />
        </branch>
        <bustap x2="1328" y1="1792" y2="1792" x1="1232" />
        <branch name="A(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1792" type="branch" />
            <wire x2="1440" y1="1792" y2="1792" x1="1328" />
            <wire x2="1584" y1="1792" y2="1792" x1="1440" />
        </branch>
        <bustap x2="1328" y1="1968" y2="1968" x1="1232" />
        <branch name="A(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1968" type="branch" />
            <wire x2="1440" y1="1968" y2="1968" x1="1328" />
            <wire x2="1584" y1="1968" y2="1968" x1="1440" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="1280" y1="752" y2="752" x1="1072" />
            <wire x2="1280" y1="752" y2="768" x1="1280" />
            <wire x2="1280" y1="768" y2="944" x1="1280" />
            <wire x2="1280" y1="944" y2="1136" x1="1280" />
            <wire x2="1280" y1="1136" y2="1312" x1="1280" />
            <wire x2="1280" y1="1312" y2="1488" x1="1280" />
            <wire x2="1280" y1="1488" y2="1664" x1="1280" />
            <wire x2="1280" y1="1664" y2="1856" x1="1280" />
            <wire x2="1280" y1="1856" y2="2032" x1="1280" />
        </branch>
        <bustap x2="1376" y1="768" y2="768" x1="1280" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="768" type="branch" />
            <wire x2="1440" y1="768" y2="768" x1="1376" />
            <wire x2="1584" y1="768" y2="768" x1="1440" />
        </branch>
        <bustap x2="1376" y1="944" y2="944" x1="1280" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="944" type="branch" />
            <wire x2="1440" y1="944" y2="944" x1="1376" />
            <wire x2="1584" y1="944" y2="944" x1="1440" />
        </branch>
        <bustap x2="1376" y1="1136" y2="1136" x1="1280" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1136" type="branch" />
            <wire x2="1440" y1="1136" y2="1136" x1="1376" />
            <wire x2="1584" y1="1136" y2="1136" x1="1440" />
        </branch>
        <bustap x2="1376" y1="1312" y2="1312" x1="1280" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1312" type="branch" />
            <wire x2="1440" y1="1312" y2="1312" x1="1376" />
            <wire x2="1584" y1="1312" y2="1312" x1="1440" />
        </branch>
        <bustap x2="1376" y1="1488" y2="1488" x1="1280" />
        <branch name="B(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1488" type="branch" />
            <wire x2="1440" y1="1488" y2="1488" x1="1376" />
            <wire x2="1584" y1="1488" y2="1488" x1="1440" />
        </branch>
        <bustap x2="1376" y1="1664" y2="1664" x1="1280" />
        <branch name="B(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1664" type="branch" />
            <wire x2="1440" y1="1664" y2="1664" x1="1376" />
            <wire x2="1584" y1="1664" y2="1664" x1="1440" />
        </branch>
        <bustap x2="1376" y1="1856" y2="1856" x1="1280" />
        <branch name="B(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="1856" type="branch" />
            <wire x2="1440" y1="1856" y2="1856" x1="1376" />
            <wire x2="1584" y1="1856" y2="1856" x1="1440" />
        </branch>
        <bustap x2="1376" y1="2032" y2="2032" x1="1280" />
        <branch name="B(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1440" y="2032" type="branch" />
            <wire x2="1440" y1="2032" y2="2032" x1="1376" />
            <wire x2="1584" y1="2032" y2="2032" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1072" y="688" name="A(7:0)" orien="R180" />
        <iomarker fontsize="28" x="1072" y="752" name="B(7:0)" orien="R180" />
    </sheet>
</drawing>