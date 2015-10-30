-----------------------------------
-- Area: Riverne - Site B01
-- NPC:  Boroka
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

function onMobDeath(mob, killer)
	killer:addTitle(BOROKA_BELEAGUERER);
	mob:setRespawnTime(math.random((75600),(86400))); -- 21-24 hour respawn
end;