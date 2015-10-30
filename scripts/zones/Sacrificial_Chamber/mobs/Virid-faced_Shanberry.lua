-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Virid-faced_Shanberry
-- BCNM: Jungle Boogymen
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	local kills = killer:getVar("EVERYONES_GRUDGE_KILLS");

	if (kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end

end;