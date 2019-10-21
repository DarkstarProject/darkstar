-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Charmer
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(16928817) then
        GetNPCByID(16928768+38):setPos(-412, -78, 426)
        GetNPCByID(16928768+38):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+172):setPos(-415, -78, 427)
        GetNPCByID(16928768+172):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+214):setPos(-412, -78, 422)
        GetNPCByID(16928768+214):setStatus(dsp.status.NORMAL)
    end
end
