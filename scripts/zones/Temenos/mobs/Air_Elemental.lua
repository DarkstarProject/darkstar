-----------------------------------
-- Area: Temenos E T
--  Mob: Air Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()

        switch (mobID): caseof {
            [ID.mob.TEMENOS_E_MOB[3]] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3], player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[3]+1] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3]+1, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[3]+2] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3]+2, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[3]+3] = function()
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[3]+3, player, "crateMaskF3", battlefield:getLocalVar("crateMaskF3"), true)
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