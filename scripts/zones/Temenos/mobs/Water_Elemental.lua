-----------------------------------
-- Area: Temenos E T
--  Mob: Water Elemental
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
            [ID.mob.TEMENOS_E_MOB[6]] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[6]):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[6], player, "crateMaskF6", battlefield:getLocalVar("crateMaskF6"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[6]+1] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[6]+1):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[6]+1, player, "crateMaskF6", battlefield:getLocalVar("crateMaskF6"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[6]+2] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[6]+2):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[6]+2, player, "crateMaskF6", battlefield:getLocalVar("crateMaskF6"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[6]+3] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[6]+3):setPos(mobX, mobY, mobZ)
                dsp.limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[6]+3, player, "crateMaskF6", battlefield:getLocalVar("crateMaskF6"), true)
            end,
            [ID.mob.TEMENOS_C_MOB[2]+8] = function()
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.WATERDEF, -128)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+3):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+3)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+9)
                end
            end,
        }
    end
end