-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Crimson-toothed Pawberry
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
	SetServerVariable("[POP]Crimson-toothed_Pawberry",os.time(t) + 900); -- 15min
	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if (kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
end;