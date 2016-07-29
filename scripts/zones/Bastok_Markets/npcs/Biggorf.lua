-----------------------------------
-- Area: Bastok Markets
-- NPC: Biggorf
-- Standard Info NPC
-- Involved in Quest: The Bare Bones
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
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

BareBones = player:getQuestStatus(BASTOK,THE_BARE_BONES);

    if (BareBones == QUEST_ACCEPTED) then
        player:startEvent(0x0101);
    else
        player:startEvent(0x007e); 
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
end;