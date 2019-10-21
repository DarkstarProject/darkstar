-----------------------------------
-- Area: Temenos N T
--  Mob: Kindred Warrior
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(16928798) and limbus.isMobDead(16928799) then
        GetNPCByID(16928768+27):setPos(-120, -80, 429)
        GetNPCByID(16928768+27):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+161):setPos(-123, -80, 429)
        GetNPCByID(16928768+161):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+212):setPos(-117, -80, 429)
        GetNPCByID(16928768+212):setStatus(dsp.status.NORMAL)
    end
end