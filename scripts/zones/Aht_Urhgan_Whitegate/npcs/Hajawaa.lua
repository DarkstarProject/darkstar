-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hajawaa
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 703)
end

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 704)
end

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 704)
end

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 703, 704)
end