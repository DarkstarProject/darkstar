-------------------------------------------------
--
-- Regime Info Database
--
-- Stores details on the number of monsters to kill
-- as well as the suggested level range.
-- n1,n2,n3,n4 = Number of monsters needed
-- sl = Start Level range
-- s2 = End Level range
--
-- Example:
-- n1=6, n2=0, n3=0, n4=0, sl=1, el=6, Regime ID=1, produces:
-- Defeat the following monsters:
--  6 Worms
--  Level range 1 ~ 6
--  Area: West Ronfaure
-------------------------------------------------

function getRegimeInfo(regimeid)
    a = {};
    if (regimeid >= 1 and regimeid <= 146) then -- FoV (1~146)
        if (regimeid <= 50) then
            if (regimeid <= 10) then
                if (regimeid == 1) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=6;
                    return a;
                elseif (regimeid == 2) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=2;
                    a.el=6;
                    return a;
                elseif (regimeid == 3) then
                    a.n1=5;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=7;
                    return a;
                elseif (regimeid == 4) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=8;
                    return a;
                elseif (regimeid == 5) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=8;
                    a.el=12;
                    return a;
                elseif (regimeid == 6) then
                    a.n1=8;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=12;
                    a.el=13;
                    return a;
                elseif (regimeid == 7) then
                    a.n1=7;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=15;
                    a.el=19;
                    return a;
                elseif (regimeid == 8) then
                    a.n1=6;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=15;
                    a.el=22;
                    return a;
                elseif (regimeid == 9) then
                    a.n1=5;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=18;
                    a.el=23;
                    return a;
                elseif (regimeid == 10) then
                    a.n1=4;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=20;
                    a.el=23;
                    return a;
                end
            elseif (regimeid > 10 and regimeid <= 20) then
                if (regimeid == 11) then
                    a.n1=9;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=21;
                    a.el=22;
                    return a;
                elseif (regimeid == 12) then
                    a.n1=8;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=21;
                    a.el=23;
                    return a;
                elseif (regimeid == 13) then
                    a.n1=7;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=22;
                    a.el=25;
                    return a;
                elseif (regimeid == 14) then
                    a.n1=6;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=24;
                    a.el=25;
                    return a;
                elseif (regimeid == 15) then
                    a.n1=4;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=25;
                    a.el=28;
                    return a;
                elseif (regimeid == 16) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=6;
                    return a;
                elseif (regimeid == 17) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=6;
                    return a;
                elseif (regimeid == 18) then
                    a.n1=5;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=7;
                    return a;
                elseif (regimeid == 19) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=8;
                    return a;
                elseif (regimeid == 20) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=10;
                    a.el=12;
                    return a;
                end
            elseif (regimeid > 20 and regimeid <= 30) then
                if (regimeid == 21) then
                    a.n1=9;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=20;
                    a.el=21;
                    return a;
                elseif (regimeid == 22) then
                    a.n1=8;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=20;
                    a.el=22;
                    return a;
                elseif (regimeid == 23) then
                    a.n1=7;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=21;
                    a.el=23;
                    return a;
                elseif (regimeid == 24) then
                    a.n1=6;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=22;
                    a.el=25;
                    return a;
                elseif (regimeid == 25) then
                    a.n1=4;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=25;
                    a.el=28;
                    return a;
                elseif (regimeid == 26) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=5;
                    return a;
                elseif (regimeid == 27) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=2;
                    a.el=5;
                    return a;
                elseif (regimeid == 28) then
                    a.n1=5;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=8;
                    return a;
                elseif (regimeid == 29) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=8;
                    return a;
                elseif (regimeid == 30) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=7;
                    a.el=12;
                    return a;
                end
            elseif (regimeid > 30 and regimeid <= 40) then
                if (regimeid == 31) then
                    a.n1=8;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=11;
                    a.el=13;
                    return a;
                elseif (regimeid == 32) then
                    a.n1=7;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=15;
                    a.el=19;
                    return a;
                elseif (regimeid == 33) then
                    a.n1=6;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=15;
                    a.el=23;
                    return a;
                elseif (regimeid == 34) then
                    a.n1=5;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=20;
                    a.el=24;
                    return a;
                elseif (regimeid == 35) then
                    a.n1=4;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=21;
                    a.el=24;
                    return a;
                elseif (regimeid == 36) then
                    a.n1=9;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=20;
                    a.el=21;
                    return a;
                elseif (regimeid == 37) then
                    a.n1=8;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=20;
                    a.el=22;
                    return a;
                elseif (regimeid == 38) then
                    a.n1=7;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=21;
                    a.el=23;
                    return a;
                elseif (regimeid == 39) then
                    a.n1=6;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=22;
                    a.el=25;
                    return a;
                elseif (regimeid == 40) then
                    a.n1=4;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=25;
                    a.el=28;
                    return a;
                end
            else --Regime between 41-50
                if (regimeid == 41) then
                    a.n1=9;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=26;
                    a.el=29;
                    return a;
                elseif (regimeid == 42) then
                    a.n1=8;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=26;
                    a.el=29;
                    return a;
                elseif (regimeid == 43) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=28;
                    a.el=29;
                    return a;
                elseif (regimeid == 44) then
                    a.n1=6;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=28;
                    a.el=30;
                    return a;
                elseif (regimeid == 45) then
                    a.n1=5;
                    a.n2=4;
                    a.n3=1;
                    a.n4=0;
                    a.sl=28;
                    a.el=34;
                    return a;
                elseif (regimeid == 46) then
                    a.n1=9;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=34;
                    a.el=38;
                    return a;
                elseif (regimeid == 47) then
                    a.n1=8;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=34;
                    a.el=39;
                    return a;
                elseif (regimeid == 48) then
                    a.n1=7;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=37;
                    a.el=42;
                    return a;
                elseif (regimeid == 49) then
                    a.n1=6;
                    a.n2=4;
                    a.n3=1;
                    a.n4=0;
                    a.sl=37;
                    a.el=43;
                    return a;
                elseif (regimeid == 50) then
                    a.n1=5;
                    a.n2=4;
                    a.n3=2;
                    a.n4=0;
                    a.sl=40;
                    a.el=43;
                    return a;
                end
            end
        elseif (regimeid > 50 and regimeid <= 100) then
            if (regimeid > 50 and regimeid <= 60) then
                if (regimeid == 51) then
                    a.n1=9;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=42;
                    a.el=46;
                    return a;
                elseif (regimeid == 52) then
                    a.n1=8;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=42;
                    a.el=45;
                    return a;
                elseif (regimeid == 53) then
                    a.n1=7;
                    a.n2=4;
                    a.n3=1;
                    a.n4=0;
                    a.sl=42;
                    a.el=48;
                    return a;
                elseif (regimeid == 54) then
                    a.n1=6;
                    a.n2=4;
                    a.n3=2;
                    a.n4=0;
                    a.sl=42;
                    a.el=48;
                    return a;
                elseif (regimeid == 55) then
                    a.n1=5;
                    a.n2=4;
                    a.n3=3;
                    a.n4=0;
                    a.sl=45;
                    a.el=52;
                    return a;
                elseif (regimeid == 56) then
                    a.n1=6;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=8;
                    return a;
                elseif (regimeid == 57) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=22;
                    a.el=25;
                    return a;
                elseif (regimeid == 58) then
                    a.n1=8;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=15;
                    a.el=18;
                    return a;
                elseif (regimeid == 59) then
                    a.n1=3;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=8;
                    return a;
                elseif (regimeid == 60) then
                    a.n1=5;
                    a.n2=4;
                    a.n3=1;
                    a.n4=0;
                    a.sl=22;
                    a.el=25;
                    return a;
                end
            elseif (regimeid > 60 and regimeid <= 70) then
                if (regimeid == 61) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=8;
                    return a;
                elseif (regimeid == 62) then
                    a.n1=4;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=22;
                    a.el=27;
                    return a;
                elseif (regimeid == 63) then
                    a.n1=3;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=25;
                    a.el=27;
                    return a;
                elseif (regimeid == 64) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=5;
                    return a;
                elseif (regimeid == 65) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=2;
                    a.el=5;
                    return a;
                elseif (regimeid == 66) then
                    a.n1=7;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=2;
                    a.el=6;
                    return a;
                elseif (regimeid == 67) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=6;
                    return a;
                elseif (regimeid == 68) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=8;
                    return a;
                elseif (regimeid == 69) then
                    a.n1=3;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=11;
                    a.el=13;
                    return a;
                elseif (regimeid == 70) then
                    a.n1=5;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=11;
                    a.el=14;
                    return a;
                end
            elseif (regimeid > 70 and regimeid <= 80) then
                if (regimeid == 71) then
                    a.n1=5;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=10;
                    a.el=15;
                    return a;
                elseif (regimeid == 72) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=23;
                    a.el=26;
                    return a;
                elseif (regimeid == 73) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=23;
                    a.el=28;
                    return a;
                elseif (regimeid == 74) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=2;
                    a.n4=0;
                    a.sl=26;
                    a.el=32;
                    return a;
                elseif (regimeid == 75) then
                    a.n1=9;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=31;
                    a.el=32;
                    return a;
                elseif (regimeid == 76) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=6;
                    return a;
                elseif (regimeid == 77) then
                    a.n1=7;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=2;
                    a.el=5;
                    return a;
                elseif (regimeid == 78) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=6;
                    return a;
                elseif (regimeid == 79) then
                    a.n1=7;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=6;
                    return a;
                elseif (regimeid == 80) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=4;
                    a.el=8;
                    return a;
                end
            elseif (regimeid > 80 and regimeid <= 90) then
                if (regimeid == 81) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=8;
                    a.el=11;
                    return a;
                elseif (regimeid == 82) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=9;
                    a.el=12;
                    return a;
                elseif (regimeid == 83) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=9;
                    a.el=15;
                    return a;
                elseif (regimeid == 84) then
                    a.n1=2;
                    a.n2=2;
                    a.n3=2;
                    a.n4=0;
                    a.sl=12;
                    a.el=14;
                    return a;
                elseif (regimeid == 85) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=25;
                    a.el=26;
                    return a;
                elseif (regimeid == 86) then
                    a.n1=6;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=26;
                    a.el=32;
                    return a;
                elseif (regimeid == 87) then
                    a.n1=6;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=27;
                    a.el=33;
                    return a;
                elseif (regimeid == 88) then
                    a.n1=5;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=36;
                    a.el=37;
                    return a;
                elseif (regimeid == 89) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=6;
                    return a;
                elseif (regimeid == 90) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=1;
                    a.el=8;
                    return a;
                end
            else --Regime 91-100
                if (regimeid == 91) then
                    a.n1=6;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=2;
                    a.el=6;
                    return a;
                elseif (regimeid == 92) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=6;
                    return a;
                elseif (regimeid == 93) then
                    a.n1=4;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=3;
                    a.el=6;
                    return a;
                elseif (regimeid == 94) then
                    a.n1=4;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=7;
                    a.el=11;
                    return a;
                elseif (regimeid == 95) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=8;
                    a.el=12;
                    return a;
                elseif (regimeid == 96) then
                    a.n1=3;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=12;
                    a.el=16;
                    return a;
                elseif (regimeid == 97) then
                    a.n1=4;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=26;
                    a.el=32;
                    return a;
                elseif (regimeid == 98) then
                    a.n1=2;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=26;
                    a.el=34;
                    return a;
                elseif (regimeid == 99) then
                    a.n1=3;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=27;
                    a.el=33;
                    return a;
                elseif (regimeid == 100) then
                    a.n1=5;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=36;
                    a.el=38;
                    return a;
                end
            end
        elseif (regimeid > 100 and regimeid <= 146) then
            if (regimeid > 100 and regimeid <= 110) then
                if (regimeid == 101) then
                    a.n1=3;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=41;
                    a.el=44;
                    return a;
                elseif (regimeid == 102) then
                    a.n1=3;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=41;
                    a.el=46;
                    return a;
                elseif (regimeid == 103) then
                    a.n1=3;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=43;
                    a.el=47;
                    return a;
                elseif (regimeid == 104) then
                    a.n1=4;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=62;
                    a.el=66;
                    return a;
                elseif (regimeid == 105) then
                    a.n1=4;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=64;
                    a.el=68;
                    return a;
                elseif (regimeid == 106) then
                    a.n1=4;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=64;
                    a.el=69;
                    return a;
                elseif (regimeid == 107) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=66;
                    a.el=74;
                    return a;
                elseif (regimeid == 108) then
                    a.n1=4;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=71;
                    a.el=79;
                    return a;
                elseif (regimeid == 109) then
                    a.n1=10;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=30;
                    a.el=34;
                    return a;
                elseif (regimeid == 110) then
                    a.n1=3;
                    a.n2=1;
                    a.n3=7;
                    a.n4=0;
                    a.sl=35;
                    a.el=40;
                    return a;
                end
            elseif (regimeid > 110 and regimeid <= 120) then
                if (regimeid == 111) then
                    a.n1=3;
                    a.n2=1;
                    a.n3=7;
                    a.n4=0;
                    a.sl=35;
                    a.el=44;
                    return a;
                elseif (regimeid == 112) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=2;
                    a.n4=1;
                    a.sl=44;
                    a.el=49;
                    return a;
                elseif (regimeid == 113) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=2;
                    a.n4=1;
                    a.sl=45;
                    a.el=49;
                    return a;
                elseif (regimeid == 114) then
                    a.n1=7;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=40;
                    a.el=44;
                    return a;
                elseif (regimeid == 115) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=41;
                    a.el=46;
                    return a;
                elseif (regimeid == 116) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=41;
                    a.el=46;
                    return a;
                elseif (regimeid == 117) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=42;
                    a.el=47;
                    return a;
                elseif (regimeid == 118) then
                    a.n1=3;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=44;
                    a.el=50;
                    return a;
                elseif (regimeid == 119) then
                    a.n1=3;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=60;
                    a.el=65;
                    return a;
                elseif (regimeid == 120) then
                    a.n1=7;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=64;
                    a.el=69;
                    return a;
                end
            elseif (regimeid > 120 and regimeid <= 130) then
                if (regimeid == 121) then
                    a.n1=7;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=65;
                    a.el=69;
                    return a;
                elseif (regimeid == 122) then
                    a.n1=6;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=78;
                    a.el=82;
                    return a;
                elseif (regimeid == 123) then
                    a.n1=6;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=79;
                    a.el=82;
                    return a;
                elseif (regimeid == 124) then
                    a.n1=4;
                    a.n2=5;
                    a.n3=0;
                    a.n4=0;
                    a.sl=30;
                    a.el=35;
                    return a;
                elseif (regimeid == 125) then
                    a.n1=7;
                    a.n2=4;
                    a.n3=0;
                    a.n4=0;
                    a.sl=32;
                    a.el=37;
                    return a;
                elseif (regimeid == 126) then
                    a.n1=10;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=34;
                    a.el=36;
                    return a;
                elseif (regimeid == 127) then
                    a.n1=4;
                    a.n2=6;
                    a.n3=0;
                    a.n4=0;
                    a.sl=34;
                    a.el=38;
                    return a;
                elseif (regimeid == 128) then
                    a.n1=4;
                    a.n2=6;
                    a.n3=0;
                    a.n4=0;
                    a.sl=34;
                    a.el=41;
                    return a;
                elseif (regimeid == 129) then
                    a.n1=3;
                    a.n2=6;
                    a.n3=0;
                    a.n4=0;
                    a.sl=35;
                    a.el=39;
                    return a;
                elseif (regimeid == 130) then
                    a.n1=3;
                    a.n2=6;
                    a.n3=0;
                    a.n4=0;
                    a.sl=35;
                    a.el=40;
                    return a;
                end
            elseif (regimeid > 130 and regimeid <= 140) then
                if (regimeid == 131) then
                    a.n1=10;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=40;
                    a.el=44;
                    return a;
                elseif (regimeid == 132) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=40;
                    a.el=46;
                    return a;
                elseif (regimeid == 133) then
                    a.n1=10;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=45;
                    a.el=49;
                    return a;
                elseif (regimeid == 134) then
                    a.n1=7;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=40;
                    a.el=45;
                    return a;
                elseif (regimeid == 135) then
                    a.n1=5;
                    a.n2=1;
                    a.n3=4;
                    a.n4=0;
                    a.sl=44;
                    a.el=49;
                    return a;
                elseif (regimeid == 136) then
                    a.n1=10;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=47;
                    a.el=53;
                    return a;
                elseif (regimeid == 137) then
                    a.n1=2;
                    a.n2=8;
                    a.n3=0;
                    a.n4=0;
                    a.sl=51;
                    a.el=56;
                    return a;
                elseif (regimeid == 138) then
                    a.n1=4;
                    a.n2=6;
                    a.n3=0;
                    a.n4=0;
                    a.sl=54;
                    a.el=58;
                    return a;
                elseif (regimeid == 139) then
                    a.n1=5;
                    a.n2=2;
                    a.n3=0;
                    a.n4=0;
                    a.sl=66;
                    a.el=72;
                    return a;
                elseif (regimeid == 140) then
                    a.n1=5;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=66;
                    a.el=74;
                    return a;
                end
            else --Regime 140-146
                if (regimeid == 141) then
                    a.n1=4;
                    a.n2=1;
                    a.n3=0;
                    a.n4=0;
                    a.sl=69;
                    a.el=74;
                    return a;
                elseif (regimeid == 142) then
                    a.n1=8;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=72;
                    a.el=76;
                    return a;
                elseif (regimeid == 143) then
                    a.n1=8;
                    a.n2=3;
                    a.n3=0;
                    a.n4=0;
                    a.sl=73;
                    a.el=78;
                    return a;
                elseif (regimeid == 144) then
                    a.n1=11;
                    a.n2=0;
                    a.n3=0;
                    a.n4=0;
                    a.sl=75;
                    a.el=78;
                    return a;
                elseif (regimeid == 145) then
                    a.n1=2;
                    a.n2=2;
                    a.n3=2;
                    a.n4=0;
                    a.sl=78;
                    a.el=79;
                    return a;
                elseif (regimeid == 146) then
                    a.n1=2;
                    a.n2=2;
                    a.n3=2;
                    a.n4=0;
                    a.sl=78;
                    a.el=79;
                    return a;
                end
            end
        end
