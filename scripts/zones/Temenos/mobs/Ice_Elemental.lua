-----------------------------------
-- Area: Temenos E T
--  Mob: Ice Elemental
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
            [ID.mob.TEMENOS_E_MOB[2]] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2], player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[2]+1] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]+1):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2]+1, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[2]+2] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]+2):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2]+2, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end,
            [ID.mob.TEMENOS_E_MOB[2]+3] = function()
                GetNPCByID(ID.npc.TEMENOS_E_CRATE[2]+3):setPos(mobX, mobY, mobZ)
                limbus.spawnRandomCrate(ID.npc.TEMENOS_E_CRATE[2]+3, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
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