-----------------------------------
-- Area: Boneyard Gully
--  NPC: Armoury Crate
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
local text = require("scripts/zones/Balgas_Dais/TextIDs");

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
