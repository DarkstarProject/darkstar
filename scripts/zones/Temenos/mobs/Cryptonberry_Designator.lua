-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Designator
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [3] = 
    {
        {-456.000, -80.000, 419.500, 0},
        {-424.000, -80.000, 419.500, 0}
    },
    [7] = 
    {
        {-459.500, -80.000, 416.000, 0},
        {-459.500, -80.000, 408.000, 0}
    },
    [11] = 
    {
        {-420.500, -80.000, 416.000, 0},
        {-420.500, -80.000, 408.000, 0}
    },
}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[6]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(unpack(path[offset][point]))
        if offset == 3 then
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
