-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Tonberry Dismayer
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

	checkRegime(killer,mob,790,1);
	checkRegime(killer,mob,791,1);
	checkRegime(killer,mob,792,1);
	checkRegime(killer,mob,793,1);
	checkRegime(killer,mob,794,1);
	checkRegime(killer,mob,795,1);

	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if(kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
end;