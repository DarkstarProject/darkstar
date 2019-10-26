-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Theurgist
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[7]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[7]+1):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_N_MOB[7]+3):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()

    if GetMobByID(ID.mob.TEMENOS_N_MOB[7]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[7]+1):isDead() and
        GetMobByID(ID.mob.TEMENOS_N_MOB[7]+2):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[7]+3):isDead() and
        GetMobByID(ID.mob.TEMENOS_N_MOB[7]+4):isDead()
    then
        GetNPCByID(ID.npc.COFFER_OFFSET+39):setPos(-599, 85, 438)
        GetNPCByID(ID.npc.COFFER_OFFSET+39):setStatus(dsp.status.NORMAL)
        player:messageSpecial(ID.text.GATE_OPEN)
        player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        GetNPCByID(ID.npc.GATE_OFFSET+6):setStatus(dsp.status.NORMAL)
    end
end