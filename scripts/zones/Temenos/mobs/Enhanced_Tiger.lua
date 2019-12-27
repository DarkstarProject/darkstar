-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Tiger
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [2] = 
    {
        {377.635, 74.000, -100.000, 0},
        {343.635, 68.000, -100.000, 0}
    },
    [6] = 
    {
        {340.000, 74.000, -137.500, 0},
        {340.000, 68.000, -103.500, 0}
    },

}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[1]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() and (offset == 2 or offset == 6) then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(unpack(path[offset][point]))
        mob:setLocalVar("pause", os.time()+20)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(0,1) == 1

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[1]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_W_GATE[1])
        end

        if spawn then
            local battlefield = player:getBattlefield()
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[1]+i):getStatus() == dsp.status.DISAPPEAR then
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[1]+i):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[1]+i, player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"))
                    break
                end
            end
        end
    end
end
