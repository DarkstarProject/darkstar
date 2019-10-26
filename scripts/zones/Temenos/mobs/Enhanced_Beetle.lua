-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Beetle
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    local cofferID = limbus.randomCoffer(3, Temenos_Western_Tower)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    player:messageSpecial(ID.text.GATE_OPEN)
    player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
    GetNPCByID(ID.npc.GATE_OFFSET+16):setStatus(dsp.status.NORMAL)
    if cofferID ~= 0 then
        GetNPCByID(ID.npc.COFFER_OFFSET+cofferID):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+cofferID):setStatus(dsp.status.NORMAL)
    end
end
