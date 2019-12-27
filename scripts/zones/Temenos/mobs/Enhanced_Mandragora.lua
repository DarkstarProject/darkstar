-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Mandragora
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [0] =
    {
        {198.000, -81.000, -74.000, 0},
        {198.000, -81.000, -86.000, 0}
    },
    [1] = 
    {
        {202.000, -81.000, -86.000, 0},
        {202.000, -81.000, -74.000, 0}
    },
    [2] = 
    {
        {207.000, -81.000, -88.000, 0},
        {193.000, -81.000, -88.000, 0}
    },
    [3] = 
    {
        {208.000, -81.000, -73.000, 0},
        {208.000, -81.000, -87.000, 0}
    },
    [4] = 
    {
        {193.000, -81.000, -72.000, 0},
        {207.000, -81.000, -72.000, 0}
    },
    [5] = 
    {
        {192.000, -81.000, -87.000, 0},
        {192.000, -81.000, -73.000, 0}
    },
    [6] = 
    {
        {203.560, -80.000, -140.000, 0},
        {232.680, -80.000, -140.000, 0}
    },
    [7] = 
    {
        {205.640, -80.000, -140.000, 0},
        {234.600, -80.000, -140.000, 0}
    },
    [8] = 
    {
        {207.600, -80.000, -140.000, 0},
        {236.560, -80.000, -140.000, 0}
    },
}

function onMobRoam(mob)
    local offset = mob:getID() - ID.mob.TEMENOS_W_MOB[2]
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(unpack(path[offset][point]))
        mob:setLocalVar("pause", os.time()+15)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local mobID = mob:getID()
        local spawn = math.random(0,1) == 1

        if GetNPCByID(ID.npc.TEMENOS_W_GATE[2]):getAnimation() == dsp.animation.CLOSE_DOOR then
            dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.TEMENOS_W_GATE[2])
        end

        if spawn then
            local battlefield = player:getBattlefield()
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
