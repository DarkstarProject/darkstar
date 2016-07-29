-----------------------------------
-- Area: 
-- NPC:  ancient lockbox
-- @zone illrusi atoll
-- @pos
-----------------------------------
package.loaded["scripts/zones/Ilrusi_Atoll/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Ilrusi_Atoll/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 --player:getBCNMloot();
  
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