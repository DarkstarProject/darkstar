-----------------------------------
-- Area: Bastok Markets
--  NPC: Teerth
--  Guild Merchant NPC: Goldsmithing Guild
-- !pos -205.190 -7.814 -56.507 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
require("scripts/globals/crafting")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local guildRank = player:getSkillRank(dsp.skill.GOLDSMITHING)
    local stock = dsp.shop.generalGuildStock[guild.goldsmithing]
    dsp.shop.generalGuild(player, stock, guildRank)
    player:showText(npc,ID.text.TEERTH_SHOP_DIALOG)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end