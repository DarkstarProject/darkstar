-------------------------------------------------
-- Regime Reward Database(s)
-------------------------------------------------

-- ------------------------------------
-- FoV rewards
-- ------------------------------------
function getFoVregimeReward(regimeid)
    if (regimeid<=50) then
        if (regimeid<=10) then
            if (regimeid==1) then
                return 270;
            end
            if (regimeid==2) then
                return 285;
            end
            if (regimeid==3) then
                return 300;
            end
            if (regimeid==4) then
                return 315;
            end
            if (regimeid==5) then
                return 330;
            end
            if (regimeid==6) then
                return 390;
            end
            if (regimeid==7) then
                return 475;
            end
            if (regimeid==8) then
                return 500;
            end
            if (regimeid==9) then
                return 525;
            end
            if (regimeid==10) then
                return 550;
            end
        elseif (regimeid>10 and regimeid<=20) then
            if (regimeid==11) then
                return 540;
            end
            if (regimeid==12) then
                return 570;
            end
            if (regimeid==13) then
                return 600;
            end
            if (regimeid==14) then
                return 630;
            end
            if (regimeid==15) then
                return 670;
            end
            if (regimeid==16) then
                return 270;
            end
            if (regimeid==17) then
                return 285;
            end
            if (regimeid==18) then
                return 300;
            end
            if (regimeid==19) then
                return 315;
            end
            if (regimeid==20) then
                return 330;
            end
        elseif (regimeid>20 and regimeid<=30) then
            if (regimeid==21) then
                return 540;
            end
            if (regimeid==22) then
                return 570;
            end
            if (regimeid==23) then
                return 600;
            end
            if (regimeid==24) then
                return 630;
            end
            if (regimeid==25) then
                return 690;
            end
            if (regimeid==26) then
                return 270;
            end
            if (regimeid==27) then
                return 285;
            end
            if (regimeid==28) then
                return 300;
            end
            if (regimeid==29) then
                return 315;
            end
            if (regimeid==30) then
                return 330;
            end
        elseif (regimeid>30 and regimeid<=40) then
            if (regimeid==31) then
                return 450;
            end
            if (regimeid==32) then
                return 475;
            end
            if (regimeid==33) then
                return 500;
            end
            if (regimeid==34) then
                return 525;
            end
            if (regimeid==35) then
                return 550;
            end
            if (regimeid==36) then
                return 540;
            end
            if (regimeid==37) then
                return 570;
            end
            if (regimeid==38) then
                return 600;
            end
            if (regimeid==39) then
                return 630;
            end
            if (regimeid==40) then
                return 690;
            end
        else --Regime between 41-50
            if (regimeid==41) then
                return 630;
            end
            if (regimeid==42) then
                return 665;
            end
            if (regimeid==43) then
                return 700;
            end
            if (regimeid==44) then
                return 735;
            end
            if (regimeid==45) then
                return 770;
            end
            if (regimeid==46) then
                return 810;
            end
            if (regimeid==47) then
                return 855;
            end
            if (regimeid==48) then
                return 900;
            end
            if (regimeid==49) then
                return 945;
            end
            if (regimeid==50) then
                return 990;
            end
        end
    elseif (regimeid>50 and regimeid<=100) then
        if (regimeid>50 and regimeid<=60) then
            if (regimeid==51) then
                return 900;
            end
            if (regimeid==52) then
                return 950;
            end
            if (regimeid==53) then
                return 1000;
            end
            if (regimeid==54) then
                return 1050;
            end
            if (regimeid==55) then
                return 1100;
            end
            if (regimeid==56) then
                return 330;
            end
            if (regimeid==57) then
                return 575;
            end
            if (regimeid==58) then
                return 480;
            end
            if (regimeid==59) then
                return 330;
            end
            if (regimeid==60) then
                return 660;
            end
        elseif (regimeid>60 and regimeid<=70) then
            if (regimeid==61) then
                return 330;
            end
            if (regimeid==62) then
                return 575;
            end
            if (regimeid==63) then
                return 660;
            end
            if (regimeid==64) then
                return 270;
            end
            if (regimeid==65) then
                return 285;
            end
            if (regimeid==66) then
                return 300;
            end
            if (regimeid==67) then
                return 315;
            end
            if (regimeid==68) then
                return 330;
            end
            if (regimeid==69) then
                return 360;
            end
            if (regimeid==70) then
                return 420;
            end
        elseif (regimeid>70 and regimeid<=80) then
            if (regimeid==71) then
                return 450;
            end
            if (regimeid==72) then
                return 630;
            end
            if (regimeid==73) then
                return 650;
            end
            if (regimeid==74) then
                return 700;
            end
            if (regimeid==75) then
                return 730;
            end
            if (regimeid==76) then
                return 270;
            end
            if (regimeid==77) then
                return 285;
            end
            if (regimeid==78) then
                return 300;
            end
            if (regimeid==79) then
                return 315;
            end
            if (regimeid==80) then
                return 330;
            end
        elseif (regimeid>80 and regimeid<=90) then
            if (regimeid==81) then
                return 340;
            end
            if (regimeid==82) then
                return 360;
            end
            if (regimeid==83) then
                return 380;
            end
            if (regimeid==84) then
                return 400;
            end
            if (regimeid==85) then
                return 670;
            end
            if (regimeid==86) then
                return 710;
            end
            if (regimeid==87) then
                return 740;
            end
            if (regimeid==88) then
                return 800;
            end
            if (regimeid==89) then
                return 270;
            end
            if (regimeid==90) then
                return 285;
            end
        else --Regime 91-100
            if (regimeid==91) then
                return 300;
            end
            if (regimeid==92) then
                return 315;
            end
            if (regimeid==93) then
                return 330;
            end
            if (regimeid==94) then
                return 315;
            end
            if (regimeid==95) then
                return 370;
            end
            if (regimeid==96) then
                return 475;
            end
            if (regimeid==97) then
                return 710;
            end
            if (regimeid==98) then
                return 710;
            end
            if (regimeid==99) then
                return 730;
            end
            if (regimeid==100) then
                return 770;
            end
        end
    elseif (regimeid>100) then
        if (regimeid>100 and regimeid<=110) then
            if (regimeid==101) then
                return 350;
            end
            if (regimeid==102) then
                return 400;
            end
            if (regimeid==103) then
                return 450;
            end
            if (regimeid==104) then
                return 1300;
            end
            if (regimeid==105) then
                return 1320;
            end
            if (regimeid==106) then
                return 1340;
            end
            if (regimeid==107) then
                return 1390;
            end
            if (regimeid==108) then
                return 1450;
            end
            if (regimeid==109) then
                return 810;
            end
            if (regimeid==110) then
                return 830;
            end
        elseif (regimeid>110 and regimeid<=120) then
            if (regimeid==111) then
                return 870;
            end
            if (regimeid==112) then
                return 950;
            end
            if (regimeid==113) then
                return 970;
            end
            if (regimeid==114) then
                return 900;
            end
            if (regimeid==115) then
                return 940;
            end
            if (regimeid==116) then
                return 980;
            end
            if (regimeid==117) then
                return 1020;
            end
            if (regimeid==118) then
                return 1100;
            end
            if (regimeid==119) then
                return 1300;
            end
            if (regimeid==120) then
                return 1330;
            end
        elseif (regimeid>120 and regimeid<=130) then
            if (regimeid==121) then
                return 1360;
            end
            if (regimeid==122) then
                return 1540;
            end
            if (regimeid==123) then
                return 1540;
            end
            if (regimeid==124) then
                return 820;
            end
            if (regimeid==125) then
                return 840;
            end
            if (regimeid==126) then
                return 860;
            end
            if (regimeid==127) then
                return 880;
            end
            if (regimeid==128) then
                return 920;
            end
            if (regimeid==129) then
                return 840;
            end
            if (regimeid==130) then
                return 880;
            end
        elseif (regimeid>130 and regimeid<=140) then
            if (regimeid==131) then
                return 920;
            end
            if (regimeid==132) then
                return 940;
            end
            if (regimeid==133) then
                return 1000;
            end
            if (regimeid==134) then
                return 920;
            end
            if (regimeid==135) then
                return 980;
            end
            if (regimeid==136) then
                return 1020;
            end
            if (regimeid==137) then
                return 1080;
            end
            if (regimeid==138) then
                return 1140;
            end
            if (regimeid==139) then
                return 1220;
            end
            if (regimeid==140) then
                return 1260;
            end
        else --Regime 140-146
            if (regimeid==141) then
                return 1300;
            end
            if (regimeid==142) then
                return 1450;
            end
            if (regimeid==143) then
                return 1500;
            end
            if (regimeid==144) then
                return 1550;
            end
            if (regimeid==145) then
                return 1600;
            end
            if (regimeid==146) then
                return 1600;
            end
        end
        --print("Warning: Regime ID not found! Returning reward as 10.");
        return 10;
    end
