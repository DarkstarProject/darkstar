-----------------------------------
-- Area: Temenos N T
--  Mob: Kari
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    battlefield:setLocalVar("random", math.random(1,6))
    player:messageSpecial(ID.text.GATE_OPEN)
    player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
    GetNPCByID(ID.npc.GATE_OFFSET+1):setStatus(dsp.status.NORMAL)
end
