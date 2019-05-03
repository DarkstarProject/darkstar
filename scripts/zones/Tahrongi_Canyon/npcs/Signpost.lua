-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Signpost
-----------------------------------
local ID = require("scripts/zones/Tahrongi_Canyon/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local offset = math.floor((npc:getID() - ID.npc.SIGNPOST_OFFSET) / 2)
    player:messageSpecial(ID.text.SIGN_1 + offset)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
