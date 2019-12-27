-----------------------------------
-- Area: Temenos E T
--  Mob: Ice Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

local path = -- {X, Y, Z, flags}
{
    [0] = 
    {
        {200.000, -161.000, 197.000, 0},
        {200.000, -161.000, 190.000, 0}
    },
    [1] = 
    {
        {197.000, -161.000, 200.000, 0},
        {190.000, -161.000, 200.000, 0}
    },
    [2] = 
    {
        {200.000, -161.000, 203.000, 0},
        {200.000, -161.000, 210.000, 0}
    },
    [3] = 
    {
        {203.000, -161.000, 200.000, 0},
        {210.000, -161.000, 200.000, 0}
    },
}

function onMobRoam(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[2]
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
            [ID.mob.TEMENOS_E_MOB[2]] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2], player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[2]+1] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]+1):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2]+1, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[2]+2] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]+2):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2]+2, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[2]+3] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]+3):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2]+3, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_C_MOB[2]+4] = function()
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.ICEDEF, -128)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+5):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+5)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+11)
                end
            end,
        }
    end
end