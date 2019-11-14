-----------------------------------
-- Area: Temenos E T
--  Mob: Thunder Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local battlefield = player:getBattlefield()

        switch (mobID): caseof {
            [ID.mob.TEMENOS_E_MOB[5]] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5], player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[5]+1] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]+1):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5]+1, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[5]+2] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]+2):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5]+2, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[5]+3] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[5]+3):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[5]+3, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
            end,
            [ID.mob.TEMENOS_C_MOB[2]+7] = function()
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.THUNDERDEF, -128)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+8):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+8)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+14)
                end
            end,
        }
    end
end