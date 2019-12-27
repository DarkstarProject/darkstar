-----------------------------------
-- Area: Temenos E T
--  Mob: Air Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [1] = 
    {
        {20.000, 6.000, 150.000, 0},
        {20.000, 6.000, 142.640, 0}
    },
    [3] = 
    {
        {60.000, 6.000, 150.000, 0},
        {60.000, 6.000, 142.640, 0}
    },
}

function onMobRoam(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[3]
        local pause = mob:getLocalVar("pause")
        if pause < os.time() then
            local point = (mob:getLocalVar("point") % 2)+1
            mob:setLocalVar("point", point)
            mob:pathTo(unpack(path[offset][point]))
            mob:setLocalVar("pause", os.time()+5)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local battlefield = player:getBattlefield()

        switch (mobID): caseof {
            [ID.mob.TEMENOS_E_MOB[3]] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[3]):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3], player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[3]+1] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[3]+1):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3]+1, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[3]+2] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[3]+2):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3]+2, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[3]+3] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[3]+3):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3]+3, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_C_MOB[2]+5] = function()
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.WINDDEF, -128)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+6):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+6)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+12)
                end
            end,
        }
    end
end