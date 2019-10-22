-----------------------------------
-- Area: Temenos Central Floor
--  Mob: Enhanced Dragon
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    if limbus.isMobDead(ID.mob.TEMENOS_C_MOB[1]+5) then
        mob:addStatusEffect(dsp.effect.REGAIN, 7, 3, 0)
        mob:addStatusEffect(dsp.effect.REGEN, 50, 3, 0)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if limbus.isMobDead(ID.mob.TEMENOS_C_MOB[1]) and limbus.isMobDead(ID.mob.TEMENOS_C_MOB[1]+1) and
        limbus.isMobDead(ID.mob.TEMENOS_C_MOB[1]+2) and limbus.isMobDead(ID.mob.TEMENOS_C_MOB[1]+3) and
        limbus.isMobDead(ID.mob.TEMENOS_C_MOB[1]+5)
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+71):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+71):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.GATE_OFFSET+20):setStatus(dsp.status.NORMAL)
    end
end
