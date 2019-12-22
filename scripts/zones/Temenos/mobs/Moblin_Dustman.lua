-----------------------------------
-- Area: Temenos N T
--  Mob: Moblin Dustman
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [2] = 
    {
        340.000, 67.500, 456.000,
        340.000, 67.500, 436.000,
    },
    [3] = 
    {
        344.000, 68.000, 460.000,
        364.000, 68.000, 460.000,
    },
    [4] = 
    {
        370.210, 74.000, 432.008,
        370.210, 74.000, 408.226,
    },
    [5] = 
    {
        375.210, 74.000, 408.226,
        375.210, 74.000, 432.008,
    },
}

function onMobSpawn(mob)
    onMobRoam(mob)
end

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[1]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[offset][point]
        local Y = path[offset][point+1]
        local Z = path[offset][point+2]
        mob:pathTo(X, Y, Z, 0)
        mob:setLocalVar("pause", os.time()+10)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local random = battlefield:getLocalVar("randomF1")

        if mobID - ID.mob.TEMENOS_N_MOB[1] == random - 1 then
            dsp.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[1])
        end
    end
end