-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Vulture
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+1):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+2):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+3):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+4):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+5):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if limbus.isMobDead(ID.mob.TEMENOS_W_MOB[7]) and limbus.isMobDead(ID.mob.TEMENOS_W_MOB[7]+1) and
        limbus.isMobDead(ID.mob.TEMENOS_W_MOB[7]+2) and limbus.isMobDead(ID.mob.TEMENOS_W_MOB[7]+3) and
        limbus.isMobDead(ID.mob.TEMENOS_W_MOB[7]+4) and limbus.isMobDead(ID.mob.TEMENOS_W_MOB[7]+5)
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+17):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+17):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.GATE_OFFSET+19):setStatus(dsp.status.NORMAL)
    end
end
