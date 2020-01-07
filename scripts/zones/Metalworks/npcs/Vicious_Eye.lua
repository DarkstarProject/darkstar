-----------------------------------
-- Area: Metalworks
--  NPC: Vicious Eye
-- Type: Guild Merchant (Blacksmithing Guild)
-- !pos -106.132 0.999 -28.757 237
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
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
    player:showText(npc,ID.text.VICIOUS_EYE_SHOP_DIALOG)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end