end

-- ------------------------------------
-- Placeholder for Hunt Registry
-- ------------------------------------
--function getHuntRegistryReward(registryid)

-----------------------------------
-- Fetch GoV base rewards
--
-- I know, its ugly but until the missing reward values are
-- corrected I'm not messing with it further (neither wiki had them all).
-- Once thats done maybe we can array this.
-----------------------------------
function getGoVregimeReward(regimeid) 
    if (regimeid >= 602 and regimeid <= 819) then
        if (regimeid >= 602 and regimeid <= 652) then
            if (regimeid >= 602 and regimeid <= 612) then
                if (regimeid == 602) then -- Ranguemont Pass p1
                    return 270;
                elseif (regimeid == 603) then
                    return 930;
                elseif (regimeid == 604 or regimeid == 605) then
                    return 860;
                elseif (regimeid == 606) then
                    return 970;
                elseif (regimeid == 607) then
                    return 2260;
                elseif (regimeid == 608) then
                    return 2260; -- Missing data on wiki
                elseif (regimeid == 609) then
                    return 2260; -- Missing data on wiki
                elseif (regimeid == 610) then -- Bostaunieux Oubliette p1
                    return 1110;
                elseif (regimeid == 611) then
                    return 1320;
                elseif (regimeid == 612) then
                    return 1430;
                end
            elseif (regimeid > 612 and regimeid <= 622) then
                if (regimeid == 613) then
                    return 2050;
                elseif (regimeid == 614 or regimeid == 615) then
                    return 2300;
                elseif (regimeid == 616) then
                    return 1960;
                elseif (regimeid == 617) then
                    return 1960; -- Missing data on wiki
                elseif (regimeid == 618) then -- Toraimarai p1
                    return 1260;
                elseif (regimeid == 619) then
                    return 1410;
                elseif (regimeid == 620) then
                    return 1500;
                elseif (regimeid == 621) then
                    return 1690;
                elseif (regimeid == 622) then
                    return 1690; -- Missing info on 
                end
            elseif (regimeid > 622 and regimeid <= 632) then
                if (regimeid == 623) then
                    return 2170;
                elseif (regimeid == 624) then
                    return 2250;
                elseif (regimeid == 625) then
                    return 2250; -- Missing info on wiki
                elseif (regimeid == 626) then -- Zeruhn p1
                    return 90;
                elseif (regimeid == 627) then
                    return 110;
                elseif (regimeid == 628) then
                    return 1640;
                elseif (regimeid == 629) then
                    return 1600;
                elseif (regimeid == 630) then
                    return 1700;
                elseif (regimeid == 631) then -- KRT p1
                    return 380;
                elseif (regimeid == 632) then
                    return 420;
                end
            elseif (regimeid > 632 and regimeid <= 642) then
                if (regimeid == 633) then
                    return 610;
                elseif (regimeid == 634) then
                    return 590;
                elseif (regimeid == 635) then
                    return 864;
                elseif (regimeid == 636) then
                    return 1520;
                elseif (regimeid == 637) then
                    return 1690;
                elseif (regimeid == 638) then
                    return 1720;
                elseif (regimeid == 639) then -- Dangruf p1
                    return 280;
                elseif (regimeid == 640) then
                    return 350;
                elseif (regimeid == 641) then
                    return 490;
                elseif (regimeid == 642) then
                    return 1830;
                end
            else
                if (regimeid == 643) then
                    return 1650;
                elseif (regimeid == 644) then
                    return 1840;
                elseif (regimeid == 645) then
                    return 1860;
                elseif (regimeid == 646) then
                    return 2260;
                elseif (regimeid == 647) then -- Inner Horutoto p1
                    return 250;
                elseif (regimeid == 648) then
                    return 270;
                elseif (regimeid == 649) then
                    return 610;
                elseif (regimeid == 650) then
                    return 840;
                elseif (regimeid == 651) then
                    return 1750;
                else
                    return 1760;
                end
            end
        elseif (regimeid > 652 and regimeid <= 702) then
            if (regimeid > 652 and regimeid <= 662) then
                if (regimeid == 653) then
                    return 1770;
                elseif (regimeid == 654) then
                    return 1780;
                elseif (regimeid == 655) then -- Ordelle's Caves p1
                    return 730;
                elseif (regimeid == 656) then
                    return 840;
                elseif (regimeid == 657) then
                    return 800;
                elseif (regimeid == 658) then
                    return 850;
                elseif (regimeid == 659) then
                    return 950;
                elseif (regimeid == 660) then
                    return 830;
                elseif (regimeid == 661) then
                    return 1810;
                else
                    return 1560;
                end
            elseif (regimeid > 662 and regimeid <= 672) then
                if (regimeid == 663) then -- Outer Horutoto p1
                    return 340;
                elseif (regimeid == 664) then
                    return 450;
                elseif (regimeid == 665) then
                    return 540;
                elseif (regimeid == 666) then
                    return 590;
                elseif (regimeid == 667) then
                    return 650;
                elseif (regimeid == 668) then
                    return 700;
                elseif (regimeid == 669) then
                    return 1840;
                elseif (regimeid == 670) then
                    return 1850;
                elseif (regimeid == 671) then -- Necropolis p1
                    return 950;
                else
                    return 1030;
                end
            elseif (regimeid > 672 and regimeid <= 682) then
                if (regimeid == 673) then
                    return 1300;
                elseif (regimeid == 674) then
                    return 1340;
                elseif (regimeid == 675) then
                    return 1330;
                elseif (regimeid == 676) then
                    return 1470;
                elseif (regimeid == 677) then
                    return 1890;
                elseif (regimeid == 678) then
                    return 1890; -- Missing info on wiki
                elseif (regimeid == 679) then -- Gusgen p1
                    return 660;
                elseif (regimeid == 680) then
                    return 800;
                elseif (regimeid == 681) then
                    return 790;
                else
                    return 1050;
                end
            elseif (regimeid > 682 and regimeid <= 692) then
                if (regimeid == 683) then
                    return 970;
                elseif (regimeid == 684) then
                    return 1000;
                elseif (regimeid == 685) then
                    return 1890;
                elseif (regimeid == 686) then
                    return 2180;
                elseif (regimeid == 687) then -- CN p1
                    return 1160;
                elseif (regimeid == 688) then
                    return 1230;
                elseif (regimeid == 689) then
                    return 1280;
                elseif (regimeid == 690) then
                    return 1300;
                elseif (regimeid == 691) then
                    return 1340;
                else
                    return 1470
                end
            elseif (regimeid > 692 and regimeid <= 702) then
                if (regimeid == 693) then
                    return 2190;
                elseif (regimeid == 694) then
                    return 2220;
                elseif (regimeid == 695) then -- Shakhrami p1
                    return 550;
                elseif (regimeid == 696) then
                    return 700;
                elseif (regimeid == 697) then
                    return 840;
                elseif (regimeid == 698) then
                    return 920;
                elseif (regimeid == 699) then
                    return 820;
                elseif (regimeid == 700) then
                    return 840;
                elseif (regimeid == 701) then
                    return 1530;
                else
                    return 1830;
                end
            end
        elseif (regimeid > 702 and regimeid <= 752) then
            if (regimeid > 702 and regimeid <= 712) then
                if (regimeid == 703 or regimeid == 704) then -- Garliage Citidel
                    return 1160;
                elseif (regimeid == 705) then
                    return 1240;
                elseif (regimeid == 706) then
                    return 1310;
                elseif (regimeid == 707) then
                    return 1330;
                elseif (regimeid == 708) then
                    return 1270;
                elseif (regimeid == 709) then
                    return 1840;
                elseif (regimeid == 710) then
                    return 2220;
                elseif (regimeid == 711) then -- Fei'Yin p1
                    return 1180;
                else
                    return 1240;
                end
            elseif (regimeid > 712 and regimeid <= 722) then
                if (regimeid == 713) then
                    return 1310;
                elseif (regimeid == 714) then
                    return 1310;
                elseif (regimeid == 715) then
                    return 1340;
                elseif (regimeid == 716) then
                    return 1470;
                elseif (regimeid == 717) then
                    return 2060;
                elseif (regimeid == 718) then
                    return 2250;
                elseif (regimeid == 719) then -- Boyahada Tree p1
                    return 1470;
                elseif (regimeid == 720) then
                    return 1720;
                elseif (regimeid == 721) then
                    return 1760;
                else
                    return 1770;
                end
            elseif (regimeid > 722 and regimeid <= 732) then
                if (regimeid == 723) then
                    return 1830;
                elseif (regimeid == 724) then
                    return 1900;
                elseif (regimeid == 725) then
                    return 1640;
                elseif (regimeid == 726) then
                    return 2040;
                elseif (regimeid == 727) then -- Korroloka p1
                    return 780;
                elseif (regimeid == 728) then
                    return 870;
                elseif (regimeid == 729) then
                    return 950;
                elseif (regimeid == 730) then
                    return 980;
                elseif (regimeid == 731) then
                    return 930;
                else
                    return 770;
                end
            elseif (regimeid > 732 and regimeid <= 742) then
                if (regimeid == 733) then
                    return 1030;
                elseif (regimeid == 734) then
                    return 2140;
                elseif (regimeid == 735) then -- Kuftal p1
                    return 1440;
                elseif (regimeid == 736) then
                    return 1480;
                elseif (regimeid == 737) then
                    return 1380;
                elseif (regimeid == 738) then
                    return 1550;
                elseif (regimeid == 739) then
                    return 1410;
                elseif (regimeid == 740) then
                    return 1540;
                elseif (regimeid == 741) then
                    return 1660;
                else
                    return 1900;
                end
            elseif (regimeid > 742 and regimeid <= 752) then
                if (regimeid == 743) then -- Ve'Lugannon p1
                    return 2390;
                elseif (regimeid == 744) then
                    return 1900;
                elseif (regimeid == 745) then
                    return 1920;
                elseif (regimeid == 746) then
                    return 2120;
                elseif (regimeid == 747) then
                    return 2230;
                elseif (regimeid == 748) then
                    return 2180;
                elseif (regimeid == 749) then -- Ru'Avitau p1
                    return 2370;
                elseif (regimeid == 750) then
                    return 2370; -- Missing data on wiki
                elseif (regimeid == 751) then
                    return 1930;
                else
                    return 2150;
                end
            end
        elseif (regimeid > 752 and regimeid <= 802) then
            if (regimeid > 752 and regimeid <= 762) then
                if (regimeid == 753) then
                    return 2050;
                elseif (regimeid == 754) then
                    return 2390;
                elseif (regimeid == 755) then -- Ifrit's Cauldron p1
                    return 1270;
                elseif (regimeid == 756) then
                    return 1570;
                elseif (regimeid == 757) then
                    return 1280;
                elseif (regimeid == 758) then
                    return 1310;
                elseif (regimeid == 759) then
                    return 1380;
                elseif (regimeid == 760) then
                    return 1380; -- Missing info on wiki
                elseif (regimeid == 761) then
                    return 1650;
                else
                    return 1760;
                end
            elseif (regimeid > 762 and regimeid <= 772) then
                if (regimeid == 763) then
                    return 1040;
                elseif (regimeid == 764) then
                    return 1230;
                elseif (regimeid == 765) then
                    return 1490;
                elseif (regimeid == 766) then
                    return 1620;
                elseif (regimeid == 767) then
                    return 1700;
                elseif (regimeid == 768) then
                    return 1680;
                elseif (regimeid == 769) then
                    return 1710;
                elseif (regimeid == 770) then
                    return 2310;
                elseif (regimeid == 771) then -- Onzozo p1
                    return 1050;
                else
                    return 1070;
                end
            elseif (regimeid > 772 and regimeid <= 783) then
                if (regimeid == 773) then
                    return 1140;
                elseif (regimeid == 774) then
                    return 1130;
                elseif (regimeid == 775) then
                    return 1350;
                elseif (regimeid == 776) then
                    return 1920;
                elseif (regimeid == 777 or regimeid == 778) then -- Lower Delkfutt's
                    return 900;
                elseif (regimeid == 779) then
                    return 930;
                elseif (regimeid == 780) then
                    return 980;
                elseif (regimeid == 781) then
                    return 940;
                elseif (regimeid == 782 or regimeid == 783) then -- Middle delkfutt's
                    return 1090;
                end
            elseif (regimeid > 783 and regimeid <= 793) then
                if (regimeid == 784) then
                    return 1290;
                elseif (regimeid == 785) then -- Upper Delkfutt's p1
                    return 1010;
                elseif (regimeid == 786 or regimeid == 787) then
                    return 1520;
                elseif (regimeid == 788 or regimeid == 789) then
                    return 1540;
                elseif (regimeid == 790) then -- Temple of Ug. p1
                    return 1450;
                elseif (regimeid == 791) then
                    return 1450; -- Missing data on wiki
                elseif (regimeid == 792) then
                    return 1450; -- Missing data on wiki
                else
                    return 1630;
                end
            elseif (regimeid > 783 and regimeid <= 802) then
                if (regimeid == 794) then
                    return 1650;
                elseif (regimeid == 795) then
                    return 1660;
                elseif (regimeid == 796) then -- Den of Rancor p1
                    return 1370;
                elseif (regimeid == 797) then
                    return 1500;
                elseif (regimeid == 798) then
                    return 1820;
                elseif (regimeid == 799) then
                    return 1640;
                elseif (regimeid == 800) then
                    return 550;
                elseif (regimeid == 801) then
                    return 1690;
                else
                    return 1640;
                end
            end
        elseif (regimeid > 802 and regimeid <= 819) then
            if (regimeid > 802 and regimeid <= 812) then
                if (regimeid == 803) then
                    return 1790;
                elseif (regimeid == 804) then -- SSG p1
                    return 1040;
                elseif (regimeid == 805) then
                    return 1050;
                elseif (regimeid == 806) then
                    return 1180;
                elseif (regimeid == 807) then
                    return 1190;
                elseif (regimeid == 808) then
                    return 1220;
                elseif (regimeid == 809) then
                    return 1470;
                elseif (regimeid == 810) then
                    return 1480;
                elseif (regimeid == 811) then
                    return 1500;
                else -- QS caves p1
                    return 1310;
                end
            else
                if (regimeid == 813) then
                    return 1360;
                elseif (regimeid == 814) then
                    return 1230;
                elseif (regimeid == 815) then
                    return 1480;
                elseif (regimeid == 816) then
                    return 1470;
                elseif (regimeid == 817) then
                    return 1360;
                elseif (regimeid == 818) then
                    return 1570;
                else
                    return 1540;
                end
            end
        end
    else
        -- print("Warning: Regime ID not found! Returning reward as 100.");
        return 100;
    end
end

-- ------------------------------------
-- Placeholder for Dominion Regimes
-- ------------------------------------
-- function getDominionReward(regimeid)

