-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Pihra_Rhebenslo
-- Armor Storage NPC
-----------------------------------
require("scripts/globals/armorstorage")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 442)
end

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 443)
end

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 443)
end

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 442, 443)
end