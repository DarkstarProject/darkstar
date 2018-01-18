-----------------------------------
-- Area: Yuhtunga Jungle
-- MOB:  Voluptuous Vilma
-----------------------------------

require("scripts/zones/Yuhtunga_Jungle/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)    
    DisallowRespawn(VOLUPTUOUS_VILMA, true);
    DisallowRespawn(ROSE_GARDEN_PH, false);
    GetMobByID(ROSE_GARDEN_PH):setRespawnTime(GetMobRespawnTime(ROSE_GARDEN_PH));
end;