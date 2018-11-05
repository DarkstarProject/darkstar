-----------------------------------
-- Area: Bastok Markets
--  NPC: Sinon
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage");
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 395);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 396);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 396);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 395, 396);
end;