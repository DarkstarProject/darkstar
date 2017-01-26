-----------------------------------
-- Area: Bearclaw Pinnacle
-- NPC:  Armoury Crate
-----------------------------------
package.loaded["scripts/zones/Bearclaw_Pinnacle/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Bearclaw_Pinnacle/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------

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
