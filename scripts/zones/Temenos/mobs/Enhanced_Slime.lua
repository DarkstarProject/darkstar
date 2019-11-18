-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Slime
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [2] = 
    {
        -300.000,79.500,-130.000,
        -300.000,79.500,-150.000,
    },
    [5] = 
    {
        -260.000,79.500,-130.000,
        -260.000,79.500,-150.000,
    },

}

function onMobSpawn(mob)
    onMobRoam(mob)
end

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[5]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        if offset == 2 or offset == 5 then
            local point = mob:getLocalVar("point")+1
            mob:setLocalVar("point", (point+2)%6)
            local X = path[offset][point]
            local Y = path[offset][point+1]
            local Z = path[offset][point+2]
            mob:pathTo(X, Y, Z, 10)
            mob:setLocalVar("pause", os.time()+35)
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

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[5]):getAnimation() == 9 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.TEMENOS_W_GATE[5]):setAnimation(8)
        end

        for i = 0, 8 do
            if spawn and mobID == ID.mob.TEMENOS_W_MOB[5]+i
                and GetNPCByID(ID.npc.TEMENOS_W_CRATE[5]+(i%2)):getStatus() == dsp.status.DISAPPEAR
            then
                GetNPCByID(ID.npc.TEMENOS_W_CRATE[5]+(i%2)):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_W_CRATE[5]+(i%2), player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"))
            end
        end
    end
end
