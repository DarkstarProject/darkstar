-----------------------------------
-- Area: East Sarutabaruta (116)
--   NM: Duke_Decapod
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	mob:setRespawnTime(math.random(3600,4200));
end;
