-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Charmer
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        if GetNPCByID(ID.npc.GATE_OFFSET+5):getStatus() ~= dsp.status.NORMAL then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.GATE_OFFSET+5):setStatus(dsp.status.NORMAL)
        end
    end
end
