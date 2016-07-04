-----------------------------------
-- Area: Riverne-Site_A01
-- MOB:  Ouryu
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(OURYU_OVERWHELMER);
end;