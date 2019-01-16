-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Signpost
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
-----------------------------------

function onTrigger(player, npc)
    player:messageSpecial(ID.text.SIGN)
end

function onTrade(player, npc, trade)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
