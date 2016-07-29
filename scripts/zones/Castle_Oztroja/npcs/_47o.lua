-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47o
-- @pos -155.228 21.500 -140.000 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    npc:openDoor(6);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;