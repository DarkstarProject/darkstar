-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Dragoon
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[3]+3):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local battlefield = player:getBattlefield()
    local random = battlefield:getLocalVar("random")

    if mobID - ID.mob.TEMENOS_N_MOB[3] == random - 1 or mobID - ID.mob.TEMENOS_N_MOB[3] == random then
        battlefield:setLocalVar("random", math.random(1, 4))
        player:messageSpecial(ID.text.GATE_OPEN)
        player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        GetNPCByID(ID.npc.GATE_OFFSET+2):setStatus(dsp.status.NORMAL)
    end
end
