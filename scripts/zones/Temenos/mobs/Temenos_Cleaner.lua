-----------------------------------
-- Area: Temenos Central 1floor
--  Mob: Temenos Cleaner
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
function onMobEngaged(mob, target)
    if limbus.isMobDead(16929046) then
        mob:addStatusEffect(dsp.effect.REGAIN, 7, 3, 0)
        mob:addStatusEffect(dsp.effect.REGEN, 50, 3, 0)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if limbus.isMobDead(16929046) and limbus.isMobDead(16929048) and limbus.isMobDead(16929049) and limbus.isMobDead(16929050) and limbus.isMobDead(16929051) then
        GetNPCByID(16928768+71):setPos(mobX, mobY, mobZ)
        GetNPCByID(16928768+71):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928770+471):setStatus(dsp.status.NORMAL)
    end
end
