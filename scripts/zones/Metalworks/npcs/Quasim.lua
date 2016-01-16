-----------------------------------
--    Area: Metalworks
--    NPC:  Quasim
--    Adventurer's Assistant
-------------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/zones/Metalworks/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade) 
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    player:startEvent(0x02E6);
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



