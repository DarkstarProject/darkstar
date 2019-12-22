-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Beetle
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [0] =
    {
        18.000,80.000,-140.000,
        8.000,80.000,-140.000,
    },
    [1] = 
    {
        20.000,80.000,-138.000,
        20.000,80.000,-128.000,
    },
    [2] = 
    {
        22.000,80.000,-140.000,
        32.000,80.000,-140.000,
    },
    [3] = 
    {
        58.000,80.000,-140.000,
        48.000,80.000,-140.000,
    },
    [4] = 
    {
        60.000,80.000,-138.000,
        60.000,80.000,-128.000,
    },
    [5] = 
    {
        62.000,80.000,-140.000,
        72.000,80.000,-140.000,
    },
}

function onMobSpawn(mob)
    onMobRoam(mob)
end

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[3]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[offset][point]
        local Y = path[offset][point+1]
        local Z = path[offset][point+2]
        mob:pathTo(X, Y, Z, 0)
        mob:setLocalVar("pause", os.time()+30)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(0,1) == 1

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[3]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_W_GATE[3])
        end

        if spawn then
            local battlefield = player:getBattlefield()
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[3]+i):getStatus() == dsp.status.DISAPPEAR then
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[3]+i):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[3]+i, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"))
                    break
                end
            end
        end
    end
end
