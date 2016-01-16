-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Faurbellant
-- Type: Quest NPC
-- Involved in Quest: Gates of Paradise
-- @pos 484 24 -89 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local gates = player:getQuestStatus(SANDORIA,GATES_TO_PARADISE);
    if (gates == QUEST_COMPLETED) then    
        player:showText(npc, FAURBELLANT_4);
    elseif (gates == QUEST_ACCEPTED) then
        if (player:hasKeyItem(SCRIPTURE_OF_WIND) == true) then 
            player:showText(npc, FAURBELLANT_2, 0, SCRIPTURE_OF_WIND);
            player:delKeyItem(SCRIPTURE_OF_WIND);
            player:addKeyItem(SCRIPTURE_OF_WATER);
            player:messageSpecial(KEYITEM_OBTAINED, SCRIPTURE_OF_WATER)
        else
            player:showText(npc, FAURBELLANT_3, SCRIPTURE_OF_WATER);
        end;
    else
        player:showText(npc, FAURBELLANT_1);
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
end;
