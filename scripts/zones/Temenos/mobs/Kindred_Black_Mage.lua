-----------------------------------
-- Area: Temenos N T
--  Mob: Kindred Black Mage
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [5] = 
    {
        -148.860, -80.000, 427.000,
        -91.860, -80.000, 427.000,
    },
    [6] = 
    {
        -148.860, -80.000, 430.000,
        -91.860, -80.000, 430.000,
    },
    [7] = 
    {
        -91.860, -80.000, 410.000,
        -148.860, -80.000, 410.000,
    },
    [8] = 
    {
        -91.860, -80.000, 413.000,
        -148.860, -80.000, 413.000,
    },
}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_N_MOB[4]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[offset][point]
        local Y = path[offset][point+1]
        local Z = path[offset][point+2]
        mob:pathTo(X, Y, Z)
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
