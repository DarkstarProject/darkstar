-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Slaughterman
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local battlefield = player:getBattlefield()
    local random = battlefield:getLocalVar("random")

    if mobID - ID.mob.TEMENOS_N_MOB[1] == random - 1 then
        player:messageSpecial(ID.text.GATE_OPEN)
        player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        GetNPCByID(ID.npc.GATE_OFFSET):setStatus(dsp.status.NORMAL)
    end

    if mobID == ID.mob.TEMENOS_N_MOB[1]+1 and random % 2 == 1 then
        GetNPCByID(ID.npc.COFFER_OFFSET+18):setPos(330, 70, 468)
        GetNPCByID(ID.npc.COFFER_OFFSET+18):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+152):setPos(328, 70, 464)
        GetNPCByID(ID.npc.COFFER_OFFSET+152):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+209):setPos(332, 70, 470)
        GetNPCByID(ID.npc.COFFER_OFFSET+209):setStatus(dsp.status.NORMAL)
    elseif mobID == ID.mob.TEMENOS_N_MOB[1] and random % 2 == 0 then
        GetNPCByID(ID.npc.COFFER_OFFSET+18):setPos(330, 70, 468)
        GetNPCByID(ID.npc.COFFER_OFFSET+18):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+152):setPos(328, 70, 464)
        GetNPCByID(ID.npc.COFFER_OFFSET+152):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+209):setPos(332, 70, 470)
        GetNPCByID(ID.npc.COFFER_OFFSET+209):setStatus(dsp.status.NORMAL)
    end
end
