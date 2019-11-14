-----------------------------------
-- Area: Temenos N T
--  Mob: Praetorian Guard CCXX
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        if GetMobByID(ID.mob.TEMENOS_N_MOB[5]+1):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[5]+2):isDead() and
            GetMobByID(ID.mob.TEMENOS_N_MOB[5]+3):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[5]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[5]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[5]+2):setStatus(dsp.status.NORMAL)
        end
        if GetNPCByID(ID.npc.GATE_OFFSET+4):getStatus() ~= dsp.status.NORMAL then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.GATE_OFFSET+4):setStatus(dsp.status.NORMAL)
        end
    end
end
