-----------------------------------
-- Area: East Sarutabaruta (116)
--   NM: Duke_Decapod
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
	mob:setRespawnTime(math.random(3600,4200));
end;
