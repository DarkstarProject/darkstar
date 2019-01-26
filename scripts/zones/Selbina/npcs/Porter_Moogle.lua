-----------------------------------
-- Area: Selbina
--  NPC: Porter Moogle
-- Type: Storage Moogle
-- !zone 248
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/porter_moogle_util")
-----------------------------------

local e =
{
    TALK_EVENT_ID       =   1137,
    STORE_EVENT_ID      =   1138,
    RETRIEVE_EVENT_ID   =   1139,
    ALREADY_STORED_ID   =   1140,
    MAGIAN_TRIAL_ID     =   1141
}

function onTrade(player,npc,trade)
    porterMoogleTrade(player, trade, e)
end

function onTrigger(player,npc)
    -- No idea what the params are, other than event ID and gil.
    player:startEvent(e.TALK_EVENT_ID, 0x6FFFFF, 0x01, 0x06DD, 0x27, 0x7C7E, 0x15, player:getGil(), 0x03E8)
end

function onEventUpdate(player,csid,option)
    porterEventUpdate(player, csid, option, e.RETRIEVE_EVENT_ID)
end

function onEventFinish(player,csid,option)
    porterEventFinish(player, csid, option, e.TALK_EVENT_ID)
end