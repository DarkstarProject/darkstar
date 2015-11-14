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
    local a = {};
    if (regimeid >= 1 and regimeid <= 146) then -- FoV (1~146)
        if (regimeid <= 50) then
            if (regimeid <= 10) then
                if (regimeid == 1) then
                    a = {6,0,0,0,1,6};
                elseif (regimeid == 2) then
                    a = {6,0,0,0,2,6};
                elseif (regimeid == 3) then
                    a = {5,1,0,0,4,7};
                elseif (regimeid == 4) then
                    a = {4,2,0,0,4,8};
                elseif (regimeid == 5) then
                    a = {3,3,0,0,8,12};
                elseif (regimeid == 6) then
                    a = {8,0,0,0,12,13};
                elseif (regimeid == 7) then
                    a = {7,1,0,0,15,19};
                elseif (regimeid == 8) then
                    a = {6,2,0,0,15,22};
                elseif (regimeid == 9) then
                    a = {5,3,0,0,18,23};
                elseif (regimeid == 10) then
                    a = {4,4,0,0,20,23};
                end
            elseif (regimeid > 10 and regimeid <= 20) then
                if (regimeid == 11) then
                    a = {9,0,0,0,21,22};
                elseif (regimeid == 12) then
                    a = {8,1,0,0,21,23};
                elseif (regimeid == 13) then
                    a = {7,2,0,0,22,25};
                elseif (regimeid == 14) then
                    a = {6,3,0,0,24,25};
                elseif (regimeid == 15) then
                    a = {4,3,0,0,25,28};
                elseif (regimeid == 16) then
                    a = {6,0,0,0,1,6};
                elseif (regimeid == 17) then
                    a = {6,0,0,0,3,6};
                elseif (regimeid == 18) then
                    a = {5,1,0,0,3,7};
                elseif (regimeid == 19) then
                    a = {4,2,0,0,3,8};
                elseif (regimeid == 20) then
                    a = {3,3,0,0,10,12};
                end
            elseif (regimeid > 20 and regimeid <= 30) then
                if (regimeid == 21) then
                    a = {9,0,0,0,20,21};
                elseif (regimeid == 22) then
                    a = {8,1,0,0,20,22};
                elseif (regimeid == 23) then
                    a = {7,2,0,0,21,23};
                elseif (regimeid == 24) then
                    a = {6,3,0,0,22,25};
                elseif (regimeid == 25) then
                    a = {4,3,0,0,25,28};
                elseif (regimeid == 26) then
                    a = {6,0,0,0,1,5};
                elseif (regimeid == 27) then
                    a = {6,0,0,0,2,5};
                elseif (regimeid == 28) then
                    a = {5,1,0,0,3,8};
                elseif (regimeid == 29) then
                    a = {4,2,0,0,4,8};
                elseif (regimeid == 30) then
                    a = {3,3,0,0,7,12};
                end
            elseif (regimeid > 30 and regimeid <= 40) then
                if (regimeid == 31) then
                    a = {8,0,0,0,11,13};
                elseif (regimeid == 32) then
                    a = {7,1,0,0,15,19};
                elseif (regimeid == 33) then
                    a = {6,2,0,0,15,23};
                elseif (regimeid == 34) then
                    a = {5,3,0,0,20,24};
                elseif (regimeid == 35) then
                    a = {4,4,0,0,21,24};
                elseif (regimeid == 36) then
                    a = {9,0,0,0,20,21};
                elseif (regimeid == 37) then
                    a = {8,1,0,0,20,22};
                elseif (regimeid == 38) then
                    a = {7,2,0,0,21,23};
                elseif (regimeid == 39) then
                    a = {6,3,0,0,22,25};
                elseif (regimeid == 40) then
                    a = {4,3,0,0,25,28};
                end
            else --Regime between 41-50
                if (regimeid == 41) then
                    a = {9,1,0,0,26,29};
                elseif (regimeid == 42) then
                    a = {8,2,0,0,26,29};
                elseif (regimeid == 43) then
                    a = {7,3,0,0,28,29};
                elseif (regimeid == 44) then
                    a = {6,4,0,0,28,30};
                elseif (regimeid == 45) then
                    a = {5,4,1,0,28,34};
                elseif (regimeid == 46) then
                    a = {9,2,0,0,34,38};
                elseif (regimeid == 47) then
                    a = {8,3,0,0,34,39};
                elseif (regimeid == 48) then
                    a = {7,4,0,0,37,42};
                elseif (regimeid == 49) then
                    a = {6,4,1,0,37,43};
                elseif (regimeid == 50) then
                    a = {5,4,2,0,40,43};
                end
            end
        elseif (regimeid > 50 and regimeid <= 100) then
            if (regimeid > 50 and regimeid <= 60) then
                if (regimeid == 51) then
                    a = {9,3,0,0,42,46};
                elseif (regimeid == 52) then
                    a = {8,4,0,0,42,45};
                elseif (regimeid == 53) then
                    a = {7,4,1,0,42,48};
                elseif (regimeid == 54) then
                    a = {6,4,2,0,42,48};
                elseif (regimeid == 55) then
                    a = {5,4,3,0,45,52};
                elseif (regimeid == 56) then
                    a = {6,1,0,0,4,8};
                elseif (regimeid == 57) then
                    a = {4,2,0,0,22,25};
                elseif (regimeid == 58) then
                    a = {8,2,0,0,15,18};
                elseif (regimeid == 59) then
                    a = {3,4,0,0,3,8};
                elseif (regimeid == 60) then
                    a = {5,4,1,0,22,25};
                end
            elseif (regimeid > 60 and regimeid <= 70) then
                if (regimeid == 61) then
                    a = {4,2,0,0,4,8};
                elseif (regimeid == 62) then
                    a = {4,3,0,0,22,27};
                elseif (regimeid == 63) then
                    a = {3,5,0,0,25,27};
                elseif (regimeid == 64) then
                    a = {6,0,0,0,1,5};
                elseif (regimeid == 65) then
                    a = {6,0,0,0,2,5};
                elseif (regimeid == 66) then
                    a = {7,0,0,0,2,6};
                elseif (regimeid == 67) then
                    a = {4,2,0,0,3,6};
                elseif (regimeid == 68) then
                    a = {4,2,0,0,4,8};
                elseif (regimeid == 69) then
                    a = {3,5,0,0,11,13};
                elseif (regimeid == 70) then
                    a = {5,3,0,0,11,14};
                end
            elseif (regimeid > 70 and regimeid <= 80) then
                if (regimeid == 71) then
                    a = {5,3,0,0,10,15};
                elseif (regimeid == 72) then
                    a = {5,2,0,0,23,26};
                elseif (regimeid == 73) then
                    a = {5,2,0,0,23,28};
                elseif (regimeid == 74) then
                    a = {5,2,2,0,26,32};
                elseif (regimeid == 75) then
                    a = {9,0,0,0,31,32};
                elseif (regimeid == 76) then
                    a = {6,0,0,0,1,6};
                elseif (regimeid == 77) then
                    a = {7,0,0,0,2,5};
                elseif (regimeid == 78) then
                    a = {3,3,0,0,3,6};
                elseif (regimeid == 79) then
                    a = {7,0,0,0,3,6};
                elseif (regimeid == 80) then
                    a = {5,2,0,0,4,8};
                end
            elseif (regimeid > 80 and regimeid <= 90) then
                if (regimeid == 81) then
                    a = {4,2,0,0,8,11};
                elseif (regimeid == 82) then
                    a = {4,2,0,0,9,12};
                elseif (regimeid == 83) then
                    a = {6,0,0,0,9,15};
                elseif (regimeid == 84) then
                    a = {2,2,2,0,12,14};
                elseif (regimeid == 85) then
                    a = {5,2,0,0,25,26};
                elseif (regimeid == 86) then
                    a = {6,2,0,0,26,32};
                elseif (regimeid == 87) then
                    a = {6,2,0,0,27,33};
                elseif (regimeid == 88) then
                    a = {5,0,0,0,36,37};
                elseif (regimeid == 89) then
                    a = {6,0,0,0,1,6};
                elseif (regimeid == 90) then
                    a = {6,0,0,0,1,8};
                end
            else --Regime 91-100
                if (regimeid == 91) then
                    a = {6,0,0,0,2,6};
                elseif (regimeid == 92) then
                    a = {4,2,0,0,3,6};
                elseif (regimeid == 93) then
                    a = {4,3,0,0,3,6};
                elseif (regimeid == 94) then
                    a = {4,2,0,0,7,11};
                elseif (regimeid == 95) then
                    a = {3,3,0,0,8,12};
                elseif (regimeid == 96) then
                    a = {3,4,0,0,12,16};
                elseif (regimeid == 97) then
                    a = {4,4,0,0,26,32};
                elseif (regimeid == 98) then
                    a = {2,5,0,0,26,34};
                elseif (regimeid == 99) then
                    a = {3,5,0,0,27,33};
                elseif (regimeid == 100) then
                    a = {5,3,0,0,36,38};
                end
            end
        elseif (regimeid > 100 and regimeid <= 146) then
            if (regimeid > 100 and regimeid <= 110) then
                if (regimeid == 101) then
                    a = {3,2,0,0,41,44};
                elseif (regimeid == 102) then
                    a = {3,2,0,0,41,46};
                elseif (regimeid == 103) then
                    a = {3,2,0,0,43,47};
                elseif (regimeid == 104) then
                    a = {4,4,0,0,62,66};
                elseif (regimeid == 105) then
                    a = {4,5,0,0,64,68};
                elseif (regimeid == 106) then
                    a = {4,5,0,0,64,69};
                elseif (regimeid == 107) then
                    a = {7,3,0,0,66,74};
                elseif (regimeid == 108) then
                    a = {4,5,0,0,71,79};
                elseif (regimeid == 109) then
                    a = {10,0,0,0,30,34};
                elseif (regimeid == 110) then
                    a = {3,1,7,0,35,40};
                end
            elseif (regimeid > 110 and regimeid <= 120) then
                if (regimeid == 111) then
                    a = {3,1,7,0,35,44};
                elseif (regimeid == 112) then
                    a = {5,2,2,1,44,49};
                elseif (regimeid == 113) then
                    a = {3,3,2,1,45,49};
                elseif (regimeid == 114) then
                    a = {7,2,0,0,40,44};
                elseif (regimeid == 115) then
                    a = {7,3,0,0,41,46};
                elseif (regimeid == 116) then
                    a = {7,3,0,0,41,46};
                elseif (regimeid == 117) then
                    a = {7,3,0,0,42,47};
                elseif (regimeid == 118) then
                    a = {3,5,0,0,44,50};
                elseif (regimeid == 119) then
                    a = {3,3,0,0,60,65};
                elseif (regimeid == 120) then
                    a = {7,0,0,0,64,69};
                end
            elseif (regimeid > 120 and regimeid <= 130) then
                if (regimeid == 121) then
                    a = {7,0,0,0,65,69};
                elseif (regimeid == 122) then
                    a = {6,1,0,0,78,82};
                elseif (regimeid == 123) then
                    a = {6,1,0,0,79,82};
                elseif (regimeid == 124) then
                    a = {4,5,0,0,30,35};
                elseif (regimeid == 125) then
                    a = {7,4,0,0,32,37};
                elseif (regimeid == 126) then
                    a = {10,0,0,0,34,36};
                elseif (regimeid == 127) then
                    a = {4,6,0,0,34,38};
                elseif (regimeid == 128) then
                    a = {4,6,0,0,34,41};
                elseif (regimeid == 129) then
                    a = {3,6,0,0,35,39};
                elseif (regimeid == 130) then
                    a = {3,6,0,0,35,40};
                end
            elseif (regimeid > 130 and regimeid <= 140) then
                if (regimeid == 131) then
                    a = {10,0,0,0,40,44};
                elseif (regimeid == 132) then
                    a = {7,3,0,0,40,46};
                elseif (regimeid == 133) then
                    a = {10,0,0,0,45,49};
                elseif (regimeid == 134) then
                    a = {7,3,0,0,40,45};
                elseif (regimeid == 135) then
                    a = {5,1,4,0,44,49};
                elseif (regimeid == 136) then
                    a = {10,1,0,0,47,53};
                elseif (regimeid == 137) then
                    a = {2,8,0,0,51,56};
                elseif (regimeid == 138) then
                    a = {4,6,0,0,54,58};
                elseif (regimeid == 139) then
                    a = {5,2,0,0,66,72};
                elseif (regimeid == 140) then
                    a = {5,1,0,0,66,74};
                end
            else --Regime 140-146
                if (regimeid == 141) then
                    a = {4,1,0,0,69,74};
                elseif (regimeid == 142) then
                    a = {8,3,0,0,72,76};
                elseif (regimeid == 143) then
                    a = {8,3,0,0,73,78};
                elseif (regimeid == 144) then
                    a = {11,0,0,0,75,78};
                elseif (regimeid == 145) then
                    a = {2,2,2,0,78,79};
                elseif (regimeid == 146) then
                    a = {2,2,2,0,78,79};
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
                    a = {4,1,0,0,3,5};
                elseif (regimeid == 603) then
                    a = {5,1,0,0,25,30};
                elseif (regimeid == 604) then
                    a = {4,2,0,0,26,30};
                elseif (regimeid == 605) then
                    a = {4,2,0,0,26,30};
                elseif (regimeid == 606) then
                    a = {4,2,0,0,30,34};
                elseif (regimeid == 607) then
                    a = {5,2,0,0,87,92};
                elseif (regimeid == 608 or regimeid == 609) then
                    a = {3,3,0,0,88,90};
                elseif (regimeid == 610) then
                    a = {5,0,0,0,52,54};
                elseif (regimeid == 611) then
                    a = {4,2,0,0,52,59};
                end
            elseif (regimeid > 611 and regimeid <= 621) then
                if (regimeid == 612) then
                    a = {5,1,0,0,56,63};
                elseif (regimeid == 613) then
                    a = {9,0,0,0,65,68};
                elseif (regimeid == 614) then
                    a = {6,1,0,0,94,97};
                elseif (regimeid == 615) then
                    a = {6,1,0,0,95,97};
                elseif (regimeid == 616) then
                    a = {6,0,0,0,96,97};
                elseif (regimeid == 617) then
                    a = {2,5,0,0,95,99};
                elseif (regimeid == 618) then
                    a = {3,3,0,0,47,52};
                elseif (regimeid == 619) then
                    a = {2,2,2,0,52,57};
                elseif (regimeid == 620) then
                    a = {3,3,0,0,53,57};
                elseif (regimeid == 621) then
                    a = {3,4,0,0,60,65};
                end
            elseif (regimeid > 621 and regimeid <= 631) then
                if (regimeid == 622) then
                    a = {4,3,0,0,95,97};
                elseif (regimeid == 623) then
                    a = {5,2,0,0,95,98};
                elseif (regimeid == 624) then
                    a = {5,2,0,0,96,98};
                elseif (regimeid == 625) then
                    a = {8,2,0,0,94,99};
                elseif (regimeid == 626) then
                    a = {3,0,0,0,1,3};
                elseif (regimeid == 627) then
                    a = {3,0,0,0,2,4};
                elseif (regimeid == 628) then
                    a = {5,2,0,0,75,78};
                elseif (regimeid == 629) then
                    a = {5,2,0,0,75,79};
                elseif (regimeid == 630) then
                    a = {5,2,0,0,75,80};
                elseif (regimeid == 631) then
                    a = {3,3,0,0,3,8};
                end
            elseif (regimeid > 631 and regimeid <= 641) then
                if (regimeid == 632) then
                    a = {4,2,0,0,5,11};
                elseif (regimeid == 633) then
                    a = {2,2,2,0,12,16};
                elseif (regimeid == 634) then
                    a = {3,3,0,0,14,17};
                elseif (regimeid == 635) then
                    a = {2,2,2,0,21,23};
                elseif (regimeid == 636) then
                    a = {6,1,0,0,78,80};
                elseif (regimeid == 637) then
                    a = {5,2,0,0,77,80};
                elseif (regimeid == 638) then
                    a = {5,2,0,0,80,83};
                elseif (regimeid == 639) then
                    a = {4,1,0,0,3,8};
                elseif (regimeid == 640) then
                    a = {3,2,0,0,5,9};
                elseif (regimeid == 641) then
                    a = {3,2,0,0,11,14};
                end
            else -- 642-651
                if (regimeid == 642) then
                    a = {4,2,0,0,86,89};
                elseif (regimeid == 643) then
                    a = {5,2,0,0,86,90};
                elseif (regimeid == 644) then
                    a = {5,2,0,0,86,90};
                elseif (regimeid == 645) then
                    a = {2,2,2,0,90,91};
                elseif (regimeid == 646) then
                    a = {5,2,0,0,90,93};
                elseif (regimeid == 647) then
                    a = {2,3,0,0,1,6};
                elseif (regimeid == 648) then
                    a = {2,3,0,0,1,7};
                elseif (regimeid == 649) then
                    a = {3,2,0,0,15,20};
                elseif (regimeid == 650) then
                    a = {4,2,0,0,22,26};
                elseif (regimeid == 651) then
                    a = {3,3,0,0,78,82};
                end
            end
        elseif (regimeid > 651 and regimeid <= 701) then
            if (regimeid > 651 and regimeid <= 661) then
                if (regimeid == 652) then
                    a = {3,3,0,0,79,82};
                elseif (regimeid == 653) then
                    a = {2,4,0,0,81,83};
                elseif (regimeid == 654) then
                    a = {2,4,0,0,81,84};
                elseif (regimeid == 655) then
                    a = {3,3,0,0,18,21};
                elseif (regimeid == 656) then
                    a = {4,2,0,0,21,27};
                elseif (regimeid == 657) then
                    a = {5,1,0,0,17,26};
                elseif (regimeid == 658) then
                    a = {3,3,0,0,23,26};
                elseif (regimeid == 659) then
                    a = {4,2,0,0,26,28};
                elseif (regimeid == 660) then
                    a = {4,1,0,0,29,34};
                elseif (regimeid == 661) then
                    a = {3,3,0,0,84,86};
                end
            elseif (regimeid > 661 and regimeid <= 671) then
                if (regimeid == 662) then
                    a = {3,3,0,0,86,88};
                elseif (regimeid == 663) then
                    a = {1,1,1,1,10,14};
                elseif (regimeid == 664) then
                    a = {1,1,1,1,15,19};
                elseif (regimeid == 665) then
                    a = {1,1,1,1,20,24};
                elseif (regimeid == 666) then
                    a = {1,1,1,1,25,29};
                elseif (regimeid == 667) then
                    a = {1,1,1,1,30,34};
                elseif (regimeid == 668) then
                    a = {1,1,1,1,35,39};
                elseif (regimeid == 669) then
                    a = {5,1,0,0,81,85};
                elseif (regimeid == 670) then
                    a = {5,1,0,0,82,85};
                elseif (regimeid == 671) then
                    a = {6,0,0,0,42,46};
                end
            elseif (regimeid > 671 and regimeid <= 681) then
                if (regimeid == 672) then
                    a = {6,0,0,0,46,49};
                elseif (regimeid == 673) then
                    a = {4,2,0,0,51,54};
                elseif (regimeid == 674) then
                    a = {5,1,0,0,50,55};
                elseif (regimeid == 675) then
                    a = {3,3,0,0,53,56};
                elseif (regimeid == 676) then
                    a = {3,3,0,0,60,63};
                elseif (regimeid == 677) then
                    a = {3,3,0,0,91,95};
                elseif (regimeid == 678) then
                    a = {3,3,0,0,91,95};
                elseif (regimeid == 679) then
                    a = {6,0,0,0,20,27};
                elseif (regimeid == 680) then
                    a = {2,4,0,0,20,24};
                elseif (regimeid == 681) then
                    a = {2,4,0,0,21,26};
                end
            elseif (regimeid > 681 and regimeid <= 691) then
                if (regimeid == 682) then
                    a = {2,2,2,0,28,31};
                elseif (regimeid == 683) then
                    a = {3,3,0,0,30,34};
                elseif (regimeid == 684) then
                    a = {3,3,0,0,32,36};
                elseif (regimeid == 685) then
                    a = {2,5,0,0,85,87};
                elseif (regimeid == 686) then
                    a = {2,5,0,0,85,89};
                elseif (regimeid == 687) then
                    a = {3,3,0,0,40,44};
                elseif (regimeid == 688) then
                    a = {3,3,0,0,45,49};
                elseif (regimeid == 689) then
                    a = {3,3,0,0,49,52};
                elseif (regimeid == 690) then
                    a = {4,2,0,0,50,54};
                elseif (regimeid == 691) then
                    a = {2,2,2,0,53,58};
                end
            else -- 691-701
                if (regimeid == 692) then
                    a = {3,3,0,0,59,63};
                elseif (regimeid == 693) then
                    a = {4,3,0,0,91,93};
                elseif (regimeid == 694) then
                    a = {4,3,0,0,92,96};
                elseif (regimeid == 695) then
                    a = {3,2,0,0,15,18};
                elseif (regimeid == 696) then
                    a = {4,2,0,0,18,23};
                elseif (regimeid == 697) then
                    a = {2,4,0,0,22,26};
                elseif (regimeid == 698) then
                    a = {2,4,0,0,26,31};
                elseif (regimeid == 699) then
                    a = {4,2,0,0,26,31};
                elseif (regimeid == 700) then
                    a = {5,1,0,0,27,33};
                elseif (regimeid == 701) then
                    a = {3,3,0,0,83,85};
                end
            end
        elseif (regimeid > 701 and regimeid <= 751) then
            if (regimeid > 701 and regimeid <= 711) then
                if (regimeid == 702) then
                    a = {3,3,0,0,86,88};
                elseif (regimeid == 703) then
                    a = {4,2,0,0,40,43};
                elseif (regimeid == 704) then
                    a = {4,2,0,0,40,44};
                elseif (regimeid == 705) then
                    a = {2,4,0,0,46,49};
                elseif (regimeid == 706) then
                    a = {4,2,0,0,51,55};
                elseif (regimeid == 707) then
                    a = {3,3,0,0,52,58};
                elseif (regimeid == 708) then
                    a = {2,2,1,0,59,62};
                elseif (regimeid == 709) then
                    a = {5,2,0,0,91,96};
                elseif (regimeid == 710) then
                    a = {4,3,0,0,92,96};
                elseif (regimeid == 711) then
                    a = {4,2,0,0,40,43};
                end
            elseif (regimeid > 711 and regimeid <= 721) then
                if (regimeid == 712) then
                    a = {4,2,0,0,43,46};
                elseif (regimeid == 713) then
                    a = {5,1,0,0,50,55};
                elseif (regimeid == 714) then
                    a = {4,2,0,0,50,56};
                elseif (regimeid == 715) then
                    a = {5,1,0,0,50,58};
                elseif (regimeid == 716) then
                    a = {3,3,0,0,59,63};
                elseif (regimeid == 717) then
                    a = {4,2,0,0,95,99};
                elseif (regimeid == 718) then
                    a = {4,3,0,0,95,99};
                elseif (regimeid == 719) then
                    a = {3,3,0,0,60,63};
                elseif (regimeid == 720) then
                    a = {4,3,0,0,62,66};
                elseif (regimeid == 721) then
                    a = {4,3,0,0,62,67};
                end
            elseif (regimeid > 721 and regimeid <= 731) then
                if (regimeid == 722) then
                    a = {4,2,0,0,72,75};
                elseif (regimeid == 723) then
                    a = {3,4,0,0,72,76};
                elseif (regimeid == 724) then
                    a = {4,3,0,0,72,78};
                elseif (regimeid == 725) then
                    a = {3,3,0,0,74,78};
                elseif (regimeid == 726) then
                    a = {2,2,2,0,102,105};
                elseif (regimeid == 727) then
                    a = {2,4,0,0,20,26};
                elseif (regimeid == 728) then
                    a = {3,3,0,0,22,30};
                elseif (regimeid == 729) then
                    a = {4,2,0,0,23,31};
                elseif (regimeid == 730) then
                    a = {6,0,0,0,28,31};
                elseif (regimeid == 731) then
                    a = {3,3,0,0,29,33};
                end
            elseif (regimeid > 731 and regimeid <= 741) then
                if (regimeid == 732) then
                    a = {4,0,0,0,30,33};
                elseif (regimeid == 733) then
                    a = {6,0,0,0,35,37};
                elseif (regimeid == 734) then
                    a = {4,3,0,0,87,91};
                elseif (regimeid == 735) then
                    a = {3,3,0,0,60,64};
                elseif (regimeid == 736) then
                    a = {5,1,0,0,60,66};
                elseif (regimeid == 737) then
                    a = {3,3,0,0,60,66};
                elseif (regimeid == 738) then
                    a = {4,2,0,0,60,67};
                elseif (regimeid == 739) then
                    a = {3,3,0,0,63,69};
                elseif (regimeid == 740) then
                    a = {3,3,0,0,65,69};
                elseif (regimeid == 741) then
                    a = {3,3,0,0,77,80};
                end
            else -- 741-751
                if (regimeid == 742) then
                    a = {3,3,0,0,99,103};
                elseif (regimeid == 743) then
                    a = {10,0,0,0,72,72};
                elseif (regimeid == 744) then
                    a = {7,0,0,0,74,77};
                elseif (regimeid == 745) then
                    a = {7,0,0,0,75,78};
                elseif (regimeid == 746) then
                    a = {7,0,0,0,76,79};
                elseif (regimeid == 747) then
                    a = {7,0,0,0,77,80};
                elseif (regimeid == 748) then
                    a = {6,0,0,0,79,80};
                elseif (regimeid == 749) then
                    a = {10,0,0,0,71,71};
                elseif (regimeid == 750) then
                    a = {6,0,0,0,71,74};
                elseif (regimeid == 751) then
                    a = {7,0,0,0,75,80};
                end
            end
        elseif (regimeid > 751 and regimeid <= 803) then
            if (regimeid > 751 and regimeid <= 761) then
                if (regimeid == 752) then
                    a = {7,0,0,0,77,82};
                elseif (regimeid == 753) then
                    a = {7,0,0,0,79,82};
                elseif (regimeid == 754) then
                    a = {7,0,0,0,81,84};
                elseif (regimeid == 755 or regimeid == 756) then
                    a = {4,1,0,0,61,68};
                elseif (regimeid == 757) then
                    a = {4,1,0,0,62,69};
                elseif (regimeid == 758) then
                    a = {3,2,0,0,62,73};
                elseif (regimeid == 759) then
                    a = {3,2,0,0,62,73};
                elseif (regimeid == 760) then
                    a = {4,2,0,0,69,74};
                elseif (regimeid == 761 or regimeid == 762) then
                    a = {4,2,0,0,71,78};
                end
            elseif (regimeid > 762 and regimeid <= 772) then
                if (regimeid == 763) then
                    a = {2,2,1,0,44,49};
                elseif (regimeid == 764) then
                    a = {2,2,2,0,45,49};
                elseif (regimeid == 765) then
                    a = {3,2,1,0,65,68};
                elseif (regimeid == 766) then
                    a = {3,3,0,0,73,76};
                elseif (regimeid == 767) then
                    a = {5,1,0,0,75,78};
                elseif (regimeid == 768) then
                    a = {5,1,0,0,75,79};
                elseif (regimeid == 769) then
                    a = {4,2,0,0,76,80};
                elseif (regimeid == 770) then
                    a = {5,2,0,0,100,103};
                elseif (regimeid == 771) then
                    a = {2,3,0,0,45,49};
                elseif (regimeid == 772) then
                    a = {3,2,0,0,50,53};
                end
            elseif (regimeid > 772 and regimeid <= 782) then
                if (regimeid == 773) then
                    a = {3,2,0,0,50,54};
                elseif (regimeid == 774) then
                    a = {3,2,0,0,55,59};
                elseif (regimeid == 775) then
                    a = {4,1,0,0,70,74};
                elseif (regimeid == 776) then
                    a = {4,2,0,0,95,98};
                elseif (regimeid == 777 or regimeid == 778) then
                    a = {3,3,0,0,25,30};
                elseif (regimeid == 779) then
                    a = {3,3,0,0,25,30};
                elseif (regimeid == 780) then
                    a = {4,2,0,0,25,32};
                elseif (regimeid == 781) then
                    a = {4,2,0,0,25,35};
                elseif (regimeid == 782 or regimeid == 783) then
                    a = {4,3,0,0,25,34};
                end
            elseif (regimeid > 783 and regimeid <= 793) then
                if (regimeid == 784) then
                    a = {4,4,0,0,30,34};
                elseif (regimeid == 785) then
                    a = {6,0,0,0,34,35};
                elseif (regimeid == 786 or regimeid == 787) then
                    a = {2,2,2,0,62,69};
                elseif (regimeid == 788 or regimeid == 789) then
                    a = {2,2,2,0,65,69};
                elseif (regimeid == 790) then
                    a = {3,3,0,0,51,57};
                elseif (regimeid == 791 or regimeid == 792) then
                    a = {4,2,0,0,51,57};
                elseif (regimeid == 793) then
                    a = {3,3,0,0,61,63};
                end
            else -- 793-803
                if (regimeid == 794) then
                    a = {3,3,0,0,61,67};
                elseif (regimeid == 795) then
                    a = {3,3,0,0,61,68};
                elseif (regimeid == 796) then
                    a = {3,3,0,0,60,64};
                elseif (regimeid == 797) then
                    a = {4,2,0,0,60,67};
                elseif (regimeid == 798) then
                    a = {6,0,0,0,62,69};
                elseif (regimeid == 799) then
                    a = {4,2,0,0,62,69};
                elseif (regimeid == 800) then
                    a = {4,2,0,0,62,76};
                elseif (regimeid == 801) then
                    a = {5,0,0,0,73,81};
                elseif (regimeid == 802) then
                    a = {3,3,0,0,74,79};
                end
            end
        elseif (regimeid > 803 and regimeid <= 819) then
            if (regimeid > 803 and regimeid <= 813) then
                if (regimeid == 803) then
                    a = {4,2,0,0,75,80};
                elseif (regimeid == 804) then
                    a = {3,3,0,0,35,39};
                elseif (regimeid == 805) then
                    a = {2,4,0,0,37,41};
                elseif (regimeid == 806) then
                    a = {5,1,0,0,41,45};
                elseif (regimeid == 807) then
                    a = {2,2,2,0,43,48};
                elseif (regimeid == 808) then
                    a = {4,2,0,0,44,48};
                elseif (regimeid == 809) then
                    a = {3,3,0,0,62,67};
                elseif (regimeid == 810) then
                    a = {3,3,0,0,62,69};
                elseif (regimeid == 811) then
                    a = {3,3,0,0,66,69};
                elseif (regimeid == 812) then
                    a = {3,3,0,0,51,55};
                elseif (regimeid == 813) then
                    a = {3,3,0,0,51,58};
                end
            else
                if (regimeid == 814) then
                    a = {3,3,0,0,51,59};
                elseif (regimeid == 815) then
                    a = {7,0,0,0,52,59};
                elseif (regimeid == 816) then
                    a = {3,3,0,0,52,59};
                elseif (regimeid == 817) then
                    a = {3,3,0,0,56,59};
                elseif (regimeid == 818) then
                    a = {3,3,0,0,62,65};
                elseif (regimeid == 819) then
                    a = {3,3,0,0,65,69};
                end
            end
        end
    else
        -- print("Warning: Regime ID not found! Returning blank array.");
        a = {0,0,0,0,0,0};
        return a;
    end
end
