-----------------------------------
-- Area: Temenos E T
--  Mob: Fire Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local battlefield = player:getBattlefield()

        switch (mobID): caseof {
            [ID.mob.TEMENOS_E_MOB[1]] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[1]):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[1], player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[1]+1] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[1]+1):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[1]+1, player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[1]+2] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[1]+2):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[1]+2, player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[1]+3] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[1]+3):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[1]+3, player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"), true)
            end,
            [ID.mob.TEMENOS_C_MOB[2]+3] = function()
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.FIREDEF, -128)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+4):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+4)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+10)
                end
            end,
        }
    end
end