-----------------------------------
-- Area: Temenos E T
--  Mob: Earth Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()

        switch (mobID): caseof {
            [ID.mob.TEMENOS_E_MOB[4]] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[4], player, "crateMaskF4", battlefield:getLocalVar("crateMaskF4"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[4]+1] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[4]+1, player, "crateMaskF4", battlefield:getLocalVar("crateMaskF4"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[4]+2] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[4]+2, player, "crateMaskF4", battlefield:getLocalVar("crateMaskF4"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[4]+3] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[4]+3, player, "crateMaskF4", battlefield:getLocalVar("crateMaskF4"), true)
            end,
            [ID.mob.TEMENOS_C_MOB[2]+6] = function()
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(dsp.mod.EARTHDEF, -128)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+7):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+7)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+13)
                end
            end,
        }
    end
end