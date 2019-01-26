-----------------------------------
-- Area: Windurst Woods
--  NPC: Retto-Marutto
-- Guild Merchant NPC: Bonecrafting Guild
-- !pos -6.142 -6.55 -132.639 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:sendGuild(5142,8,23,3) then
        player:showText(npc,ID.text.RETTO_MARUTTO_DIALOG)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
