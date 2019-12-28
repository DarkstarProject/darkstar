-----------------------------------
-- Area: Port Bastok
--  NPC: Festive Moogle
-- Type: Event NPC
--  !pos 46.902 8.499 -242.276 236
-----------------------------------
require("scripts/globals/npc_util")

local stock = {
    16119,  -- Nomad Cap
    16118,  -- Moogle Cap
    18401,  -- Moogle Rod
    320,    -- Harpsichord
    264,    -- Stuffed Chocobo
    11290,  -- Tidal Talisman
    11811,  -- Destrier Beret
    10293,  -- Chocobo Shirt
}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:startEvent(380, unpack(stock))
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 380 then
        npcUtil.giveItem(player, stock[option])
    end
end