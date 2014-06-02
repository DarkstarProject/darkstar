-----------------------------------
-- Area: Den of Rancor
-- NPC:  Tonberry Trailer
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	checkRegime(killer,mob,798,1);
	checkRegime(killer,mob,799,2);
	checkRegime(killer,mob,800,2);

	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if(kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
end;