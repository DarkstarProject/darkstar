-----------------------------------
-- Area: East Sarutabaruta (116)
--   NM: Duke_Decapod
-----------------------------------

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
	mob:setRespawnTime(math.random(3600,4200));
end;
