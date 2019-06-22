-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Mahjlaef the Paintorn(ZNM T3))
-- !pos 695 -7 527 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 2594) and not GetMobByID(ID.mob.MAHJLAEF_THE_PAINTORN):isSpawned() then -- Exorcism Treatise
        player:confirmTrade()
        SpawnMob(ID.mob.MAHJLAEF_THE_PAINTORN):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end