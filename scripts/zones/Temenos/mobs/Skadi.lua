-----------------------------------
-- Area: Temenos N T
--  Mob: Skadi
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[2]+2):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[2]+1):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if GetMobByID(ID.mob.TEMENOS_N_MOB[2]+1):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[2]+2):isDead() then
        GetNPCByID(ID.npc.COFFER_OFFSET+19):setPos(200, -82, 495)
        GetNPCByID(ID.npc.COFFER_OFFSET+19):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+153):setPos(206, -82, 495)
        GetNPCByID(ID.npc.COFFER_OFFSET+153):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+210):setPos(196, -82, 495)
        GetNPCByID(ID.npc.COFFER_OFFSET+210):setStatus(dsp.status.NORMAL)
    end
end