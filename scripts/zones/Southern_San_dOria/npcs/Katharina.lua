-----------------------------------
--    Area: Southern San d'Oria
--    NPC: Katharina
--  General Info NPC
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
    player:startEvent(0x377);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;