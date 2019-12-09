-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Tiger
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [2] = 
    {
        377.635, 74.000, -100.000,
        343.635, 68.000, -100.000,
    },
    [6] = 
    {
        340.000, 74.000, -137.500,
        340.000, 68.000, -103.500,
    },

}

function onMobSpawn(mob)
    onMobRoam(mob)
end

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[1]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        if offset == 2 or offset == 6 then
            local point = mob:getLocalVar("point")+1
            mob:setLocalVar("point", (point+2)%6)
            local X = path[offset][point]
            local Y = path[offset][point+1]
            local Z = path[offset][point+2]
            mob:pathTo(X, Y, Z, 0)
            mob:setLocalVar("pause", os.time()+20)
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

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[1]):getAnimation() == 9 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.TEMENOS_W_GATE[1]):setAnimation(8)
        end

        if spawn then
            for i = 0, 2 do
                if GetNPCByID(ID.npc.TEMENOS_W_CRATE[1]+i):getStatus() == dsp.status.DISAPPEAR then
                    GetNPCByID(ID.npc.TEMENOS_W_CRATE[1]+i):setPos(mobX, mobY, mobZ)
                    limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[1]+i, player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"))
                    break
                end
            end
        end
    end
end
