-----------------------------------
-- Area: Temenos E T
--  Mob: Air Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path =
{
    [1] = 
    {
        20.000,6.000,150.000,
        20.000,6.000,142.640,
    },
    [3] = 
    {
        60.000,6.000,150.000,
        60.000,6.000,142.640,
    },
}

function onMobRoam(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[3]
        local pause = mob:getLocalVar("pause")
        if pause < os.time() then
            if offset == 1 or offset == 3 then
                local point = mob:getLocalVar("point")+1
                local X = path[offset][point]
                local Y = path[offset][point+1]
                local Z = path[offset][point+2]
                mob:pathTo(X, Y, Z, 0)
                mob:setLocalVar("point", (point+2)%6)
                mob:setLocalVar("pause", os.time()+5)
            end
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