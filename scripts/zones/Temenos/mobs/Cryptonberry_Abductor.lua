-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Abductor
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [2] = 
    {
        -424.000, -80.000, 420.500,
        -456.000, -80.000, 420.500,
    },
    [6] = 
    {
        -460.500, -80.000, 416.000,
        -460.500, -80.000, 408.000,
    },
    [10] = 
    {
        -419.500, -80.000, 416.000,
        -419.500, -80.000, 408.000,
    },
}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[6]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[offset][point]
        local Y = path[offset][point+1]
        local Z = path[offset][point+2]
        mob:pathTo(X, Y, Z, 0)
        if offset == 2 then
            mob:setLocalVar("pause", os.time()+30)
        else
            mob:setLocalVar("pause", os.time()+15)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if GetNPCByID(ID.npc.TEMENOS_N_GATE[6]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_N_GATE[6])
        end
    end
end
