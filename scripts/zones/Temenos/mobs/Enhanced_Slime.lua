-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Slime
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Temenos/IDs")
local flags = dsp.path.flag.WALLHACK
local path =
{
    [2] = 
    {
        {-300.000, 79.500, -130.000},
        {-300.000, 79.500, -150.000}
    },
    [5] = 
    {
        {-260.000, 79.500, -130.000},
        {-260.000, 79.500, -150.000}
    },

}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[5]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() and (offset == 2 or offset == 5) then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(path[offset][point][1], path[offset][point][2], path[offset][point][3], flags)
        mob:setLocalVar("pause", os.time()+35)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(3) == 1

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[5]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_W_GATE[5])
        end

        if spawn then
            local battlefield = player:getBattlefield()
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[5]+i):getStatus() == dsp.status.DISAPPEAR then
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[5]+i):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[5]+i, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"))
                    break
                end
            end
        end
    end
end
