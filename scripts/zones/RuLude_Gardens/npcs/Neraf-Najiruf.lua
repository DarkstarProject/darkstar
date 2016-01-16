-----------------------------------
-- Area: Ru'Lud Gardens
-- NPC:  Neraf-Najiruf
-- Involved in Quests: Save my Sister
-- @zone 243
-- @pos -36 2 60
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    saveMySister = player:getQuestStatus(JEUNO,SAVE_MY_SISTER);
    
    if (saveMySister == QUEST_AVAILABLE and player:getVar("saveMySisterVar") == 3) then
        player:startEvent(0x0062); -- Real start of this quest (with addquest)
    elseif (saveMySister == QUEST_ACCEPTED) then
        player:startEvent(0x0063); -- During quest
    elseif (saveMySister == QUEST_COMPLETED and player:hasKeyItem(DUCAL_GUARDS_LANTERN) == true) then
        player:startEvent(0x0061); -- last CS (after talk with baudin)
    else
        player:startEvent(0x009C); -- Standard dialog
    end
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
    if (csid == 0x0062) then 
        player:addQuest(JEUNO,SAVE_MY_SISTER);
        player:setVar("saveMySisterVar", 0);
        player:addKeyItem(DUCAL_GUARDS_LANTERN);
        player:messageSpecial(KEYITEM_OBTAINED,DUCAL_GUARDS_LANTERN);
    elseif (csid == 0x0061) then 
        player:delKeyItem(DUCAL_GUARDS_LANTERN);
        player:setVar("saveMySisterFireLantern", 0);
    end
end;



