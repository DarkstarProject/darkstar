-----------------------------------
-- Area: Balgas Dais
-- NPC:  Armoury Crate
-- Balgas Dais Burning Cicrcle Armoury Crate
-----------------------------------

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
