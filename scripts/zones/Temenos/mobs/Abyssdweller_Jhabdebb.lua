-----------------------------------
-- Area: Temenos
--  Mob: Abyssdweller Jhabdebb
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]+5):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+6):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+7):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+8):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+9):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+10):isDead()
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
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if GetMobByID(ID.mob.TEMENOS_C_MOB[3]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[3]+1):isDead() and
        GetMobByID(ID.mob.TEMENOS_C_MOB[3]+2):isDead()
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+78):setPos(-280, -161, -440)
        GetNPCByID(ID.npc.COFFER_OFFSET+78):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.GATE_OFFSET+20):setStatus(dsp.status.NORMAL)
    end
end