-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Bard
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if GetMobByID(ID.mob.TEMENOS_N_MOB[3]+1):isDead() then
        GetNPCByID(ID.npc.COFFER_OFFSET+26):setPos(19, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+26):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+160):setPos(16, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+160):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setPos(22, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setStatus(dsp.status.NORMAL)
    end
end