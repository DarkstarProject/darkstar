-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Vermilion-eared_Noberry
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
	local elemental = mob:getID()+2;
	local kills = killer:getVar("EVERYONES_GRUDGE_KILLS");

	if (kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end

	if (GetMobAction(elemental) ~= 0) then
		DespawnMob(elemental);
	end

end;