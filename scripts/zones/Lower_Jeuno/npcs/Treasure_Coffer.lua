-----------------------------------
-- Area: Lower Jeuno
--  NPC: Treasure Coffer
-- Type: Add-on NPC
--  @pos 41.169 3.899 -51.005 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x2773,0,0,0,0,0,0,0,0);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);

    local random = 0;
    local prize = 0;
    local aug1 = 0;
    local aug2 = 0;
    local aug3 = 0;
    local aug4 = 0;
    local a1 = 0;
    local a2 = 0;
    local a3 = 0;
    local a4 = 0;
    local v1 = 0;
    local v2 = 0;
    local v3 = 0;
    local v4 = 0;

    if (csid == 0x2773) then
        if (option == 16777216) then
            if (player:getFreeSlotsCount() >= 1) then
                player:addItem(11538);
                player:messageSpecial(ITEM_OBTAINED,11538);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,11538);
            end

        elseif (option == 33554432) then
            if (player:hasItem(11538) == false) then
                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(11538);
                    player:messageSpecial(ITEM_OBTAINED,11538);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,277);
                end
            end

        elseif (option == 1) then
            if (player:hasKeyItem(CRIMSON_KEY) == true) then
                random = math.random(1,1003);
                if (random >= 1 and random <= 70) then -- Gold Obi
                    prize = 13206;

                    aug1 = math.random(0,6);
                    if (aug1 == 1) then
                        a1 = 9;
                        v1 = math.random(0,5);
                    elseif (aug1 == 2) then
                        a1 = 516;
                        v1 = math.random(0,1);
                    elseif (aug1 == 3) then
                        a1 = 517;
                        v1 = math.random(0,1);
                    elseif (aug1 == 4) then
                        a1 = 518;
                        v1 = math.random(0,1);
                    elseif (aug1 == 5) then
                        a1 = 32;
                        v1 = math.random(0,1);
                    elseif (aug1 == 6) then
                        a1 = 96;
                        v1 = math.random(0,1);
                    end

                    aug2 = math.random(0,6);
                    if (aug2 ~= aug1) then
                        if (aug2 == 1) then
                            a2 = 9;
                            v2 = math.random(0,5);
                        elseif (aug2 == 2) then
                            a2 = 516;
                            v2 = math.random(0,1);
                        elseif (aug2 == 3) then
                            a2 = 517;
                            v2 = math.random(0,1);
                        elseif (aug2 == 4) then
                            a2 = 518;
                            v2 = math.random(0,1);
                        elseif (aug2 == 5) then
                            a2 = 32;
                            v2 = math.random(0,1);
                        elseif (aug2 == 6) then
                            a2 = 96;
                            v2 = math.random(0,1);
                        end
                    end

                    aug3 = math.random(0,6);
                    if (aug3 ~= aug1 and aug3 ~= aug2) then
                        if (aug3 == 1) then
                            a3 = 9;
                            v3 = math.random(0,5);
                        elseif (aug3 == 2) then
                            a3 = 516;
                            v3 = math.random(0,1);
                        elseif (aug3 == 3) then
                            a3 = 517;
                            v3 = math.random(0,1);
                        elseif (aug3 == 4) then
                            a3 = 518;
                            v3 = math.random(0,1);
                        elseif (aug3 == 5) then
                            a3 = 32;
                            v3 = math.random(0,1);
                        elseif (aug3 == 6) then
                            a3 = 96;
                            v3 = math.random(0,1);
                        end
                    end

                    aug4 = math.random(0,6);
                    if (aug4 ~= aug1 and aug4 ~= aug2 and aug4 ~= aug3) then
                        if (aug4 == 1) then
                            a4 = 9;
                            v4 = math.random(0,5);
                        elseif (aug4 == 2) then
                            a4 = 516;
                            v4 = math.random(0,1);
                        elseif (aug4 == 3) then
                            a4 = 517;
                            v4 = math.random(0,1);
                        elseif (aug4 == 4) then
                            a4 = 518;
                            v4 = math.random(0,1);
                        elseif (aug4 == 5) then
                            a4 = 32;
                            v4 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a4 = 96;
                            v4 = math.random(0,1);
                        end
                    end

                elseif (random >= 71 and random <= 80) then -- Gold Ring
                    prize = 13445;

                    aug1 = math.random(0,6);
                    if (aug1 == 1) then
                        a1 = 9;
                        v1 = math.random(0,8);
                    elseif (aug1 == 2) then
                        a1 = 516;
                        v1 = math.random(0,1);
                    elseif (aug1 == 3) then
                        a1 = 517;
                        v1 = math.random(0,1);
                    elseif (aug1 == 4) then
                        a1 = 518;
                        v1 = math.random(0,2);
                    elseif (aug1 == 5) then
                        a1 = 39;
                        v1 = math.random(0,1);
                    elseif (aug1 == 6) then
                        a1 = 35;
                        v1 = math.random(0,2);
                    end

                    aug2 = math.random(0,6);
                    if (aug2 ~= aug1) then
                        if (aug2 == 1) then
                            a2 = 9;
                            v2 = math.random(0,8);
                        elseif (aug2 == 2) then
                            a2 = 516;
                            v2 = math.random(0,1);
                        elseif (aug2 == 3) then
                            a2 = 517;
                            v2 = math.random(0,1);
                        elseif (aug2 == 4) then
                            a2 = 518;
                            v2 = math.random(0,2);
                        elseif (aug2 == 5) then
                            a2 = 39;
                            v2 = math.random(0,1);
                        elseif (aug2 == 6) then
                            a2 = 35;
                            v2 = math.random(0,2);
                        end
                    end

                    aug3 = math.random(0,6);
                    if (aug3 ~= aug1 and aug3 ~= aug2) then
                        if (aug3 == 1) then
                            a3 = 9;
                            v3 = math.random(0,8);
                        elseif (aug3 == 2) then
                            a3 = 516;
                            v3 = math.random(0,1);
                        elseif (aug3 == 3) then
                            a3 = 517;
                            v3 = math.random(0,1);
                        elseif (aug3 == 4) then
                            a3 = 518;
                            v3 = math.random(0,2);
                        elseif (aug3 == 5) then
                            a3 = 39;
                            v3 = math.random(0,1);
                        elseif (aug3 == 6) then
                            a3 = 35;
                            v3 = math.random(0,2);
                        end
                    end

                    aug4 = math.random(0,6);
                    if (aug4 ~= aug1 and aug4 ~= aug2 and aug4 ~= aug3) then
                        if (aug4 == 1) then
                            a4 = 9;
                            v4 = math.random(0,8);
                        elseif (aug4 == 2) then
                            a4 = 516;
                            v4 = math.random(0,1);
                        elseif (aug4 == 3) then
                            a4 = 517;
                            v4 = math.random(0,1);
                        elseif (aug4 == 4) then
                            a4 = 518;
                            v4 = math.random(0,2);
                        elseif (aug4 == 5) then
                            a4 = 39;
                            v4 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a4 = 35;
                            v4 = math.random(0,2);
                        end
                    end

                elseif (random >= 81 and random <= 186) then -- Mythril Ring
                    prize = 13446;

                    aug1 = math.random(0,6);
                    if (aug1 == 1) then
                        a1 = 1;
                        v1 = math.random(0,15);
                    elseif (aug1 == 2) then
                        a1 = 13;
                        v1 = math.random(0,2);
                    elseif (aug1 == 3) then
                        a1 = 25;
                        v1 = math.random(0,5);
                    elseif (aug1 == 4) then
                        a1 = 31;
                        v1 = math.random(0,2);
                    elseif (aug1 == 5) then
                        a1 = 195;
                        v1 = math.random(0,1);
                    elseif (aug1 == 6) then
                        a1 = 35;
                        v1 = math.random(0,2);
                    end

                    aug2 = math.random(0,6);
                    if (aug2 ~= aug1) then
                        if (aug2 == 1) then
                            a2 = 1;
                            v2 = math.random(0,15);
                        elseif (aug1 == 2) then
                            a2 = 13;
                            v2 = math.random(0,2);
                        elseif (aug2 == 3) then
                            a2 = 25;
                            v2 = math.random(0,5);
                        elseif (aug2 == 4) then
                            a2 = 31;
                            v2 = math.random(0,2);
                        elseif (aug2 == 5) then
                            a2 = 195;
                            v2 = math.random(0,1);
                        elseif (aug2 == 6) then
                            a2 = 35;
                            v2 = math.random(0,2);
                        end
                    end

                    aug3 = math.random(0,6);
                    if (aug3 ~= aug1 and aug3 ~= aug2) then
                        if (aug3 == 1) then
                            a3 = 1;
                            v3 = math.random(0,15);
                        elseif (aug3 == 2) then
                            a3 = 13;
                            v3 = math.random(0,2);
                        elseif (aug3 == 3) then
                            a3 = 25;
                            v3 = math.random(0,5);
                        elseif (aug3 == 4) then
                            a3 = 31;
                            v3 = math.random(0,2);
                        elseif (aug3 == 5) then
                            a3 = 195;
                            v3 = math.random(0,1);
                        elseif (aug3 == 6) then
                            a3 = 35;
                            v3 = math.random(0,2);
                        end
                    end

                    aug4 = math.random(0,6);
                    if (aug4 ~= aug1 and aug4 ~= aug2 and aug4 ~= aug3) then
                        if (aug4 == 1) then
                            a4 = 1;
                            v4 = math.random(0,15);
                        elseif (aug4 == 2) then
                            a4 = 13;
                            v4 = math.random(0,2);
                        elseif (aug4 == 3) then
                            a4 = 25;
                            v4 = math.random(0,5);
                        elseif (aug4 == 4) then
                            a4 = 31;
                            v4 = math.random(0,2);
                        elseif (aug4 == 5) then
                            a4 = 195;
                            v4 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a4 = 35;
                            v4 = math.random(0,2);
                        end
                    end
                elseif (random >= 187 and random <= 276) then -- Sarcenet Cape
                    prize = 13643;

                    aug1 = math.random(0,6);
                    if (aug1 == 1) then
                        a1 = 9;
                        v1 = math.random(0,5);
                    elseif (aug4 == 2) then
                        a1 = 516;
                        v1 = math.random(0,1);
                    elseif (aug4 == 3) then
                        a1 = 517;
                        v1 = math.random(0,1);
                    elseif (aug4 == 4) then
                        a1 = 518;
                        v1 = math.random(0,1);
                    elseif (aug4 == 5) then
                        a1 = 100;
                        v1 = math.random(0,1);
                    elseif (aug4 == 6) then
                        a1 = 39;
                        v1 = math.random(0,1);
                    end

                    aug2 = math.random(0,6);
                    if (aug2 ~= aug1) then
                        if (aug2 == 1) then
                            a2 = 9;
                            v2 = math.random(0,5);
                        elseif (aug4 == 2) then
                            a2 = 516;
                            v2 = math.random(0,1);
                        elseif (aug4 == 3) then
                            a2 = 517;
                            v2 = math.random(0,1);
                        elseif (aug4 == 4) then
                            a2 = 518;
                            v2 = math.random(0,1);
                        elseif (aug4 == 5) then
                            a2 = 100;
                            v2 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a2 = 39;
                            v2 = math.random(0,1);
                        end
                    end

                    aug3 = math.random(0,6);
                    if (aug3 ~= aug1 and aug3 ~= aug2) then
                        if (aug3 == 1) then
                            a3 = 9;
                            v3 = math.random(0,5);
                        elseif (aug4 == 2) then
                            a3 = 516;
                            v3 = math.random(0,1);
                        elseif (aug4 == 3) then
                            a3 = 517;
                            v3 = math.random(0,1);
                        elseif (aug4 == 4) then
                            a3 = 518;
                            v3 = math.random(0,1);
                        elseif (aug4 == 5) then
                            a3 = 100;
                            v3 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a3 = 39;
                            v3 = math.random(0,1);
                        end
                    end

                    aug4 = math.random(0,6);
                    if (aug4 ~= aug1 and aug4 ~= aug2 and aug4 ~= aug3) then
                        if (aug4 == 1) then
                            a4 = 9;
                            v4 = math.random(0,5);
                        elseif (aug4 == 2) then
                            a4 = 516;
                            v4 = math.random(0,1);
                        elseif (aug4 == 3) then
                            a4 = 517;
                            v4 = math.random(0,1);
                        elseif (aug4 == 4) then
                            a4 = 518;
                            v4 = math.random(0,1);
                        elseif (aug4 == 5) then
                            a4 = 100;
                            v4 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a4 = 39;
                            v4 = math.random(0,1);
                        end
                    end
                elseif (random >= 277 and random <= 351) then -- Silver Belt
                    prize = 13196;

                    aug1 = math.random(0,6);
                    if (aug1 == 1) then
                        a1 = 1;
                        v1 = math.random(0,5);
                    elseif (aug1 == 2) then
                        a1 = 23;
                        v1 = math.random(0,1);
                    elseif (aug1 == 3) then
                        a1 = 27;
                        v1 = math.random(0,1);
                    elseif (aug1 == 4) then
                        a1 = 512;
                        v1 = math.random(0,1);
                    elseif (aug1 == 5) then
                        a1 = 520;
                        v1 = math.random(0,1);
                    elseif (aug1 == 6) then
                        a1 = 515;
                        v1 = math.random(0,1);
                    end

                    aug2 = math.random(0,6);
                    if (aug2 ~= aug1) then
                        if (aug2 == 1) then
                            a2 = 1;
                            v2 = math.random(0,5);
                        elseif (aug2 == 2) then
                            a2 = 23;
                            v2 = math.random(0,1);
                        elseif (aug2 == 3) then
                            a2 = 27;
                            v2 = math.random(0,1);
                        elseif (aug2 == 4) then
                            a2 = 512;
                            v2 = math.random(0,1);
                        elseif (aug2 == 5) then
                            a2 = 520;
                            v2 = math.random(0,1);
                        elseif (aug2 == 6) then
                            a2 = 515;
                            v2 = math.random(0,1);
                        end
                    end

                    aug3 = math.random(0,6);
                    if (aug3 ~= aug1 and aug3 ~= aug2) then
                        if (aug3 == 1) then
                            a3 = 1;
                            v3 = math.random(0,5);
                        elseif (aug3 == 2) then
                            a3 = 23;
                            v3 = math.random(0,1);
                        elseif (aug3 == 3) then
                            a3 = 27;
                            v3 = math.random(0,1);
                        elseif (aug3 == 4) then
                            a3 = 512;
                            v3 = math.random(0,1);
                        elseif (aug3 == 5) then
                            a3 = 520;
                            v3 = math.random(0,1);
                        elseif (aug3 == 6) then
                            a3 = 515;
                            v3 = math.random(0,1);
                        end
                    end

                    aug4 = math.random(0,6);
                    if (aug4 ~= aug1 and aug4 ~= aug2 and aug4 ~= aug3) then
                        if (aug4 == 1) then
                            a4 = 1;
                            v4 = math.random(0,5);
                        elseif (aug4 == 2) then
                            a4 = 23;
                            v4 = math.random(0,1);
                        elseif (aug4 == 3) then
                            a4 = 27;
                            v4 = math.random(0,1);
                        elseif (aug4 == 4) then
                            a4 = 512;
                            v4 = math.random(0,1);
                        elseif (aug4 == 5) then
                            a4 = 520;
                            v4 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a4 = 515;
                            v4 = math.random(0,1);
                        end
                    end

                elseif (random >= 352 and random <= 460) then -- Wolf Mantle
                    prize = 13571;
                    
                    aug1 = math.random(0,5);
                    if (aug1 == 1) then
                        a1 = 1;
                        v1 = math.random(0,5);
                    elseif (aug1 == 2) then
                        a1 = 25;
                        v1 = math.random(0,3);
                    elseif (aug1 == 3) then
                        a1 = 29;
                        v1 = math.random(0,3);
                    elseif (aug1 == 4) then
                        a1 = 512;
                        v1 = 0;
                    elseif (aug1 == 5) then
                        a1 = 769;
                        v1 = math.random(0,1);
                    elseif (aug1 == 6) then
                        a1 = 32;
                        v1 = math.random(0,1);
                    end

                    aug2 = math.random(0,6);
                    if (aug2 ~= aug1) then
                        if (aug2 == 1) then
                            a2 = 1;
                            v2 = math.random(0,5);
                        elseif (aug2 == 2) then
                            a2 = 25;
                            v2 = math.random(0,3);
                        elseif (aug2 == 3) then
                            a2 = 29;
                            v2 = math.random(0,3);
                        elseif (aug2 == 4) then
                            a2 = 512;
                            v2 = 0;
                        elseif (aug2 == 5) then
                            a2 = 769;
                            v2 = math.random(0,1);
                        elseif (aug2 == 6) then
                            a2 = 32;
                            v2 = math.random(0,1);
                        end
                    end

                    aug3 = math.random(0,6);
                    if (aug3 ~= aug1 and aug3 ~= aug2) then
                        if (aug3 == 1) then
                            a3 = 1;
                            v3 = math.random(0,5);
                        elseif (aug3 == 2) then
                            a3 = 25;
                            v3 = math.random(0,3);
                        elseif (aug3 == 3) then
                            a3 = 29;
                            v3 = math.random(0,3);
                        elseif (aug3 == 4) then
                            a3 = 512;
                            v3 = 0;
                        elseif (aug3 == 5) then
                            a3 = 769;
                            v3 = math.random(0,1);
                        elseif (aug3 == 6) then
                            a3 = 32;
                            v3 = math.random(0,1);
                        end
                    end

                    aug4 = math.random(0,6);
                    if (aug4 ~= aug1 and aug4 ~= aug2 and aug4 ~= aug3) then
                        if (aug4 == 1) then
                            a4 = 1;
                            v4 = math.random(0,5);
                        elseif (aug4 == 2) then
                            a4 = 25;
                            v4 = math.random(0,3);
                        elseif (aug4 == 3) then
                            a4 = 29;
                            v4 = math.random(0,3);
                        elseif (aug4 == 4) then
                            a4 = 512;
                            v4 = 1
                        elseif (aug4 == 5) then
                            a4 = 769;
                            v4 = math.random(0,1);
                        elseif (aug4 == 6) then
                            a4 = 32;
                            v4 = math.random(0,1);
                        end
                    end
                elseif (random >= 461 and random <= 468) then -- Chestnut Log
                    prize = 694;
                elseif (random >= 469 and random <= 471) then -- Coral Fragment
                    prize = 887;
                elseif (random >= 472 and random <= 476) then -- Dark Spirit Pact
                    prize = 4903;
                elseif (random >= 477 and random <= 479) then -- Darksteel Ingot
                    prize = 654;
                elseif (random >= 480 and random <= 500) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 501 and random <= 523) then -- Scroll of Dispel
                    prize = 4868;
                elseif (random >= 524 and random <= 619) then -- Elixir
                    prize = 4145;
                elseif (random >= 620 and random <= 668) then -- Elm Log
                    prize = 690;
                elseif (random >= 669 and random <= 699) then -- Scroll of Erase
                    prize = 4751;
                elseif (random >= 700 and random <= 702) then -- Hi-Potion
                    prize = 4116;
                elseif (random >= 703 and random <= 723) then -- Iron Ingot
                    prize = 651;
                elseif (random >= 724 and random <= 775) then -- Iron Ore
                    prize = 643;
                elseif (random >= 776 and random <= 785) then -- Light Spirit Pact
                    prize = 4902;
                elseif (random >= 786 and random <= 821) then -- Scroll of Magic Finale
                    prize = 5070;
                elseif (random >= 821 and random <= 824) then -- Maple Log
                    prize = 691;
                elseif (random >= 825 and random <= 858) then -- Mythril Ingot
                    prize = 653;
                elseif (random >= 859 and random <= 879) then -- Mythril Ore
                    prize = 644;
                elseif (random >= 880 and random <= 884) then -- Potion +1
                    prize = 4113;
                elseif (random >= 885 and random <= 923) then -- Silver Ingot
                    prize = 744;
                elseif (random >= 924 and random <= 949) then -- Silver Ore
                    prize = 736;
                elseif (random >= 950 and random <= 993) then -- Steel Ingot
                    prize = 652;
                elseif (random >= 994 and random <= 1003) then -- Scroll of Utsisemi: Ni
                    prize = 4947;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(CRIMSON_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 2) then
            if (player:hasKeyItem(VIRIDIAN_KEY) == true) then
                random = math.random(1,1056);
                if (random >= 1 and random <= 65) then -- Aurora Mantle
                    prize = 13639;
                elseif (random >= 66 and random <= 142) then -- Corsette
                    prize = 13271;
                elseif (random >= 143 and random <= 237) then -- Nymph Shield
                    prize = 12364;
                elseif (random >= 238 and random <= 356) then -- Ram Mantle
                    prize = 13570;
                elseif (random >= 357 and random <= 457) then -- Swordbelt
                    prize = 13198;
                elseif (random >= 458 and random <= 463) then -- Brocade Obi
                    prize = 13207;
                elseif (random >= 464 and random <= 469) then -- Black Pearl
                    prize = 793;
                elseif (random >= 470 and random <= 497) then -- Black Rock
                    prize = 775;
                elseif (random >= 498 and random <= 515) then -- Blue Rock
                    prize = 770;
                elseif (random >= 516 and random <= 616) then -- Elixir
                    prize = 4145;
                elseif (random >= 617 and random <= 670) then -- Ether +1
                    prize = 4129;
                elseif (random >= 671 and random <= 676) then -- Garnet
                    prize = 790;
                elseif (random >= 677 and random <= 672) then -- Goshenite
                    prize = 808;
                elseif (random >= 673 and random <= 684) then -- Green Rock
                    prize = 772;
                elseif (random >= 685 and random <= 775) then -- Oak Log
                    prize = 669;
                elseif (random >= 776 and random <= 811) then -- Pearl
                    prize = 792;
                elseif (random >= 812 and random <= 829) then -- Peridot
                    prize = 788;
                elseif (random >= 830 and random <= 835) then -- Platinum Ore
                    prize = 738;
                elseif (random >= 836 and random <= 871) then -- Potion +1
                    prize = 4113;
                elseif (random >= 872 and random <= 877) then -- Purple Rock
                    prize = 774;
                elseif (random >= 878 and random <= 901) then -- Red Rock
                    prize = 769;
                elseif (random >= 902 and random <= 984) then -- Rosewood Log
                    prize = 701;
                elseif (random >= 985 and random <= 1008) then -- Sphene
                    prize = 815;
                elseif (random >= 1009 and random <= 1020) then -- Translucent Rock
                    prize = 773;
                elseif (random >= 1021 and random <= 1032) then -- White Rock
                    prize = 776;
                elseif (random >= 1033 and random <= 1044) then -- Yellow Rock
                    prize = 771;
                elseif (random >= 1045 and random <= 1056) then -- Turquoise
                    prize = 798;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(VIRIDIAN_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 3) then
            if (player:hasKeyItem(AMBER_KEY) == true) then
                random = math.random(1,961);
                if (random >= 1 and random <= 111) then -- Beak Necklace
                    prize = 16263;
                elseif (random >= 112 and random <= 219) then -- Brocade Obi
                    prize = 13207;
                elseif (random >= 220 and random <= 334) then -- Carapace Gorget
                    prize = 13091;
                elseif (random >= 335 and random <= 436) then -- Gold Ring
                    prize = 13445;
                elseif (random >= 437 and random <= 561) then -- Raptor Mantle
                    prize = 13593;
                elseif (random >= 562 and random <= 564) then -- Coral Fragment
                    prize = 887;
                elseif (random >= 565 and random <= 576) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 577 and random <= 599) then -- Demon Horn
                    prize = 902;
                elseif (random >= 600 and random <= 616) then -- Ebony Log
                    prize = 702;
                elseif (random >= 617 and random <= 625) then -- Gold Ore
                    prize = 737;
                elseif (random >= 626 and random <= 683) then -- Hi-Elixer
                    prize = 4144;
                elseif (random >= 684 and random <= 730) then -- Hi-Ether
                    prize = 4132;
                elseif (random >= 731 and random <= 771) then -- Hi-Potion
                    prize = 4116;
                elseif (random >= 772 and random <= 788) then -- Mahogany Log
                    prize = 700;
                elseif (random >= 789 and random <= 805) then -- Manticore Hide
                    prize = 1116;
                elseif (random >= 806 and random <= 807) then -- Petrified Log
                    prize = 703;
                elseif (random >= 808 and random <= 809) then -- Platinum Ore
                    prize = 738;
                elseif (random >= 810 and random <= 818) then -- Mythril Ore
                    prize = 644;
                elseif (random >= 819 and random <= 835) then -- Ram Horn
                    prize = 895;
                elseif (random >= 836 and random <= 876) then -- Ram Skin
                    prize = 859;
                elseif (random >= 877 and random <= 885) then -- Scroll of Raise II
                    prize = 4621;
                elseif (random >= 886 and random <= 920) then -- Scroll of Regen III
                    prize = 4719;
                elseif (random >= 921 and random <= 946) then -- Wyvern Scales
                    prize = 866;
                elseif (random >= 947 and random <= 961) then -- Wyvern Skin
                    prize = 1122;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(AMBER_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 4) then
            if (player:hasKeyItem(AZURE_KEY) == true) then
                random = math.random(1,960);
                if (random >= 1 and random <= 106) then -- Beak Mantle
                    prize = 13597;
                elseif (random >= 107 and random <= 203) then -- Coeurl Gorget
                    prize = 13092;
                elseif (random >= 204 and random <= 305) then -- Platinum Ring
                    prize = 13447;
                elseif (random >= 306 and random <= 386) then -- Rainbow Obi
                    prize = 13208;
                elseif (random >= 387 and random <= 490) then -- Torque
                    prize = 13125;
                elseif (random >= 491 and random <= 498) then -- Aquamarine
                    prize = 791;
                elseif (random >= 499 and random <= 502) then -- Chrysoberyl
                    prize = 801;
                elseif (random >= 503 and random <= 536) then -- Darksteel Ingot
                    prize = 654;
                elseif (random >= 537 and random <= 612) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 613 and random <= 659) then -- Ebony Log
                    prize = 702;
                elseif (random >= 660 and random <= 693) then -- Gold Ingot
                    prize = 745;
                elseif (random >= 694 and random <= 786) then -- Hi-Elixir
                    prize = 4144;
                elseif (random >= 787 and random <= 789) then -- Hi-Ether +1
                    prize = 4133;
                elseif (random >= 790 and random <= 831) then -- Hi-Potion +1
                    prize = 4117;
                elseif (random >= 832 and random <= 835) then -- Jadeite
                    prize = 784;
                elseif (random >= 836 and random <= 856) then -- Mahogany Log
                    prize = 700;
                elseif (random >= 857 and random <= 907) then -- Mythril Ingot
                    prize = 653;
                elseif (random >= 908 and random <= 911) then -- Ram Horn
                    prize = 895;
                elseif (random >= 912 and random <= 915) then -- Scroll of Regen III
                    prize = 4719;
                elseif (random >= 916 and random <= 948) then -- Steel Ingot
                    prize = 652;
                elseif (random >= 949 and random <= 956) then -- Sunstone
                    prize = 803;
                elseif (random >= 957 and random <= 960) then -- Wyvern Scales
                    prize = 866;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(AZURE_KEY);
                    player:setVar("LastAzureKey", os.date("%j"));
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 5) then
            if (player:hasKeyItem(IVORY_KEY) == true) then
                random = math.random(1,1172);
                if (random >= 1 and random <= 62) then -- Angels Earring
                    prize = 13357;
                elseif (random >= 63 and random <= 70) then -- Death Earring
                    prize = 13356;
                elseif (random >= 71 and random <= 113) then -- Diamond Earring
                    prize = 13353;
                elseif (random >= 114 and random <= 196) then -- Emerald Earring
                    prize = 13351;
                elseif (random >= 197 and random <= 301) then -- Ruby Earring
                    prize = 13352;
                elseif (random >= 302 and random <= 392) then -- Sapphire Earring
                    prize = 13355;
                elseif (random >= 393 and random <= 478) then -- Spinel Earring
                    prize = 13354;
                elseif (random >= 479 and random <= 497) then -- Topaz Earring
                    prize = 13318;
                elseif (random >= 498 and random <= 546) then -- Beetle Blood
                    prize = 1110;
                elseif (random >= 547 and random <= 602) then -- Gold Thread
                    prize = 823;
                elseif (random >= 603 and random <= 627) then -- Granite
                    prize = 1465;
                elseif (random >= 628 and random <= 658) then -- Hi-Ether +2
                    prize = 4134;
                elseif (random >= 659 and random <= 901) then -- Hi-Potion +2
                    prize = 4118;
                elseif (random >= 902 and random <= 963) then -- Malboro Fiber
                    prize = 837;
                elseif (random >= 964 and random <= 982) then -- Philosophers Stone
                    prize = 924;
                elseif (random >= 983 and random <= 1019) then -- Phoenix Feather
                    prize = 844;
                elseif (random >= 1020 and random <= 1062) then -- Rainbow Cloth
                    prize = 830;
                elseif (random >= 1063 and random <= 1124) then -- Raxa
                    prize = 1132;
                elseif (random >= 1133 and random <= 1172) then -- Vile Elixir
                    prize = 4174;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(IVORY_KEY);
                    player:setVar("LastIvoryKey", os.date("%j"));
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 6) then
            if (player:hasKeyItem(EBON_KEY) == true) then
                random = math.random(1,997);
                if (random >= 1 and random <= 31) then -- Angels Ring
                    prize = 13463;
                elseif (random >= 32 and random <= 82) then -- Death Ring
                    prize = 13462;
                elseif (random >= 83 and random <= 174) then -- Diamond Ring
                    prize = 13450;
                elseif (random >= 175 and random <= 225) then -- Emerald Ring
                    prize = 13448;
                elseif (random >= 226 and random <= 296) then -- Ruby Ring
                    prize = 13449;
                elseif (random >= 297 and random <= 357) then -- Sapphire Ring
                    prize = 13452;
                elseif (random >= 358 and random <= 459) then -- Spinel Ring
                    prize = 13451;
                elseif (random >= 460 and random <= 500) then -- Topaz Ring
                    prize = 13453;
                elseif (random >= 501 and random <= 510) then -- Adaman Ingot
                    prize = 655;
                elseif (random >= 511 and random <= 541) then -- Angelstone
                    prize = 813;
                elseif (random >= 542 and random <= 561) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 562 and random <= 592) then -- Deathstone
                    prize = 812;
                elseif (random >= 593 and random <= 633) then -- Diamond
                    prize = 787;
                elseif (random >= 634 and random <= 643) then -- Emerald
                    prize = 785;
                elseif (random >= 644 and random <= 714) then -- Hi-Ether +3
                    prize = 4135;
                elseif (random >= 715 and random <= 785) then -- Hi-Potion +3
                    prize = 4119;
                elseif (random >= 786 and random <= 805) then -- Orichalcum Ore
                    prize = 739;
                elseif (random >= 806 and random <= 815) then -- Platinum Ore
                    prize = 738;
                elseif (random >= 816 and random <= 835) then -- Ruby
                    prize = 786;
                elseif (random >= 836 and random <= 855) then -- Sapphire
                    prize = 794;
                elseif (random >= 856 and random <= 896) then -- Scroll of Cure V
                    prize = 4613;
                elseif (random >= 897 and random <= 916) then -- Scroll of Shell IV
                    prize = 4659;
                elseif (random >= 917 and random <= 936) then -- Scroll of Thunder III
                    prize = 4774;
                elseif (random >= 937 and random <= 987) then -- Vile Elixir
                    prize = 4174;
                elseif (random >= 988 and random <= 997) then -- Scroll of Raise III
                    prize = 4748;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(EBON_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 8) then
            if (player:hasKeyItem(WHITE_CORAL_KEY) == true) then
                random = math.random(1,997);
                if (random >= 1 and random <= 31) then -- Brass Mask
                    prize = 12433;
                elseif (random >= 32 and random <= 109) then -- Chestnut Sabots
                    prize = 12986;
                elseif (random >= 110 and random <= 218) then -- Cotton Gloves
                    prize = 12721;
                elseif (random >= 219 and random <= 296) then -- Studded Trousers
                    prize = 12826;
                elseif (random >= 297 and random <= 437) then -- Wool Robe
                    prize = 12602;
                elseif (random >= 438 and random <= 468) then -- Chestnut Log
                    prize = 694;
                elseif (random >= 469 and random <= 499) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 500 and random <= 624) then -- Elixir
                    prize = 4145;
                elseif (random >= 625 and random <= 655) then -- Elm Log
                    prize = 690;
                elseif (random >= 656 and random <= 686) then -- Iron Ore
                    prize = 643;
                elseif (random >= 687 and random <= 717) then -- Iron Ingot
                    prize = 651;
                elseif (random >= 718 and random <= 764) then -- Mythril Ingot
                    prize = 653;
                elseif (random >= 765 and random <= 780) then -- Mythril Ore
                    prize = 644;
                elseif (random >= 781 and random <= 843) then -- Silver Ingot
                    prize = 744;
                elseif (random >= 844 and random <= 874) then -- Silver Ore
                    prize = 736;
                elseif (random >= 875 and random <= 937) then -- Steel Ingot
                    prize = 652;
                elseif (random >= 938 and random <= 968) then -- Sroll of Dispel
                    prize = 4868;
                elseif (random >= 969 and random <= 999) then -- Scroll of Magic Finale
                    prize = 5070;
                elseif (random >= 1000 and random <= 1015) then -- Scroll of Utsisemi: Ni
                    prize = 4947;
                elseif (random >= 1016 and random <= 1031) then -- Scroll of Erase
                    prize = 4751;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(WHITE_CORAL_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 9) then
            if (player:hasKeyItem(BLUE_CORAL_KEY) == true) then
                random = math.random(1,1002);
                if (random >= 1 and random <= 42) then -- Cuir Bouilli
                    prize = 12571;
                elseif (random >= 43 and random <= 250) then -- Iron Greaves
                    prize = 14118;
                elseif (random >= 251 and random <= 292) then -- Linen Slacks
                    prize = 12866;
                elseif (random >= 293 and random <= 375) then -- Padded Cap
                    prize = 12450;
                elseif (random >= 376 and random <= 458) then -- Velvet Cuffs
                    prize = 12731;
                elseif (random >= 459 and random <= 500) then -- Black Pearl
                    prize = 793;
                elseif (random >= 501 and random <= 583) then -- Elixir
                    prize = 4145;
                elseif (random >= 584 and random <= 625) then -- Ether +1
                    prize = 4129;
                elseif (random >= 626 and random <= 667) then -- Garnet
                    prize = 790;
                elseif (random >= 668 and random <= 709) then -- Peridot
                    prize = 788;
                elseif (random >= 710 and random <= 751) then -- Potion +1
                    prize = 4113;
                elseif (random >= 752 and random <= 876) then -- Oak Log
                    prize = 669;
                elseif (random >= 877 and random <= 918) then -- Rainbow Cloth
                    prize = 830;
                elseif (random >= 919 and random <= 960) then -- Red Rock
                    prize = 769;
                elseif (random >= 961 and random <= 1002) then -- Turquoise
                    prize = 798;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(BLUE_CORAL_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 10) then
            if (player:hasKeyItem(PEACH_CORAL_KEY) == true) then
                random = math.random(1,1103);
                if (random >= 1 and random <= 66) then -- Carapace Harness
                    prize = 13712;
                elseif (random >= 67 and random <= 198) then -- Raptor Ledelsens
                    prize = 12956;
                elseif (random >= 199 and random <= 303) then -- Silk Hat
                    prize = 12476;
                elseif (random >= 304 and random <= 395) then -- Steel Finger Gauntlets
                    prize = 14003;
                elseif (random >= 396 and random <= 487) then -- White Slacks
                    prize = 12867;
                elseif (random >= 488 and random <= 500) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 501 and random <= 526) then -- Demon Horn
                    prize = 902;
                elseif (random >= 527 and random <= 565) then -- Ebony Log
                    prize = 702;
                elseif (random >= 566 and random <= 591) then -- Gold Ore
                    prize = 737;
                elseif (random >= 592 and random <= 696) then -- Hi-Elixer
                    prize = 4144;
                elseif (random >= 697 and random <= 747) then -- Hi-Ether
                    prize = 4132;
                elseif (random >= 748 and random <= 773) then -- Hi-Potion
                    prize = 4116;
                elseif (random >= 774 and random <= 786) then -- Mahogany Log
                    prize = 700;
                elseif (random >= 787 and random <= 839) then -- Manticore Hide
                    prize = 1116;
                elseif (random >= 840 and random <= 852) then -- Mythril Ore
                    prize = 644;
                elseif (random >= 853 and random <= 891) then -- Petrified Log
                    prize = 703;
                elseif (random >= 892 and random <= 930) then -- Scroll of Raise II
                    prize = 4621;
                elseif (random >= 931 and random <= 969) then -- Platinum Ore
                    prize = 738;
                elseif (random >= 940 and random <= 1008) then -- Ram Horn
                    prize = 895;
                elseif (random >= 1009 and random <= 1021) then -- Ram Skin
                    prize = 859;
                elseif (random >= 1022 and random <= 1074) then -- Scroll of Regen III
                    prize = 4719;
                elseif (random >= 1075 and random <= 1087) then -- Wyvern Scales
                    prize = 866;
                elseif (random >= 1088 and random <= 1103) then -- Wyvern Skin
                    prize = 1122;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(PEACH_CORAL_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 11) then
            if (player:hasKeyItem(BLACK_CORAL_KEY) == true) then
                random = math.random(1,1015);
                if (random >= 1 and random <= 90) then -- Beak Helm
                    prize = 13698;
                elseif (random >= 91 and random <= 194) then -- Pigaches
                    prize = 12988;
                elseif (random >= 195 and random <= 224) then -- Darksteel Breeches
                    prize = 12811;
                elseif (random >= 225 and random <= 433) then -- Scorpion Mitts
                    prize = 12707;
                elseif (random >= 434 and random <= 552) then -- Silk Coat
                    prize = 12604;
                elseif (random >= 553 and random <= 597) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 598 and random <= 612) then -- Darksteel Ingot
                    prize = 654;
                elseif (random >= 613 and random <= 642) then -- Gold Ingot
                    prize = 745;
                elseif (random >= 643 and random <= 776) then -- Hi-Elixer
                    prize = 4144;
                elseif (random >= 777 and random <= 821) then -- Hi-Ether +1
                    prize = 4133;
                elseif (random >= 822 and random <= 851) then -- Hi-Potion +1
                    prize = 4117;
                elseif (random >= 852 and random <= 866) then -- Mahogany Log
                    prize = 700;
                elseif (random >= 867 and random <= 881) then -- Mythril Ingot
                    prize = 653;
                elseif (random >= 882 and random <= 896) then -- Painite
                    prize = 797;
                elseif (random >= 897 and random <= 1000) then -- Steel Ingot
                    prize = 652;
                elseif (random >= 1001 and random <= 1015) then -- Zircon
                    prize = 805;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(BLACK_CORAL_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 12) then
            if (player:hasKeyItem(RED_CORAL_KEY) == true) then
                random = math.random(1,1017);
                if (random >= 1 and random <= 109) then -- Alloy Torque
                    prize = 16289;
                elseif (random >= 110 and random <= 200) then -- Aureate Necklace
                    prize = 16288;
                elseif (random >= 201 and random <= 273) then -- Burly Gorget
                    prize = 16290;
                elseif (random >= 274 and random <= 382) then -- Nitid Chocker
                    prize = 16286;
                elseif (random >= 383 and random <= 473) then -- Pneuma Collar
                    prize = 16287;
                elseif (random >= 474 and random <= 528) then -- Beetle Blood
                    prize = 1110;
                elseif (random >= 529 and random <= 619) then -- Gold Thread
                    prize = 823;
                elseif (random >= 620 and random <= 692) then -- Granite
                    prize = 1465;
                elseif (random >= 693 and random <= 728) then -- Hi-Ether +2
                    prize = 4134;
                elseif (random >= 729 and random <= 764) then -- Malboro Fiber
                    prize = 837;
                elseif (random >= 765 and random <= 782) then -- Philosophers Stone
                    prize = 924;
                elseif (random >= 783 and random <= 800) then -- Phoenix Feather
                    prize = 844;
                elseif (random >= 801 and random <= 836) then -- Rainbow Cloth
                    prize = 830;
                elseif (random >= 837 and random <= 872) then -- Raxa
                    prize = 1132;
                elseif (random >= 873 and random <= 999) then -- Vile Elixir
                    prize = 4174;
                elseif (random >= 1000 and random <= 1017) then -- Yellow Curry
                    prize = 4517;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(RED_CORAL_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 13) then
            if (player:hasKeyItem(ANGEL_SKIN_KEY) == true) then
                random = math.random(1,1047);
                if (random >= 1 and random <= 65) then -- Altius Mantle
                    prize = 16254;
                elseif (random >= 66 and random <= 162) then -- Chiffon Cape
                    prize = 16253;
                elseif (random >= 163 and random <= 243) then -- Cortege Cape
                    prize = 16255;
                elseif (random >= 244 and random <= 356) then -- Resilient Mantle
                    prize = 16252;
                elseif (random >= 357 and random <= 437) then -- Rugged Mantle
                    prize = 16256;
                elseif (random >= 438 and random <= 469) then -- Adaman Ore
                    prize = 646;
                elseif (random >= 470 and random <= 501) then -- Angelstone
                    prize = 813;
                elseif (random >= 502 and random <= 517) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 518 and random <= 582) then -- Deathstone
                    prize = 812;
                elseif (random >= 583 and random <= 614) then -- Diamond
                    prize = 787;
                elseif (random >= 615 and random <= 646) then -- Emerald
                    prize = 785;
                elseif (random >= 647 and random <= 662) then -- Hi-Ether +3
                    prize = 4135;
                elseif (random >= 663 and random <= 694) then -- Hi-Potion +3
                    prize = 4119;
                elseif (random >= 695 and random <= 742) then -- Orichalcum Ore
                    prize = 739;
                elseif (random >= 743 and random <= 790) then -- Ruby
                    prize = 786;
                elseif (random >= 791 and random <= 822) then -- Scroll of Cure V
                    prize = 4613;
                elseif (random >= 823 and random <= 855) then -- Scroll of Shell IV
                    prize = 4659;
                elseif (random >= 856 and random <= 888) then -- Spinel
                    prize = 804;
                elseif (random >= 889 and random <= 1021) then -- Vile Elixir
                    prize = 4174;
                elseif (random >= 1022 and random <= 1037) then -- Scroll of Thunder III
                    prize = 4774;
                elseif (random >= 1038 and random <= 1047) then -- Scroll of Raise III
                    prize = 4748;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(ANGEL_SKIN_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 15) then
            if (player:hasKeyItem(MOOGLE_KEY) == true) then
                random = math.random(1,1100);
                if (random >= 1 and random <= 167) then -- Studded Bandana
                    prize = 12442;
                elseif (random >= 168 and random <= 374) then -- Chain Belt
                    prize = 13209;
                elseif (random >= 375 and random <= 707) then -- Chain Choker
                    prize = 13083;
                elseif (random >= 708 and random <= 874) then -- Scroll of Erase
                    prize = 4751;
                elseif (random >= 867 and random <= 1041) then -- Mythril Ingot
                    prize = 653;
                elseif (random >= 1042 and random <= 1100) then -- Silver Ingot
                    prize = 744;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(MOOGLE_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 16) then
            if (player:hasKeyItem(BIRD_KEY) == true) then
                random = math.random(1,972);
                if (random >= 1 and random <= 143) then -- Ebony Sabots
                    prize = 12987;
                elseif (random >= 144 and random <= 393) then -- Iron Scale Mail
                    prize = 13783;
                elseif (random >= 394 and random <= 536) then -- Oak Shield
                    prize = 12293;
                elseif (random >= 537 and random <= 653) then -- Waistbelt
                    prize = 13200;
                elseif (random >= 654 and random <= 663) then -- Black Pearl
                    prize = 793;
                elseif (random >= 664 and random <= 678) then -- Blue Rock
                    prize = 770;
                elseif (random >= 679 and random <= 770) then -- Elixir
                    prize = 4145;
                elseif (random >= 771 and random <= 801) then -- Ether +1
                    prize = 4129;
                elseif (random >= 802 and random <= 816) then -- Goshenite
                    prize = 808;
                elseif (random >= 817 and random <= 847) then -- Oak Log
                    prize = 669;
                elseif (random >= 848 and random <= 852) then -- Pearl
                    prize = 792;
                elseif (random >= 853 and random <= 862) then -- Peridot
                    prize = 788;
                elseif (random >= 793 and random <= 871) then -- Potion +1
                    prize = 4113;
                elseif (random >= 872 and random <= 922) then -- Rosewood Log
                    prize = 701;
                elseif (random >= 923 and random <= 927) then -- Sphene
                    prize = 815;
                elseif (random >= 928 and random <= 947) then -- Translucent Rock
                    prize = 773;
                elseif (random >= 948 and random <= 957) then -- White Rock
                    prize = 776;
                elseif (random >= 958 and random <= 967) then -- Yellow Rock
                    prize = 771;
                elseif (random >= 968 and random <= 972) then -- Purple Rock
                    prize = 774;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(BIRD_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 17) then
            if (player:hasKeyItem(CACTUAR_KEY) == true) then
                random = math.random(1,935);
                if (random >= 1 and random <= 109) then -- Nodowa
                    prize = 13111;
                elseif (random >= 110 and random <= 196) then -- Silk Coat
                    prize = 12604;
                elseif (random >= 197 and random <= 305) then -- Turtle Bangles
                    prize = 13981;
                elseif (random >= 306 and random <= 370) then -- Carapace Mask
                    prize = 13711;
                elseif (random >= 371 and random <= 435) then -- Hi-Ether
                    prize = 4132;
                elseif (random >= 436 and random <= 544) then -- Hi-Elixer
                    prize = 4144;
                elseif (random >= 545 and random <= 609) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 610 and random <= 631) then -- Gold Ore
                    prize = 737;
                elseif (random >= 632 and random <= 674) then -- Scroll of Regen III
                    prize = 4719;
                elseif (random >= 675 and random <= 696) then -- Scroll of Raise II
                    prize = 4621;
                elseif (random >= 697 and random <= 718) then -- Platinum Ore
                    prize = 738;
                elseif (random >= 719 and random <= 761) then -- Wyvern Scales
                    prize = 866;
                elseif (random >= 762 and random <= 804) then -- Ebony Log
                    prize = 702;
                elseif (random >= 805 and random <= 847) then -- Demon Horn
                    prize = 902;
                elseif (random >= 848 and random <= 869) then -- Petrified Log
                    prize = 703;
                elseif (random >= 870 and random <= 891) then -- Manticore Hide
                    prize = 1116;
                elseif (random >= 892 and random <= 913) then -- Ram Horn
                    prize = 895;
                elseif (random >= 914 and random <= 935) then -- Ram Skin
                    prize = 859;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(CACTUAR_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 18) then
            if (player:hasKeyItem(BOMB_KEY) == true) then
                random = math.random(1,901);
                if (random >= 1 and random <= 308) then -- Battle Boots
                    prize = 12980;
                elseif (random >= 309 and random <= 462) then -- Silk Slops
                    prize = 12860;
                elseif (random >= 463 and random <= 616) then -- Tiger Mantle
                    prize = 13589;
                elseif (random >= 617 and random <= 693) then -- Bascinet
                    prize = 12427;
                elseif (random >= 694 and random <= 747) then -- Hi-Elixer
                    prize = 4144;
                elseif (random >= 748 and random <= 824) then -- Darksteel Ingot
                    prize = 654;
                elseif (random >= 825 and random <= 901) then -- Darksteel Ore
                    prize = 645;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(BOMB_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 19) then
            if (player:hasKeyItem(CHOCOBO_KEY) == true) then
                random = math.random(1,1186);
                if (random >= 1 and random <= 190) then -- Aptus Earring
                    prize = 16008;
                elseif (random >= 191 and random <= 285) then -- Stearc Subligar
                    prize = 16372;
                elseif (random >= 286 and random <= 571) then -- Varius Torque
                    prize = 16295;
                elseif (random >= 572 and random <= 595) then -- Gold Thread
                    prize = 823;
                elseif (random >= 596 and random <= 643) then -- Hi-Ether +2
                    prize = 4134;
                elseif (random >= 644 and random <= 714) then -- Hi-Potion +2
                    prize = 4118;
                elseif (random >= 715 and random <= 785) then -- Malboro Fiber
                    prize = 837;
                elseif (random >= 786 and random <= 856) then -- Beetle Blood
                    prize = 1110;
                elseif (random >= 857 and random <= 927) then -- Philosophers Stone
                    prize = 924;
                elseif (random >= 925 and random <= 995) then -- Rainbow Cloth
                    prize = 830;
                elseif (random >= 996 and random <= 1043) then -- Raxa
                    prize = 1132;
                elseif (random >= 1044 and random <= 1067) then -- Granite
                    prize = 1465;
                elseif (random >= 1068 and random <= 1115) then -- Vile Elixir
                    prize = 4174;
                elseif (random >= 1116 and random <= 1186) then -- Phoenix Feather
                    prize = 844;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(CHOCOBO_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        elseif (option == 20) then
            if (player:hasKeyItem(TONBERRY_KEY) == true) then
                random = math.random(1,997);
                if (random >= 1 and random <= 291) then -- Esprit Belt
                    prize = 15938;
                elseif (random >= 292 and random <= 600) then -- Fettle Belt
                    prize = 15937;
                elseif (random >= 601 and random <= 636) then -- Angelstone
                    prize = 813;
                elseif (random >= 637 and random <= 654) then -- Deathstone
                    prize = 812;
                elseif (random >= 655 and random <= 690) then -- Darksteel Ore
                    prize = 645;
                elseif (random >= 691 and random <= 708) then -- Diamond
                    prize = 787;
                elseif (random >= 709 and random <= 744) then -- Emerald
                    prize = 785;
                elseif (random >= 745 and random <= 780) then -- Gold Thread
                    prize = 823;
                elseif (random >= 781 and random <= 798) then -- Hi-Potion +3
                    prize = 4119;
                elseif (random >= 799 and random <= 816) then -- Platinum Ore
                    prize = 738;
                elseif (random >= 817 and random <= 834) then -- Orichalcum Ore
                    prize = 739;
                elseif (random >= 835 and random <= 870) then -- Ruby
                    prize = 786;
                elseif (random >= 871 and random <= 883) then -- Sapphire
                    prize = 794;
                elseif (random >= 884 and random <= 901) then -- Scroll of Cure V
                    prize = 4613;
                elseif (random >= 902 and random <= 919) then -- Scroll of Raise III
                    prize = 4748;
                elseif (random >= 920 and random <= 937) then -- Scroll of Thunder III
                    prize = 4774;
                elseif (random >= 938 and random <= 955) then -- Spinel
                    prize = 804;
                elseif (random >= 956 and random <= 973) then -- Topaz
                    prize = 789;
                elseif (random >= 974 and random <= 1082) then -- Vile Elixir
                    prize = 4174;
                end

                if (player:getFreeSlotsCount() >= 1) then
                    player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
                    player:delKeyItem(TONBERRY_KEY);
                    player:messageSpecial(ITEM_OBTAINED,prize);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
                end
            else
                player:showText(player,NO_KEY);
            end
        end
    end
end;