-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Bard
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local random = battlefield:getLocalVar("randomF3")

        if random == 1 then
            battlefield:setLocalVar("randomF4", math.random(1, 4))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[3])
        end

        if random % 2 == 0 then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+2):setStatus(dsp.status.NORMAL)
        end
    end
end