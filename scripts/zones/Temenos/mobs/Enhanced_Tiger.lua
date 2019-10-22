-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Tiger
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
local cofferID = limbus.randomCoffer(1, Temenos_Western_Tower)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
        GetNPCByID(ID.npc.GATE_OFFSET+14):setStatus(dsp.status.NORMAL)
    if cofferID ~= 0 then
        GetNPCByID(ID.npc.COFFER_OFFSET+cofferID):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.COFFER_OFFSET+cofferID):setStatus(dsp.status.NORMAL)
    end
end
