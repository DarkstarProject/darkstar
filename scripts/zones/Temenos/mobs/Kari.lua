-----------------------------------
-- Area: Temenos N T
--  Mob: Kari
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    {185.000, -82.000, 465.000, 10},
    {215.000, -82.000, 465.000, 10},
    {215.000, -82.000, 495.500, 10},
    {185.000, -82.000, 495.000, 10}
}

function onMobRoam(mob)
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 4)+1
        mob:setLocalVar("point", point)
        mob:pathTo(unpack(path[point]))
        mob:setLocalVar("pause", os.time()+15)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("randomF3", math.random(1,6))
        dsp.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[2])
    end
end
