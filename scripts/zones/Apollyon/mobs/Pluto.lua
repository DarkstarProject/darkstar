-----------------------------------
-- Area: Apollyon NW
--  Mob: Pluto
-----------------------------------
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Apollyon/IDs")
local flags = dsp.path.flag.NONE
local path =
{
        {-459.436, 0.000, -16.257},
        {-458.178, 0.000, 49.511}
}

function onMobRoam(mob)
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(path[point][1], path[point][2], path[point][3], flags)
        mob:setLocalVar("pause", os.time()+30)
    end
end

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if isKiller then
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[1][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[1][1]):setStatus(dsp.status.NORMAL)
    end
end
