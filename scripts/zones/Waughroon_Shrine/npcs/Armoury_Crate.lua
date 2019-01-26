-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Armoury Crate
-- Waughroon Shrine Burning Armoury_Crate
-------------------------------------

require("scripts/globals/bcnm");


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
