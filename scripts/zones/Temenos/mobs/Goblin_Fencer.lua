-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Fencer
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(16928831):updateEnmity(target)
    GetMobByID(16928833):updateEnmity(target)
    GetMobByID(16928835):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if IsMobDead(16928831) and IsMobDead(16928832) and IsMobDead(16928833) and IsMobDead(16928834) and IsMobDead(16928835) then
        GetNPCByID(16928768+39):setPos(-599, 85, 438)
        GetNPCByID(16928768+39):setStatus(dsp.status.NORMAL)
        GetNPCByID(GATE_OFFSET+6):setStatus(dsp.status.NORMAL)
    end
end