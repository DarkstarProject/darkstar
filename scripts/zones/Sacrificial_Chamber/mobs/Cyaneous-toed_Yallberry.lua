-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Cyaneous-toed_Yallberry
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