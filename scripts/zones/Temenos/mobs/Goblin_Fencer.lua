-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Fencer
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[7]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[7]+2):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[7]+4):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(ID.mob.TEMENOS_N_MOB[7]) and limbus.isMobDead(ID.mob.TEMENOS_N_MOB[7]+1) and
        limbus.isMobDead(ID.mob.TEMENOS_N_MOB[7]+2) and limbus.isMobDead(ID.mob.TEMENOS_N_MOB[7]+3) and
        limbus.isMobDead(ID.mob.TEMENOS_N_MOB[7]+4)
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+39):setPos(-599, 85, 438)
        GetNPCByID(ID.npc.COFFER_OFFSET+39):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.GATE_OFFSET+6):setStatus(dsp.status.NORMAL)
    end
end