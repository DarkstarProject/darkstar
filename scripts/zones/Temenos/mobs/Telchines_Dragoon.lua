-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines Dragoon
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    50.000, 80.000, 419.500,
    30.000, 80.000, 419.500,
}

function onMobRoam(mob)
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[point]
        local Y = path[point+1]
        local Z = path[point+2]
        mob:pathTo(X, Y, Z, 0)
        mob:setLocalVar("pause", os.time()+10)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local random = battlefield:getLocalVar("randomF3")

        if random == 3 or random == 4 then
            battlefield:setLocalVar("randomF4", math.random(1, 4))
            dsp.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[3])
        end
    end
end
