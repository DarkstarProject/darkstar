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
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        if GetMobByID(ID.mob.TEMENOS_W_MOB[7]):isDead() and GetMobByID(ID.mob.TEMENOS_W_MOB[7]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_W_MOB[7]+2):isDead() and GetMobByID(ID.mob.TEMENOS_W_MOB[7]+3):isDead() and
            GetMobByID(ID.mob.TEMENOS_W_MOB[7]+4):isDead() and GetMobByID(ID.mob.TEMENOS_W_MOB[7]+5):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_W_CRATE[7]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.GATE_OFFSET+19):setStatus(dsp.status.NORMAL)
        end
    end
end
