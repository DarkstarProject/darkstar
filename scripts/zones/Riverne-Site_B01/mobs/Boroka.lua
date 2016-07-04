-----------------------------------
-- Area: Riverne - Site B01
--  NM:  Boroka
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
    player:addTitle(BOROKA_BELEAGUERER);
    mob:setRespawnTime(math.random(75600,86400)); -- 21-24 hour respawn
end;