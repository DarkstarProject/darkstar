-----------------------------------
-- Area: Temenos Central Floor
--  Mob: Airi
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
function onMobEngaged(mob, target)
    if IsMobDead(16929047) then
        mob:addStatusEffect(dsp.effect.REGAIN, 7, 3, 0)
        mob:addStatusEffect(dsp.effect.REGEN, 50, 3, 0)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if IsMobDead(16929047) and IsMobDead(16929048) and IsMobDead(16929049) and IsMobDead(16929050) and IsMobDead(16929051) then
        GetNPCByID(16928768+71):setPos(mobX, mobY, mobZ)
        GetNPCByID(16928768+71):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928770+471):setStatus(dsp.status.NORMAL)
    end
end
