-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Lizard
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [0] =
    {
        -87.000,-80.000,-150.500,
        -153.000,-80.000,-150.500,
    },
    [1] = 
    {
        -150.000,-80.000,-147.000,
        -130.000,-80.000,-147.000,
    },
    [2] = 
    {
        -90.000,-80.000,-147.000,
        -110.000,-80.000,-147.000,
    },
    [3] = 
    {
        -153.000,-80.000,-142.000,
        -87.000,-80.000,-142.000,
    },
    [4] = 
    {
        -87.000,-80.000,-138.000,
        -153.000,-80.000,-138.000,
    },
    [5] = 
    {
        -111.960,-80.000,-140.000,
        -127.960,-80.000,-140.000,
    },
    [6] = 
    {
        -150.000,-80.000,-133.000,
        -130.000,-80.000,-133.000,
    },
    [7] = 
    {
        -90.000,-80.000,-133.000,
        -110.000,-80.000,-133.000,
    },
    [8] = 
    {
        -153.000,-80.000,-129.500,
        -87.000,-80.000,-129.500,
    },
}

function onMobSpawn(mob)
    onMobRoam(mob)
end

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[4]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[offset][point]
        local Y = path[offset][point+1]
        local Z = path[offset][point+2]
        mob:pathTo(X, Y, Z, 0)
        if offset == 5 then
            mob:setLocalVar("pause", os.time()+10)
        elseif offset == 1 or offset == 2 or offset == 6 or offset == 7 then
            mob:setLocalVar("pause", os.time()+17)
        else
            mob:setLocalVar("pause", os.time()+25)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(0,1) == 1

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[4]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_W_GATE[4])
        end

        if spawn then
            local battlefield = player:getBattlefield()
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[4]+i):getStatus() == dsp.status.DISAPPEAR then
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[4]+i):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[4]+i, player, "crateMaskF4", battlefield:getLocalVar("crateMaskF4"))
                    break
                end
            end
        end
    end
end
