-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Bard
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local random = battlefield:getLocalVar("random")

        if mobID - ID.mob.TEMENOS_N_MOB[3] == random - 1 then
            battlefield:setLocalVar("random", math.random(1, 4))
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.GATE_OFFSET+2):setStatus(dsp.status.NORMAL)
        end

        if mobID == ID.mob.TEMENOS_N_MOB[3]+1 and random % 2 == 1 then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+2):setStatus(dsp.status.NORMAL)
        elseif mobID == ID.mob.TEMENOS_N_MOB[3] and random % 2 == 0 then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+2):setStatus(dsp.status.NORMAL)
        end
    end
end