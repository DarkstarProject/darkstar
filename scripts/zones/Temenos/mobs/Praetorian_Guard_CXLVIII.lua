-----------------------------------
-- Area: Temenos N T
--  Mob: Praetorian Guard CXLVIII
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[5]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[5]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_N_MOB[5]+3):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[5]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[5]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[5]+2):setStatus(dsp.status.NORMAL)
        end
        if GetNPCByID(ID.npc.TEMENOS_N_GATE[5]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_N_GATE[5])
        end
    end
end
