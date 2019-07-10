-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Love and Absolute Virtue Spawn)
-- Allows players to spawn the Jailer of Love by trading the Fourth Virtue, Fifth Virtue and Sixth Virtue to a ???.
-- Allows players to spawn Absolute Virtue by killing Jailer of Love.
-- !pos 431 -0 -603
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    --[[
    if npcUtil.tradeHas(trade, {1847, 1848, 1849}) and npcUtil.popFromQM(player, npc, ID.mob.JAILER_OF_LOVE) then
        player:confirmTrade()
        SpawnMob(ID.mob.JAILER_OF_LOVE):updateClaim(player)
    end
    --]]
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.JAILER_SPEACH +18)
    player:messageSpecial(ID.text.JAILER_SPEACH +19)
    player:messageSpecial(ID.text.JAILER_SPEACH +20)
    player:messageSpecial(ID.text.JAILER_SPEACH +21)
    player:messageSpecial(ID.text.JAILER_SPEACH +22)
    player:messageSpecial(ID.text.JAILER_SPEACH +23)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
