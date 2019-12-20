-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Mandragora
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [0] =
    {
        198.000,-81.000,-74.000,
        198.000,-81.000,-86.000,
    },
    [1] = 
    {
        202.000,-81.000,-86.000,
        202.000,-81.000,-74.000,
    },
    [2] = 
    {
        207.000,-81.000,-88.000,
        193.000,-81.000,-88.000,
    },
    [3] = 
    {
        208.000,-81.000,-73.000,
        208.000,-81.000,-87.000,
    },
    [4] = 
    {
        193.000,-81.000,-72.000,
        207.000,-81.000,-72.000,
    },
    [5] = 
    {
        192.000,-81.000,-87.000,
        192.000,-81.000,-73.000,
    },
    [6] = 
    {
        203.560,-80.000,-140.000,
        232.680,-80.000,-140.000,
    },
    [7] = 
    {
        205.640,-80.000,-140.000,
        234.600,-80.000,-140.000,
    },
    [8] = 
    {
        207.600,-80.000,-140.000,
        236.560,-80.000,-140.000,
    },
}

function onMobSpawn(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[2]
    if offset == 0 or offset == 1 then
        mob:setLocalVar("pause", os.time()+5)
    end
    onMobRoam(mob)
end

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[2]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = mob:getLocalVar("point")+1
        mob:setLocalVar("point", (point+2)%6)
        local X = path[offset][point]
        local Y = path[offset][point+1]
        local Z = path[offset][point+2]
        mob:pathTo(X, Y, Z, 0)
        mob:setLocalVar("pause", os.time()+15)
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

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[2]):getAnimation() == 9 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.TEMENOS_W_GATE[2]):setAnimation(8)
        end

        if spawn then
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[2]+i):getStatus() == dsp.status.DISAPPEAR then
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[2]+i):setPos(mobX, mobY, mobZ)
                    dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[2]+i, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"))
                    break
                end
            end
        end
    end
end
