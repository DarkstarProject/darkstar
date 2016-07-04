-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Elysia
-- Starts Quest: Unforgiven
-- @zone 26
-- @pos -50.410 -22.204 -41.640
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
require("scripts/zones/Tavnazian_Safehold/TextIDs")
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/player");
require("scripts/globals/titles");
-----------------------------------

-- For those who don't know
-- at the end of if (player:getQuestStatus(REGION,QUEST_NAME)
-- == 0 means QUEST_AVAILABLE
-- == 1 means QUEST_ACCEPTED
-- == 2 means QUEST_COMPLETED 
-- e.g. if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == 0 
-- means if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == QUEST AVAILABLE

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local Unforgiven = player:getQuestStatus(OTHER_AREAS,UNFORGIVEN);
    if (Unforgiven == 0) then
        player:startEvent(0x00C8); -- Quest Start Dialogue
    
    elseif (Unforgiven == 1 and player:getVar("UnforgivenVar") == 1) then
        player:startEvent(0x00CB); -- Dialogue if player hasn't talked to Pradiulot (2nd stage of Quest)
    
    elseif (Unforgiven == 1 and player:hasKeyItem(609) == false) then
        player:startEvent(0x00C9); -- Dialogue if player doesn't have keyitem
    
    elseif (Unforgiven == 1 and player:hasKeyItem(609) == true) then
        player:startEvent(0x00CA); -- Dialogue if player has keyitem (1st stage of Quest)
    
    else
        player:startEvent(0x00BE);
        
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
if (csid == 0x00C8) then
    player:addQuest(OTHER_AREAS,UNFORGIVEN);

elseif (csid == 0x00CA) then
    player:setVar("UnforgivenVar",1); -- SET THE VAR
end

end;