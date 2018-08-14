-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Armoury Crate
-------------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/zones/Sacrificial_Chamber/TextIDs");

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
