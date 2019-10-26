-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines White Mage
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

    if mobID - ID.mob.TEMENOS_N_MOB[3] == random - 1 then
        battlefield:setLocalVar("random", math.random(1, 4))
        player:messageSpecial(ID.text.GATE_OPEN)
        player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        GetNPCByID(ID.npc.GATE_OFFSET+2):setStatus(dsp.status.NORMAL)
    end

    if mobID == ID.mob.TEMENOS_N_MOB[1]+1 and random % 2 == 1 then
        GetNPCByID(ID.npc.COFFER_OFFSET+26):setPos(19, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+26):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+160):setPos(16, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+160):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setPos(22, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_N_MOB[1] and random % 2 == 0 then
        GetNPCByID(ID.npc.COFFER_OFFSET+26):setPos(19, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+26):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+160):setPos(16, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+160):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setPos(22, 80, 430)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setStatus(dsp.status.NORMAL)
    end
end