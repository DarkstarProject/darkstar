-----------------------------------
-- Area: Temenos N T
--  Mob: Kari
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("randomF3", math.random(1,6))
        local players = battlefield:getPlayers()
        for i, member in pairs(players) do
            member:messageSpecial(ID.text.GATE_OPEN)
            member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        end
        GetNPCByID(ID.npc.GATE_OFFSET+1):setStatus(dsp.status.NORMAL)
    end
end
