-----------------------------------
-- Area: Bastok Mines
-- NPC: Medicine Eagle
-- Standard Info NPC
-- Involved in Mission: Bastok 8-1
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

player:startEvent(0x0019);

-- if Bastok Mission 8-1
-- player:startEvent(0x00b4);
-- player:startEvent(0x00b5);

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