-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Hope Spawn)
-- Allows players to spawn the Jailer of Hope by trading the First Virtue, Deed of Placidity and HQ Phuabo Organ to a ???.
-- !pos -693 -1 -62 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, {1850, 1851, 1852}) and npcUtil.popFromQM(player, npc, ID.mob.JAILER_OF_HOPE) then
        player:confirmTrade()
        SpawnMob(ID.mob.JAILER_OF_HOPE):updateClaim(player)
    end
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.JAILER_SPEACH)
    player:messageSpecial(ID.text.JAILER_SPEACH +1)
    player:messageSpecial(ID.text.JAILER_SPEACH +2)
    player:messageSpecial(ID.text.JAILER_SPEACH +3)
    player:messageSpecial(ID.text.JAILER_SPEACH +4)
    player:messageSpecial(ID.text.JAILER_SPEACH +5)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
