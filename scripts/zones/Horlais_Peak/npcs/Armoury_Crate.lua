-----------------------------------
-- Area: Horlais Peak
-- NPC:  Armoury Crate
-------------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/zones/Horlais_Peak/TextIDs");

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
