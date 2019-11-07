-----------------------------------
-- Area: Apollyon NW
--  Mob: Cynoprosopi
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[4][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[4][1]):setStatus(dsp.status.NORMAL)
    end
end
