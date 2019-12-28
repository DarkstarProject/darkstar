-----------------------------------
-- Area: Port San d'Oria
--  NPC: Festive Moogle
-- Type: Event NPC
--  !pos 70.641 -16.000 -118.589 232
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
    player:startEvent(773, unpack(stock))
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 773 then
        npcUtil.giveItem(player, stock[option])
    end
end