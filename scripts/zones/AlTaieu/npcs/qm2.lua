-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Justice Spawn)
-- Allows players to spawn the Jailer of Justice by trading the Second Virtue, Deed of Moderation, and HQ Xzomit Organ to a ???.
-- !pos -278 0 -463
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, {1853, 1854, 1855}) and npcUtil.popFromQM(player, npc, ID.mob.JAILER_OF_JUSTICE) then
        player:confirmTrade()
        SpawnMob(ID.mob.JAILER_OF_JUSTICE):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.JAILER_SPEACH +6)
    player:messageSpecial(ID.text.JAILER_SPEACH +7)
    player:messageSpecial(ID.text.JAILER_SPEACH +8)
    player:messageSpecial(ID.text.JAILER_SPEACH +9)
    player:messageSpecial(ID.text.JAILER_SPEACH +10)
    player:messageSpecial(ID.text.JAILER_SPEACH +11)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end