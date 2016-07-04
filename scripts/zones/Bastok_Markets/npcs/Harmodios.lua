-----------------------------------
-- Area: Bastok Markets
-- NPC: Harmodios
-- Standard Merchant NPC
-- @pos -79.928 -4.824 -135.114 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,10) == false) then
        player:startEvent(0x01ae);
    elseif (player:getVar("comebackQueenCS") == 1) then
        player:startEvent(0x01EA);
    else

        player:showText(npc,HARMODIOS_SHOP_DIALOG);
        stock = {
            0x43C3,   990,1,     --Piccolo

            0x43C0,   219,2,     --Cornette
            0x43C9,    43,2,     --Maple Harp
            0x13B1, 69120,2,     --Scroll of Vital Etude
            0x13B2, 66240,2,     --Scroll of Swift Etude
            0x13B3, 63360,2,     --Scroll of Sage Etude
            0x13B4, 56700,2,     --Scroll of Logical Etude
            0x13AF, 79560,2,     --Scroll of Herculean Etude
            0x13B0, 76500,2,     --Scroll of Uncanny Etude

            0x43C7,  4644,3,     --Gemshorn
            0x43C1,    43,3,     --Flute
            0x13B5, 54000,3      --Scroll of Bewitching Etude
        }
        showNationShop(player, BASTOK, stock);

    end;
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x01ae) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",10,true);

    elseif (csid == 0x01EA) then
        player:startEvent(0x01EB);
    elseif (csid == 0x01EB) then
        player:setVar("comebackQueenCS", 2);
    end;
end;
