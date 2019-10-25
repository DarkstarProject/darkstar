-----------------------------------
-- Area: Temenos N T
--  Mob: Praetorian Guard CCXX
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if GetMobByID(ID.mob.TEMENOS_N_MOB[5]+1):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[5]+2):isDead() and
        GetMobByID(ID.mob.TEMENOS_N_MOB[5]+3):isDead()
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+28):setPos(-311, 80, 419)
        GetNPCByID(ID.npc.COFFER_OFFSET+28):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+162):setPos(-311, 80, 417)
        GetNPCByID(ID.npc.COFFER_OFFSET+162):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+213):setPos(-311, 80, 421)
        GetNPCByID(ID.npc.COFFER_OFFSET+213):setStatus(dsp.status.NORMAL)
    end
    GetNPCByID(ID.npc.GATE_OFFSET+4):setStatus(dsp.status.NORMAL)
end
