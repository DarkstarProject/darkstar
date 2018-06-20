-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Nightmare Goobbue
-----------------------------------
-----------------------------------
require("scripts/globals/status")
mixins = { require("scripts/mixins/dynamis_dreamland") }

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1449)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
