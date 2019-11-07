-----------------------------------
-- Area: Apollyon NW
--  Mob: Pluto
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if isKiller then
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[1][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[1][1]):setStatus(dsp.status.NORMAL)
    end
end
