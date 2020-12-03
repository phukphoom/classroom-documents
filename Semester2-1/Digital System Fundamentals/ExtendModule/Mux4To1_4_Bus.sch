<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="S(1)" />
        <signal name="S(0)" />
        <signal name="S(1:0)" />
        <signal name="O(3:0)" />
        <signal name="O(0)" />
        <signal name="O(1)" />
        <signal name="O(2)" />
        <signal name="O(3)" />
        <signal name="A(3:0)" />
        <signal name="A(0)" />
        <signal name="A(1)" />
        <signal name="A(2)" />
        <signal name="A(3)" />
        <signal name="B(3:0)" />
        <signal name="B(0)" />
        <signal name="B(1)" />
        <signal name="B(2)" />
        <signal name="B(3)" />
        <signal name="C(3:0)" />
        <signal name="C(0)" />
        <signal name="C(1)" />
        <signal name="C(2)" />
        <signal name="C(3)" />
        <signal name="D(3:0)" />
        <signal name="D(0)" />
        <signal name="D(1)" />
        <signal name="D(2)" />
        <signal name="D(3)" />
        <port polarity="Input" name="S(1:0)" />
        <port polarity="Output" name="O(3:0)" />
        <port polarity="Input" name="A(3:0)" />
        <port polarity="Input" name="B(3:0)" />
        <port polarity="Input" name="C(3:0)" />
        <port polarity="Input" name="D(3:0)" />
        <blockdef name="m4_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-320" y2="-320" x1="320" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="176" />
            <line x2="176" y1="-208" y2="-96" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="224" />
            <line x2="224" y1="-216" y2="-32" x1="224" />
            <line x2="96" y1="-224" y2="-192" x1="256" />
            <line x2="256" y1="-416" y2="-224" x1="256" />
            <line x2="256" y1="-448" y2="-416" x1="96" />
            <line x2="96" y1="-192" y2="-448" x1="96" />
            <line x2="96" y1="-160" y2="-160" x1="128" />
            <line x2="128" y1="-200" y2="-160" x1="128" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="m4_1e" name="XLXI_1">
            <blockpin signalname="A(3)" name="D0" />
            <blockpin signalname="B(3)" name="D1" />
            <blockpin signalname="C(3)" name="D2" />
            <blockpin signalname="D(3)" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="m4_1e" name="XLXI_2">
            <blockpin signalname="A(2)" name="D0" />
            <blockpin signalname="B(2)" name="D1" />
            <blockpin signalname="C(2)" name="D2" />
            <blockpin signalname="D(2)" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="m4_1e" name="XLXI_3">
            <blockpin signalname="A(1)" name="D0" />
            <blockpin signalname="B(1)" name="D1" />
            <blockpin signalname="C(1)" name="D2" />
            <blockpin signalname="D(1)" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="m4_1e" name="XLXI_4">
            <blockpin signalname="A(0)" name="D0" />
            <blockpin signalname="B(0)" name="D1" />
            <blockpin signalname="C(0)" name="D2" />
            <blockpin signalname="D(0)" name="D3" />
            <blockpin signalname="XLXN_1" name="E" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
            <blockpin signalname="O(0)" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_23">
            <blockpin signalname="XLXN_1" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1680" y="2240" name="XLXI_1" orien="R0" />
        <instance x="1680" y="1712" name="XLXI_2" orien="R0" />
        <instance x="1680" y="1168" name="XLXI_3" orien="R0" />
        <instance x="1680" y="624" name="XLXI_4" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1680" y1="592" y2="592" x1="1568" />
            <wire x2="1568" y1="592" y2="1136" x1="1568" />
            <wire x2="1680" y1="1136" y2="1136" x1="1568" />
            <wire x2="1568" y1="1136" y2="1680" x1="1568" />
            <wire x2="1680" y1="1680" y2="1680" x1="1568" />
            <wire x2="1568" y1="1680" y2="2208" x1="1568" />
            <wire x2="1680" y1="2208" y2="2208" x1="1568" />
            <wire x2="1568" y1="2208" y2="2416" x1="1568" />
        </branch>
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="2304" type="branch" />
            <wire x2="1344" y1="2304" y2="2304" x1="1296" />
            <wire x2="1392" y1="2304" y2="2304" x1="1344" />
            <wire x2="1680" y1="464" y2="464" x1="1392" />
            <wire x2="1392" y1="464" y2="1008" x1="1392" />
            <wire x2="1680" y1="1008" y2="1008" x1="1392" />
            <wire x2="1392" y1="1008" y2="1552" x1="1392" />
            <wire x2="1680" y1="1552" y2="1552" x1="1392" />
            <wire x2="1392" y1="1552" y2="2080" x1="1392" />
            <wire x2="1680" y1="2080" y2="2080" x1="1392" />
            <wire x2="1392" y1="2080" y2="2304" x1="1392" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1344" y="2384" type="branch" />
            <wire x2="1344" y1="2384" y2="2384" x1="1296" />
            <wire x2="1456" y1="2384" y2="2384" x1="1344" />
            <wire x2="1680" y1="528" y2="528" x1="1456" />
            <wire x2="1456" y1="528" y2="1072" x1="1456" />
            <wire x2="1680" y1="1072" y2="1072" x1="1456" />
            <wire x2="1456" y1="1072" y2="1616" x1="1456" />
            <wire x2="1680" y1="1616" y2="1616" x1="1456" />
            <wire x2="1456" y1="1616" y2="2144" x1="1456" />
            <wire x2="1680" y1="2144" y2="2144" x1="1456" />
            <wire x2="1456" y1="2144" y2="2384" x1="1456" />
        </branch>
        <branch name="S(1:0)">
            <wire x2="1200" y1="2480" y2="2480" x1="1072" />
            <wire x2="1200" y1="2304" y2="2384" x1="1200" />
            <wire x2="1200" y1="2384" y2="2480" x1="1200" />
        </branch>
        <bustap x2="1296" y1="2304" y2="2304" x1="1200" />
        <bustap x2="1296" y1="2384" y2="2384" x1="1200" />
        <iomarker fontsize="28" x="1072" y="2480" name="S(1:0)" orien="R180" />
        <instance x="1632" y="2416" name="XLXI_23" orien="R180" />
        <branch name="O(3:0)">
            <wire x2="2432" y1="224" y2="224" x1="2240" />
            <wire x2="2240" y1="224" y2="304" x1="2240" />
            <wire x2="2240" y1="304" y2="848" x1="2240" />
            <wire x2="2240" y1="848" y2="1392" x1="2240" />
            <wire x2="2240" y1="1392" y2="1920" x1="2240" />
        </branch>
        <bustap x2="2144" y1="304" y2="304" x1="2240" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="304" type="branch" />
            <wire x2="2080" y1="304" y2="304" x1="2000" />
            <wire x2="2144" y1="304" y2="304" x1="2080" />
        </branch>
        <bustap x2="2144" y1="848" y2="848" x1="2240" />
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="848" type="branch" />
            <wire x2="2080" y1="848" y2="848" x1="2000" />
            <wire x2="2144" y1="848" y2="848" x1="2080" />
        </branch>
        <bustap x2="2144" y1="1392" y2="1392" x1="2240" />
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1392" type="branch" />
            <wire x2="2080" y1="1392" y2="1392" x1="2000" />
            <wire x2="2144" y1="1392" y2="1392" x1="2080" />
        </branch>
        <bustap x2="2144" y1="1920" y2="1920" x1="2240" />
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1920" type="branch" />
            <wire x2="2080" y1="1920" y2="1920" x1="2000" />
            <wire x2="2144" y1="1920" y2="1920" x1="2080" />
        </branch>
        <branch name="A(3:0)">
            <wire x2="448" y1="192" y2="192" x1="368" />
            <wire x2="448" y1="192" y2="208" x1="448" />
            <wire x2="448" y1="208" y2="752" x1="448" />
            <wire x2="448" y1="752" y2="1296" x1="448" />
            <wire x2="448" y1="1296" y2="1824" x1="448" />
        </branch>
        <bustap x2="544" y1="208" y2="208" x1="448" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="208" type="branch" />
            <wire x2="960" y1="208" y2="208" x1="544" />
            <wire x2="1680" y1="208" y2="208" x1="960" />
        </branch>
        <bustap x2="544" y1="752" y2="752" x1="448" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="752" type="branch" />
            <wire x2="960" y1="752" y2="752" x1="544" />
            <wire x2="1680" y1="752" y2="752" x1="960" />
        </branch>
        <bustap x2="544" y1="1296" y2="1296" x1="448" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1296" type="branch" />
            <wire x2="960" y1="1296" y2="1296" x1="544" />
            <wire x2="1680" y1="1296" y2="1296" x1="960" />
        </branch>
        <bustap x2="544" y1="1824" y2="1824" x1="448" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1824" type="branch" />
            <wire x2="960" y1="1824" y2="1824" x1="544" />
            <wire x2="1680" y1="1824" y2="1824" x1="960" />
        </branch>
        <iomarker fontsize="28" x="2432" y="224" name="O(3:0)" orien="R0" />
        <branch name="B(3:0)">
            <wire x2="560" y1="256" y2="256" x1="368" />
            <wire x2="560" y1="256" y2="272" x1="560" />
            <wire x2="560" y1="272" y2="816" x1="560" />
            <wire x2="560" y1="816" y2="1360" x1="560" />
            <wire x2="560" y1="1360" y2="1888" x1="560" />
        </branch>
        <bustap x2="656" y1="272" y2="272" x1="560" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="272" type="branch" />
            <wire x2="960" y1="272" y2="272" x1="656" />
            <wire x2="1680" y1="272" y2="272" x1="960" />
        </branch>
        <bustap x2="656" y1="816" y2="816" x1="560" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="816" type="branch" />
            <wire x2="960" y1="816" y2="816" x1="656" />
            <wire x2="1680" y1="816" y2="816" x1="960" />
        </branch>
        <bustap x2="656" y1="1360" y2="1360" x1="560" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1360" type="branch" />
            <wire x2="960" y1="1360" y2="1360" x1="656" />
            <wire x2="1680" y1="1360" y2="1360" x1="960" />
        </branch>
        <bustap x2="656" y1="1888" y2="1888" x1="560" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1888" type="branch" />
            <wire x2="960" y1="1888" y2="1888" x1="656" />
            <wire x2="1680" y1="1888" y2="1888" x1="960" />
        </branch>
        <branch name="C(3:0)">
            <wire x2="672" y1="320" y2="320" x1="368" />
            <wire x2="672" y1="320" y2="336" x1="672" />
            <wire x2="672" y1="336" y2="880" x1="672" />
            <wire x2="672" y1="880" y2="1424" x1="672" />
            <wire x2="672" y1="1424" y2="1952" x1="672" />
        </branch>
        <bustap x2="768" y1="336" y2="336" x1="672" />
        <branch name="C(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="336" type="branch" />
            <wire x2="960" y1="336" y2="336" x1="768" />
            <wire x2="1680" y1="336" y2="336" x1="960" />
        </branch>
        <bustap x2="768" y1="880" y2="880" x1="672" />
        <branch name="C(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="880" type="branch" />
            <wire x2="960" y1="880" y2="880" x1="768" />
            <wire x2="1680" y1="880" y2="880" x1="960" />
        </branch>
        <bustap x2="768" y1="1424" y2="1424" x1="672" />
        <branch name="C(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1424" type="branch" />
            <wire x2="960" y1="1424" y2="1424" x1="768" />
            <wire x2="1680" y1="1424" y2="1424" x1="960" />
        </branch>
        <bustap x2="768" y1="1952" y2="1952" x1="672" />
        <branch name="C(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1952" type="branch" />
            <wire x2="960" y1="1952" y2="1952" x1="768" />
            <wire x2="1680" y1="1952" y2="1952" x1="960" />
        </branch>
        <branch name="D(3:0)">
            <wire x2="784" y1="384" y2="384" x1="368" />
            <wire x2="784" y1="384" y2="400" x1="784" />
            <wire x2="784" y1="400" y2="944" x1="784" />
            <wire x2="784" y1="944" y2="1488" x1="784" />
            <wire x2="784" y1="1488" y2="2016" x1="784" />
        </branch>
        <bustap x2="880" y1="400" y2="400" x1="784" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="400" type="branch" />
            <wire x2="960" y1="400" y2="400" x1="880" />
            <wire x2="1680" y1="400" y2="400" x1="960" />
        </branch>
        <bustap x2="880" y1="944" y2="944" x1="784" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="944" type="branch" />
            <wire x2="960" y1="944" y2="944" x1="880" />
            <wire x2="1680" y1="944" y2="944" x1="960" />
        </branch>
        <bustap x2="880" y1="1488" y2="1488" x1="784" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="1488" type="branch" />
            <wire x2="960" y1="1488" y2="1488" x1="880" />
            <wire x2="1680" y1="1488" y2="1488" x1="960" />
        </branch>
        <bustap x2="880" y1="2016" y2="2016" x1="784" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="2016" type="branch" />
            <wire x2="960" y1="2016" y2="2016" x1="880" />
            <wire x2="1680" y1="2016" y2="2016" x1="960" />
        </branch>
        <iomarker fontsize="28" x="368" y="384" name="D(3:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="320" name="C(3:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="256" name="B(3:0)" orien="R180" />
        <iomarker fontsize="28" x="368" y="192" name="A(3:0)" orien="R180" />
    </sheet>
</drawing>