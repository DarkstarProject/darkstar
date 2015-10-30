-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Tonberry Kinq
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if (kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
end;