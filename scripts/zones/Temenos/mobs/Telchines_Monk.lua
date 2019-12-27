-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Monk
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [4] = 
    {
        {30.000, 80.000, 420.500, 0},
        {10.000, 80.000, 420.500, 0}
    },
    [5] = 
    {
        {70.000, 80.000, 420.500, 0},
        {50.000, 80.000, 420.500, 0}
    },
}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[3]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(unpack(path[offset][point]))
        mob:setLocalVar("pause", os.time()+10)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local random = battlefield:getLocalVar("randomF3")

        if mobID - ID.mob.TEMENOS_N_MOB[3] == random - 1 then
            battlefield:setLocalVar("randomF4", math.random(1, 4))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[3])
        end
    end
end