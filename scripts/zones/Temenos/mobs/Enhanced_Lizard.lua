-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Lizard
-----------------------------------
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
        local battlefield = player:getBattlefield()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(0,1) == 1

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[4]):getAnimation() == 9 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.TEMENOS_W_GATE[4]):setAnimation(8)
        end

        for i = 0, 8 do
            if spawn and mobID == ID.mob.TEMENOS_W_MOB[4]+i
                and GetNPCByID(ID.npc.TEMENOS_W_CRATE[4]+(i%3)):getStatus() == dsp.status.DISAPPEAR
            then
                GetNPCByID(ID.npc.TEMENOS_W_CRATE[4]+(i%3)):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[4]+(i%3), player, "crateMaskF4", battlefield:getLocalVar("crateMaskF4"))
            end
        end
    end
end
