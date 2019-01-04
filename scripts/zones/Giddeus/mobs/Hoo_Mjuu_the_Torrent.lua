-----------------------------------
-- Area: Giddeus (145)
--   NM: Hoo_Mjuu_the_Torrent
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("useMainSpecAtHPP", math.random(10,50));
end;

function onMobDeath(mob, player, isKiller)
end;
