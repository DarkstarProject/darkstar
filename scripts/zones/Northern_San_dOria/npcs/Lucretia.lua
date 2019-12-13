-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Lucretia
--  Guild Merchant NPC: Blacksmithing Guild
-- !pos -193.729 3.999 159.412 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/shop")
require("scripts/globals/crafting")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local guildRank = player:getSkillRank(dsp.skill.SMITHING)
    local stock = dsp.shop.generalGuildStock[guild.smithing]
    dsp.shop.generalGuild(player, stock, guildRank)
    player:showText(npc,ID.text.LUCRETIA_SHOP_DIALOG)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end