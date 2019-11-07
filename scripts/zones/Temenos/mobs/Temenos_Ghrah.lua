-----------------------------------
-- Area: Temenos
--  Mob: Temenos Ghrah
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("lootSpawned", 0)
        GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.TEMENOS_C_CRATE[5][1]):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.GATE_OFFSET+25):setStatus(dsp.status.NORMAL)
    end
end