-- ---------------------------------------------------------
-- This space reserved for Hunt Registry (147~559) if needed.
-- I know they prevent FoV/GoV page sign-up and FoV/GoV prevent registry.
-- Need confirmation of retail behavior - Do they display in menu?
-- ---------------------------------------------------------
-- This space reserved for Dominion OPs (560~601) if needed.
-- I'm pretty sure you can have an active page and OP at same time.
-- They might still display on the review option though.
-- ---------------------------------------------------------
    elseif (regimeid >= 602 and regimeid <= 819) then -- GoV (602~819)
        if (regimeid >= 602 and regimeid <= 651) then
            if (regimeid >= 602 and regimeid <= 611) then
                if (regimeid == 602) then
                    a.n1 = 4;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 3;
                    a.el = 5;
                    return a;
                elseif (regimeid == 603) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 25;
                    a.el = 30;
                    return a;
                elseif (regimeid == 604) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 26;
                    a.el = 30;
                    return a;
                elseif (regimeid == 605) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 26;
                    a.el = 30;
                    return a;
                elseif (regimeid == 606) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 30;
                    a.el = 34;
                    return a;
                elseif (regimeid == 607) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 87;
                    a.el = 92;
                    return a;
                elseif (regimeid == 608 or regimeid == 609) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 88;
                    a.el = 90;
                    return a;
                elseif (regimeid == 610) then
                    a.n1 = 5;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 52;
                    a.el = 54;
                    return a;
                elseif (regimeid == 611) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 52;
                    a.el = 59;
                    return a;
                end
            elseif (regimeid > 611 and regimeid <= 621) then
                if (regimeid == 612) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 56;
                    a.el = 63;
                    return a;
                elseif (regimeid == 613) then
                    a.n1 = 9;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 65;
                    a.el = 68;
                    return a;
                elseif (regimeid == 614) then
                    a.n1 = 6;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 94;
                    a.el = 97;
                    return a;
                elseif (regimeid == 615) then
                    a.n1 = 6;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 97;
                    return a;
                elseif (regimeid == 616) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 96;
                    a.el = 97;
                    return a;
                elseif (regimeid == 617) then
                    a.n1 = 2;
                    a.n2 = 5;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 99;
                    return a;
                elseif (regimeid == 618) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 47;
                    a.el = 52;
                    return a;
                elseif (regimeid == 619) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 52;
                    a.el = 57;
                    return a;
                elseif (regimeid == 620) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 53;
                    a.el = 57;
                    return a;
                elseif (regimeid == 621) then
                    a.n1 = 3;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 65;
                    return a;
                end
            elseif (regimeid > 621 and regimeid <= 631) then
                if (regimeid == 622) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 97;
                    return a;
                elseif (regimeid == 623) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 98;
                    return a;
                elseif (regimeid == 624) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 96;
                    a.el = 98;
                    return a;
                elseif (regimeid == 625) then
                    a.n1 = 8;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 94;
                    a.el = 99;
                    return a;
                elseif (regimeid == 626) then
                    a.n1 = 3;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 1;
                    a.el = 3;
                    return a;
                elseif (regimeid == 627) then
                    a.n1 = 3;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 2;
                    a.el = 4;
                    return a;
                elseif (regimeid == 628) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 78;
                    return a;
                elseif (regimeid == 629) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 79;
                    return a;
                elseif (regimeid == 630) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 80;
                    return a;
                elseif (regimeid == 631) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 3;
                    a.el = 8;
                    return a;
                end
            elseif (regimeid > 631 and regimeid <= 641) then
                if (regimeid == 632) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 5;
                    a.el = 11;
                    return a;
                elseif (regimeid == 633) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 12;
                    a.el = 16;
                    return a;
                elseif (regimeid == 634) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 14;
                    a.el = 17;
                    return a;
                elseif (regimeid == 635) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 21;
                    a.el = 23;
                    return a;
                elseif (regimeid == 636) then
                    a.n1 = 6;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 78;
                    a.el = 80;
                    return a;
                elseif (regimeid == 637) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 77;
                    a.el = 80;
                    return a;
                elseif (regimeid == 638) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 80;
                    a.el = 83;
                    return a;
                elseif (regimeid == 639) then
                    a.n1 = 4;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 3;
                    a.el = 8;
                    return a;
                elseif (regimeid == 640) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 5;
                    a.el = 9;
                    return a;
                elseif (regimeid == 641) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 11;
                    a.el = 14;
                    return a;
                end
            else -- 642-651
                if (regimeid == 642) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 86;
                    a.el = 89;
                    return a;
                elseif (regimeid == 643) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 86;
                    a.el = 90;
                    return a;
                elseif (regimeid == 644) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 86;
                    a.el = 90;
                    return a;
                elseif (regimeid == 645) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 90;
                    a.el = 91;
                    return a;
                elseif (regimeid == 646) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 90;
                    a.el = 93;
                    return a;
                elseif (regimeid == 647) then
                    a.n1 = 2;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 1;
                    a.el = 6;
                    return a;
                elseif (regimeid == 648) then
                    a.n1 = 2;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 1;
                    a.el = 7;
                    return a;
                elseif (regimeid == 649) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 15;
                    a.el = 20;
                    return a;
                elseif (regimeid == 650) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 22;
                    a.el = 26;
                    return a;
                elseif (regimeid == 651) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 78;
                    a.el = 82;
                    return a;
                end
            end
        elseif (regimeid > 651 and regimeid <= 701) then
            if (regimeid > 651 and regimeid <= 661) then
                if (regimeid == 652) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 79;
                    a.el = 82;
                    return a;
                elseif (regimeid == 653) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 81;
                    a.el = 83;
                    return a;
                elseif (regimeid == 654) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 81;
                    a.el = 84;
                    return a;
                elseif (regimeid == 655) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 18;
                    a.el = 21;
                    return a;
                elseif (regimeid == 656) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 21;
                    a.el = 27;
                    return a;
                elseif (regimeid == 657) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 17;
                    a.el = 26;
                    return a;
                elseif (regimeid == 658) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 23;
                    a.el = 26;
                    return a;
                elseif (regimeid == 659) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 26;
                    a.el = 28;
                    return a;
                elseif (regimeid == 660) then
                    a.n1 = 4;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 29;
                    a.el = 34;
                    return a;
                elseif (regimeid == 661) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 84;
                    a.el = 86;
                    return a;
                end
            elseif (regimeid > 661 and regimeid <= 671) then
                if (regimeid == 662) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 86;
                    a.el = 88;
                    return a;
                elseif (regimeid == 663) then
                    a.n1 = 1;
                    a.n2 = 1;
                    a.n3 = 1;
                    a.n4 = 1;
                    a.sl = 10;
                    a.el = 14;
                    return a;
                elseif (regimeid == 664) then
                    a.n1 = 1;
                    a.n2 = 1;
                    a.n3 = 1;
                    a.n4 = 1;
                    a.sl = 15;
                    a.el = 19;
                    return a;
                elseif (regimeid == 665) then
                    a.n1 = 1;
                    a.n2 = 1;
                    a.n3 = 1;
                    a.n4 = 1;
                    a.sl = 20;
                    a.el = 24;
                    return a;
                elseif (regimeid == 666) then
                    a.n1 = 1;
                    a.n2 = 1;
                    a.n3 = 1;
                    a.n4 = 1;
                    a.sl = 25;
                    a.el = 29;
                    return a;
                elseif (regimeid == 667) then
                    a.n1 = 1;
                    a.n2 = 1;
                    a.n3 = 1;
                    a.n4 = 1;
                    a.sl = 30;
                    a.el = 34;
                    return a;
                elseif (regimeid == 668) then
                    a.n1 = 1;
                    a.n2 = 1;
                    a.n3 = 1;
                    a.n4 = 1;
                    a.sl = 35;
                    a.el = 39;
                    return a;
                elseif (regimeid == 669) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 81;
                    a.el = 85;
                    return a;
                elseif (regimeid == 670) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 82;
                    a.el = 85;
                    return a;
                elseif (regimeid == 671) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 42;
                    a.el = 46;
                    return a;
                end
            elseif (regimeid > 671 and regimeid <= 681) then
                if (regimeid == 672) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 46;
                    a.el = 49;
                    return a;
                elseif (regimeid == 673) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 54;
                    return a;
                elseif (regimeid == 674) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 55;
                    return a;
                elseif (regimeid == 675) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 53;
                    a.el = 56;
                    return a;
                elseif (regimeid == 676) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 63;
                    return a;
                elseif (regimeid == 677) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 91;
                    a.el = 95;
                    return a;
                elseif (regimeid == 678) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 91;
                    a.el = 95;
                    return a;
                elseif (regimeid == 679) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 20;
                    a.el = 27;
                    return a;
                elseif (regimeid == 680) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 20;
                    a.el = 24;
                    return a;
                elseif (regimeid == 681) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 21;
                    a.el = 26;
                    return a;
                end
            elseif (regimeid > 681 and regimeid <= 691) then
                if (regimeid == 682) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 28;
                    a.el = 31;
                    return a;
                elseif (regimeid == 683) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 30;
                    a.el = 34;
                    return a;
                elseif (regimeid == 684) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 32;
                    a.el = 36;
                    return a;
                elseif (regimeid == 685) then
                    a.n1 = 2;
                    a.n2 = 5;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 85;
                    a.el = 87;
                    return a;
                elseif (regimeid == 686) then
                    a.n1 = 2;
                    a.n2 = 5;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 85;
                    a.el = 89;
                    return a;
                elseif (regimeid == 687) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 40;
                    a.el = 44;
                    return a;
                elseif (regimeid == 688) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 45;
                    a.el = 49;
                    return a;
                elseif (regimeid == 689) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 49;
                    a.el = 52;
                    return a;
                elseif (regimeid == 690) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 54;
                    return a;
                elseif (regimeid == 691) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 53;
                    a.el = 58;
                    return a;
                end
            else -- 691-701
                if (regimeid == 692) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 59;
                    a.el = 63;
                    return a;
                elseif (regimeid == 693) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 91;
                    a.el = 93;
                    return a;
                elseif (regimeid == 694) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 92;
                    a.el = 96;
                    return a;
                elseif (regimeid == 695) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 15;
                    a.el = 18;
                    return a;
                elseif (regimeid == 696) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 18;
                    a.el = 23;
                    return a;
                elseif (regimeid == 697) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 22;
                    a.el = 26;
                    return a;
                elseif (regimeid == 698) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 26;
                    a.el = 31;
                    return a;
                elseif (regimeid == 699) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 26;
                    a.el = 31;
                    return a;
                elseif (regimeid == 700) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 27;
                    a.el = 33;
                    return a;
                elseif (regimeid == 701) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 83;
                    a.el = 85;
                    return a;
                end
            end
        elseif (regimeid > 701 and regimeid <= 751) then
            if (regimeid > 701 and regimeid <= 711) then
                if (regimeid == 702) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 86;
                    a.el = 88;
                    return a;
                elseif (regimeid == 703) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 40;
                    a.el = 43;
                    return a;
                elseif (regimeid == 704) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 40;
                    a.el = 44;
                    return a;
                elseif (regimeid == 705) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 46;
                    a.el = 49;
                    return a;
                elseif (regimeid == 706) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 55;
                    return a;
                elseif (regimeid == 707) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 52;
                    a.el = 58;
                    return a;
                elseif (regimeid == 708) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 1;
                    a.n4 = 0;
                    a.sl = 59;
                    a.el = 62;
                    return a;
                elseif (regimeid == 709) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 91;
                    a.el = 96;
                    return a;
                elseif (regimeid == 710) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 92;
                    a.el = 96;
                    return a;
                elseif (regimeid == 711) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 40;
                    a.el = 43;
                    return a;
                end
            elseif (regimeid > 711 and regimeid <= 721) then
                if (regimeid == 712) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 43;
                    a.el = 46;
                    return a;
                elseif (regimeid == 713) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 55;
                    return a;
                elseif (regimeid == 714) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 56;
                    return a;
                elseif (regimeid == 715) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 58;
                    return a;
                elseif (regimeid == 716) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 59;
                    a.el = 63;
                    return a;
                elseif (regimeid == 717) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 99;
                    return a;
                elseif (regimeid == 718) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 99;
                    return a;
                elseif (regimeid == 719) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 63;
                    return a;
                elseif (regimeid == 720) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 66;
                    return a;
                elseif (regimeid == 721) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 67;
                    return a;
                end
            elseif (regimeid > 721 and regimeid <= 731) then
                if (regimeid == 722) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 72;
                    a.el = 75;
                    return a;
                elseif (regimeid == 723) then
                    a.n1 = 3;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 72;
                    a.el = 76;
                    return a;
                elseif (regimeid == 724) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 72;
                    a.el = 78;
                    return a;
                elseif (regimeid == 725) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 74;
                    a.el = 78;
                    return a;
                elseif (regimeid == 726) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 102;
                    a.el = 105;
                    return a;
                elseif (regimeid == 727) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 20;
                    a.el = 26;
                    return a;
                elseif (regimeid == 728) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 22;
                    a.el = 30;
                    return a;
                elseif (regimeid == 729) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 23;
                    a.el = 31;
                    return a;
                elseif (regimeid == 730) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 28;
                    a.el = 31;
                    return a;
                elseif (regimeid == 731) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 29;
                    a.el = 33;
                    return a;
                end
            elseif (regimeid > 731 and regimeid <= 741) then
                if (regimeid == 732) then
                    a.n1 = 4;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 30;
                    a.el = 33;
                    return a;
                elseif (regimeid == 733) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 35;
                    a.el = 37;
                    return a;
                elseif (regimeid == 734) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 87;
                    a.el = 91;
                    return a;
                elseif (regimeid == 735) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 64;
                    return a;
                elseif (regimeid == 736) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 66;
                    return a;
                elseif (regimeid == 737) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 66;
                    return a;
                elseif (regimeid == 738) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 67;
                    return a;
                elseif (regimeid == 739) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 63;
                    a.el = 69;
                    return a;
                elseif (regimeid == 740) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 65;
                    a.el = 69;
                    return a;
                elseif (regimeid == 741) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 77;
                    a.el = 80;
                    return a;
                end
            else -- 741-751
                if (regimeid == 742) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 99;
                    a.el = 103;
                    return a;
                elseif (regimeid == 743) then
                    a.n1 = 10;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 72;
                    a.el = 72;
                    return a;
                elseif (regimeid == 744) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 74;
                    a.el = 77;
                    return a;
                elseif (regimeid == 745) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 78;
                    return a;
                elseif (regimeid == 746) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 76;
                    a.el = 79;
                    return a;
                elseif (regimeid == 747) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 77;
                    a.el = 80;
                    return a;
                elseif (regimeid == 748) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 79;
                    a.el = 80;
                    return a;
                elseif (regimeid == 749) then
                    a.n1 = 10;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 71;
                    a.el = 71;
                    return a;
                elseif (regimeid == 750) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 71;
                    a.el = 74;
                    return a;
                elseif (regimeid == 751) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 80;
                    return a;
                end
            end
        elseif (regimeid > 751 and regimeid <= 803) then
            if (regimeid > 751 and regimeid <= 761) then
                if (regimeid == 752) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 77;
                    a.el = 82;
                    return a;
                elseif (regimeid == 753) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 79;
                    a.el = 82;
                    return a;
                elseif (regimeid == 754) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 81;
                    a.el = 84;
                    return a;
                elseif (regimeid == 755 or regimeid == 756) then
                    a.n1 = 4;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 61;
                    a.el = 68;
                    return a;
                elseif (regimeid == 757) then
                    a.n1 = 4;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 69;
                    return a;
                elseif (regimeid == 758) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 73;
                    return a;
                elseif (regimeid == 759) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 73;
                    return a;
                elseif (regimeid == 760) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 69;
                    a.el = 74;
                    return a;
                elseif (regimeid == 761 or regimeid == 762) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 71;
                    a.el = 78;
                    return a;
                end
            elseif (regimeid > 762 and regimeid <= 772) then
                if (regimeid == 763) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 1;
                    a.n4 = 0;
                    a.sl = 44;
                    a.el = 49;
                    return a;
                elseif (regimeid == 764) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 45;
                    a.el = 49;
                    return a;
                elseif (regimeid == 765) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 1;
                    a.n4 = 0;
                    a.sl = 65;
                    a.el = 68;
                    return a;
                elseif (regimeid == 766) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 73;
                    a.el = 76;
                    return a;
                elseif (regimeid == 767) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 78;
                    return a;
                elseif (regimeid == 768) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 79;
                    return a;
                elseif (regimeid == 769) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 76;
                    a.el = 80;
                    return a;
                elseif (regimeid == 770) then
                    a.n1 = 5;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 100;
                    a.el = 103;
                    return a;
                elseif (regimeid == 771) then
                    a.n1 = 2;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 45;
                    a.el = 49;
                    return a;
                elseif (regimeid == 772) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 53;
                    return a;
                end
            elseif (regimeid > 772 and regimeid <= 782) then
                if (regimeid == 773) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 50;
                    a.el = 54;
                    return a;
                elseif (regimeid == 774) then
                    a.n1 = 3;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 55;
                    a.el = 59;
                    return a;
                elseif (regimeid == 775) then
                    a.n1 = 4;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 70;
                    a.el = 74;
                    return a;
                elseif (regimeid == 776) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 95;
                    a.el = 98;
                    return a;
                elseif (regimeid == 777 or regimeid == 778) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 25;
                    a.el = 30;
                    return a;
                elseif (regimeid == 779) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 25;
                    a.el = 30;
                    return a;
                elseif (regimeid == 780) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 25;
                    a.el = 32;
                    return a;
                elseif (regimeid == 781) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 25;
                    a.el = 35;
                    return a;
                elseif (regimeid == 782 or regimeid == 783) then
                    a.n1 = 4;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 25;
                    a.el = 34;
                    return a;
                end
            elseif (regimeid > 783 and regimeid <= 793) then
                if (regimeid == 784) then
                    a.n1 = 4;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 30;
                    a.el = 34;
                    return a;
                elseif (regimeid == 785) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 34;
                    a.el = 35;
                    return a;
                elseif (regimeid == 786 or regimeid == 787) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 69;
                    return a;
                elseif (regimeid == 788 or regimeid == 789) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 65;
                    a.el = 69;
                    return a;
                elseif (regimeid == 790) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 57;
                    return a;
                elseif (regimeid == 791 or regimeid == 792) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 57;
                    return a;
                elseif (regimeid == 793) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 61;
                    a.el = 63;
                    return a;
                end
            else -- 793-803
                if (regimeid == 794) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 61;
                    a.el = 67;
                    return a;
                elseif (regimeid == 795) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 61;
                    a.el = 68;
                    return a;
                elseif (regimeid == 796) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 64;
                    return a;
                elseif (regimeid == 797) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 60;
                    a.el = 67;
                    return a;
                elseif (regimeid == 798) then
                    a.n1 = 6;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 69;
                    return a;
                elseif (regimeid == 799) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 69;
                    return a;
                elseif (regimeid == 800) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 76;
                    return a;
                elseif (regimeid == 801) then
                    a.n1 = 5;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 73;
                    a.el = 81;
                    return a;
                elseif (regimeid == 802) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 74;
                    a.el = 79;
                    return a;
                end
            end
        elseif (regimeid > 803 and regimeid <= 819) then
            if (regimeid > 803 and regimeid <= 813) then
                if (regimeid == 803) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 75;
                    a.el = 80;
                    return a;
                elseif (regimeid == 804) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 35;
                    a.el = 39;
                    return a;
                elseif (regimeid == 805) then
                    a.n1 = 2;
                    a.n2 = 4;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 37;
                    a.el = 41;
                    return a;
                elseif (regimeid == 806) then
                    a.n1 = 5;
                    a.n2 = 1;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 41;
                    a.el = 45;
                    return a;
                elseif (regimeid == 807) then
                    a.n1 = 2;
                    a.n2 = 2;
                    a.n3 = 2;
                    a.n4 = 0;
                    a.sl = 43;
                    a.el = 48;
                    return a;
                elseif (regimeid == 808) then
                    a.n1 = 4;
                    a.n2 = 2;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 44;
                    a.el = 48;
                    return a;
                elseif (regimeid == 809) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 67;
                    return a;
                elseif (regimeid == 810) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 69;
                    return a;
                elseif (regimeid == 811) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 66;
                    a.el = 69;
                    return a;
                elseif (regimeid == 812) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 55;
                    return a;
                elseif (regimeid == 813) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 58;
                    return a;
                end
            else
                if (regimeid == 814) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 51;
                    a.el = 59;
                    return a;
                elseif (regimeid == 815) then
                    a.n1 = 7;
                    a.n2 = 0;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 52;
                    a.el = 59;
                    return a;
                elseif (regimeid == 816) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 52;
                    a.el = 59;
                    return a;
                elseif (regimeid == 817) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 56;
                    a.el = 59;
                    return a;
                elseif (regimeid == 818) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 62;
                    a.el = 65;
                    return a;
                elseif (regimeid == 819) then
                    a.n1 = 3;
                    a.n2 = 3;
                    a.n3 = 0;
                    a.n4 = 0;
                    a.sl = 65;
                    a.el = 69;
                    return a;
                end
            end
        end
    else
        -- print("Warning: Regime ID not found! Returning blank array.");
        a.n1 = 0;
        a.n2 = 0;
        a.n3 = 0;
        a.n4 = 0;
        a.sl = 0;
        a.el = 0;
        return a;
    end
end