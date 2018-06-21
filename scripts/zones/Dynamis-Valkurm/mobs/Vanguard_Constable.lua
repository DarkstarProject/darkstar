-----------------------------------
-- Area: Dynamis Valkurm
-----------------------------------
-----------------------------------
require("scripts/globals/status")
mixins = { require("scripts/mixins/dynamis_beastmen") }

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1455)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
