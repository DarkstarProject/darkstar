-----------------------------------
-- Area: Temenos N T
--  Mob: Kindred Black Mage
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local battlefield = player:getBattlefield()
    local random = battlefield:getLocalVar("random")

    if mobID - ID.mob.TEMENOS_N_MOB[4] == random + 4 then
        player:messageSpecial(ID.text.GATE_OPEN)
        player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        GetNPCByID(ID.npc.GATE_OFFSET+3):setStatus(dsp.status.NORMAL)
    end
end
