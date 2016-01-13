-----------------------------------
-- Area: Horlais Peak
--  NPC: Armoury Crate
-------------------------------------

require("scripts/globals/bcnm");
local text = require("scripts/zones/Horlais_Peak/TextIDs");

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
