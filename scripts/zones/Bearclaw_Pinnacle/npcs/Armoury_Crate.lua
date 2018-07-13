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

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:getBCNMloot();
end;

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
