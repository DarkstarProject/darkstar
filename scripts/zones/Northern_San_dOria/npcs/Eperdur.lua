-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Eperdur
-- Starts and Finishes Quest: Altana's Sorrow (finish), Acting in Good Faith (finish), Healing the Land, 
-- @pos 129 -6 96 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    AltanaSorrow  = player:getQuestStatus(BASTOK,ALTANA_S_SORROW);
    ActingInGoodFaith  = player:getQuestStatus(WINDURST,ACTING_IN_GOOD_FAITH);
    HealingTheLand = player:getQuestStatus(SANDORIA,HEALING_THE_LAND);
    SorceryOfTheNorth = player:getQuestStatus(SANDORIA,SORCERY_OF_THE_NORTH);
    
    if (AltanaSorrow == QUEST_ACCEPTED and player:hasKeyItem(LETTER_FROM_VIRNAGE)) then
        player:startEvent(0x02a7); -- Finish quest "Altana's Sorrow"
    elseif (ActingInGoodFaith == QUEST_ACCEPTED and player:hasKeyItem(GANTINEUXS_LETTER)) then
        player:startEvent(0x02a8); -- Finish quest "Acting in Good Faith"
    elseif (HealingTheLand == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 4 and player:getMainLvl() >= 10) then
        player:startEvent(0x02a9); -- Start quest "Healing the Land"
    elseif (HealingTheLand == QUEST_ACCEPTED and player:hasKeyItem(SEAL_OF_BANISHING)) then
        player:startEvent(0x02aa); -- During quest "Healing the Land"
    elseif (HealingTheLand == QUEST_ACCEPTED and player:hasKeyItem(SEAL_OF_BANISHING) == false) then
        player:startEvent(0x02ab); -- Finish quest "Healing the Land"
    elseif (HealingTheLand == QUEST_COMPLETED and SorceryOfTheNorth == QUEST_AVAILABLE and player:needToZone()) then
        player:startEvent(0x02ac); -- New standard dialog after "Healing the Land"
    elseif (HealingTheLand == QUEST_COMPLETED and SorceryOfTheNorth == QUEST_AVAILABLE and player:needToZone() == false) then
        player:startEvent(0x02ad); -- Start quest "Sorcery of the North"
    elseif (SorceryOfTheNorth == QUEST_ACCEPTED and player:hasKeyItem(FEIYIN_MAGIC_TOME) == false) then
        player:startEvent(0x02ae); -- During quest "Sorcery of the North"
    elseif (SorceryOfTheNorth == QUEST_ACCEPTED and player:hasKeyItem(FEIYIN_MAGIC_TOME)) then
        player:startEvent(0x02af); -- Finish quest "Sorcery of the North"
    else
        player:startEvent(0x02a6); -- Standard dialog
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x02a7) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4731);
        else
            player:addTitle(PILGRIM_TO_DEM);
            player:delKeyItem(LETTER_FROM_VIRNAGE);
            player:addItem(4731);
            player:messageSpecial(ITEM_OBTAINED,4731); -- Scroll of Teleport-Dem
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,ALTANA_S_SORROW);
        end
    elseif (csid == 0x02a8) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4732);
        else
            player:addTitle(PILGRIM_TO_MEA);
            player:delKeyItem(GANTINEUXS_LETTER);
            player:addItem(4732);
            player:messageSpecial(ITEM_OBTAINED,4732); -- Scroll of Teleport-Mea
            player:addFame(WINDURST,30);
            player:completeQuest(WINDURST,ACTING_IN_GOOD_FAITH);
        end
    elseif (csid == 0x02a9 and option == 0) then
        player:addQuest(SANDORIA,HEALING_THE_LAND);
        player:addKeyItem(SEAL_OF_BANISHING);
        player:messageSpecial(KEYITEM_OBTAINED,SEAL_OF_BANISHING);
    elseif (csid == 0x02ab) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4730);
        else
            player:addTitle(PILGRIM_TO_HOLLA);
            player:addItem(4730);
            player:messageSpecial(ITEM_OBTAINED,4730); -- Scroll of Teleport-Holla
            player:needToZone(true);
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,HEALING_THE_LAND);
        end
    elseif (csid == 0x02ad and option == 0) then
        player:addQuest(SANDORIA,SORCERY_OF_THE_NORTH);
    elseif (csid == 0x02af) then 
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4747);
        else
            player:delKeyItem(FEIYIN_MAGIC_TOME);
            player:addItem(4747);
            player:messageSpecial(ITEM_OBTAINED,4747); -- Scroll of Teleport-Vahzl
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,SORCERY_OF_THE_NORTH);
        end
    end
    
end;