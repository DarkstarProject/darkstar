-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Armoury Crate
-- Waughroon Shrine Burning Armoury_Crate
-------------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/zones/Waughroon_Shrine/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:getBCNMloot();
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
