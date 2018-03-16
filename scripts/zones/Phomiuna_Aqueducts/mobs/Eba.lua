-----------------------------------
-- Area: Phomiuna_Aqueducts
--  MOB: Eba
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}

function onMobSpawn(mob)
    mob:setLocalVar("fomorHateAdj", 4);
end;

function onMobDeath(mob, player, isKiller)
end;