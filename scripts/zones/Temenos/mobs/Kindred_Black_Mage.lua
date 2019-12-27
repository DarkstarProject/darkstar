-----------------------------------
-- Area: Temenos N T
--  Mob: Kindred Black Mage
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [5] = 
    {
        {-148.860, -80.000, 427.000, 11},
        {-91.860, -80.000, 427.000, 11}
    },
    [6] = 
    {
        {-148.860, -80.000, 430.000, 11},
        {-91.860, -80.000, 430.000, 11}
    },
    [7] = 
    {
        {-91.860, -80.000, 410.000, 11},
        {-148.860, -80.000, 410.000, 11}
    },
    [8] = 
    {
        {-91.860, -80.000, 413.000, 11},
        {-148.860, -80.000, 413.000, 11}
    },
}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[4]
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
        local random = battlefield:getLocalVar("randomF4")

        if mobID - ID.mob.TEMENOS_N_MOB[4] == random + 4 then
            dsp.limbus.handleDoors(battlefield, true, ID.npc.TEMENOS_N_GATE[4])
        end
    end
end
