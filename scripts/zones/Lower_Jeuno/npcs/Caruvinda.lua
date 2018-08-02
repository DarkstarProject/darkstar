-----------------------------------
-- Area: Lower Jeuno
--  NPC: Caruvinda
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage");
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 10046);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 10045);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 10045);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 10046, 10045);
end;