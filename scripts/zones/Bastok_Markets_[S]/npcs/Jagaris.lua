-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Jagaris
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage");
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 328);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 329);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 329);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 328, 329);
end;