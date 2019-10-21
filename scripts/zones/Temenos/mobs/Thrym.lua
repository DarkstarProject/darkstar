-----------------------------------
-- Area: Temenos N T
--  Mob: Thrym
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(16928781):updateEnmity(target)
    GetMobByID(16928783):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(16928781) and limbus.isMobDead(16928783) then
        GetNPCByID(16928768+19):setPos(200, -82, 495)
        GetNPCByID(16928768+19):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+153):setPos(206, -82, 495)
        GetNPCByID(16928768+153):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+210):setPos(196, -82, 495)
        GetNPCByID(16928768+210):setStatus(dsp.status.NORMAL)
    end
end