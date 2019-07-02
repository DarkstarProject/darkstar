-----------------------------------
-- Area: Windurst Waters
--  NPC: Chomo Jinjahl
-- Guild Merchant NPC: Cooking Guild
-- !pos -105.094 -2.222 73.791 238
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if player:sendGuild(5302,5,20,7) then
        player:showText(npc,ID.text.CHOMOJINJAHL_SHOP_DIALOG)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
