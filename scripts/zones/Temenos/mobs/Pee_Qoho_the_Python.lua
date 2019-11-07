-----------------------------------
-- Area: Temenos
--  Mob: Pee Qoho the Python
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]+18):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+19):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+20):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+21):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+22):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+23):isDead()
    then
        mob:setMod(dsp.mod.SLASHRES, 1400)
        mob:setMod(dsp.mod.PIERCERES, 1400)
        mob:setMod(dsp.mod.IMPACTRES, 1400)
        mob:setMod(dsp.mod.HTHRES, 1400)
    else
        mob:setMod(dsp.mod.SLASHRES, 300)
        mob:setMod(dsp.mod.PIERCERES, 300)
        mob:setMod(dsp.mod.IMPACTRES, 300)
        mob:setMod(dsp.mod.HTHRES, 300)
    end
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetMobByID(ID.mob.TEMENOS_C_MOB[3]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_C_CRATE[3]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.GATE_OFFSET+20):setStatus(dsp.status.NORMAL)
        end
    end
end