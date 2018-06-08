-----------------------------------
-- Area: Fort Ghelsba
--   NM: Chariotbuster Byakzak
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/zones/Fort_Ghelsba/MobIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DisallowRespawn(ORCISH_PANZER, false);
    GetMobByID(ORCISH_PANZER):setRespawnTime(math.random(3600,4200)); -- 60 to 70 min
    mob:setLocalVar("pop", os.time() + math.random(75600,86400)) -- 21 to 24 hours
end;
