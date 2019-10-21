-----------------------------------
-- Area: Temenos N T
--  Mob: Praetorian Guard CXLVIII
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(16928809) and limbus.isMobDead(16928810) and limbus.isMobDead(16928812) then
        GetNPCByID(16928768+28):setPos(-311, 80, 419)
        GetNPCByID(16928768+28):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+162):setPos(-311, 80, 417)
        GetNPCByID(16928768+162):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+213):setPos(-311, 80, 421)
        GetNPCByID(16928768+213):setStatus(dsp.status.NORMAL)
    end
    GetNPCByID(GATE_OFFSET+4):setStatus(dsp.status.NORMAL)
end
