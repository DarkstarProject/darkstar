-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Theurgist
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(16928831):updateEnmity(target)
    GetMobByID(16928832):updateEnmity(target)
    GetMobByID(16928834):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(16928831) and limbus.isMobDead(16928832) and limbus.isMobDead(16928833) and limbus.isMobDead(16928834) and limbus.isMobDead(16928835) then
        GetNPCByID(16928768+39):setPos(-599, 85, 438)
        GetNPCByID(16928768+39):setStatus(dsp.status.NORMAL)
        GetNPCByID(GATE_OFFSET+6):setStatus(dsp.status.NORMAL)
    end
end