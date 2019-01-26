-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Ratonne
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage");
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 510);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 511);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 511);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 510, 511);
end;