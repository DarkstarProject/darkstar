-----------------------------------
-- Area: Temenos Central Floor
--  Mob: Enhanced Dragon
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[1]+5):isDead() then
        mob:addStatusEffect(dsp.effect.REGAIN, 7, 3, 0)
        mob:addStatusEffect(dsp.effect.REGEN, 50, 3, 0)
    end
end

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if GetMobByID(ID.mob.TEMENOS_C_MOB[1]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[1]+1):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[1]+2):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[1]+3):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[1]+5):isDead()
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+71):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+71):setStatus(dsp.status.NORMAL)
        player:messageSpecial(ID.text.GATE_OPEN)
        player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        GetNPCByID(ID.npc.GATE_OFFSET+20):setStatus(dsp.status.NORMAL)
    end
end
