-----------------------------------
-- Area: Temenos N T
--  Mob: Kindred Dark Knight
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if GetMobByID(ID.mob.TEMENOS_N_MOB[4]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[4]+2):isDead() then
        GetNPCByID(ID.npc.COFFER_OFFSET+27):setPos(-120, -80, 429)
        GetNPCByID(ID.npc.COFFER_OFFSET+27):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+161):setPos(-123, -80, 429)
        GetNPCByID(ID.npc.COFFER_OFFSET+161):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+212):setPos(-117, -80, 429)
        GetNPCByID(ID.npc.COFFER_OFFSET+212):setStatus(dsp.status.NORMAL)
    end
end