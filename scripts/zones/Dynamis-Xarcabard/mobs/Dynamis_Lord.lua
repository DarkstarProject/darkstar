-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Dynamis_Lord
-----------------------------------

require("scripts/globals/status");

-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobRoam
-----------------------------------

function OnMobRoam(mob)
	--[[
	if(mob:getExtraVar(1) <= os.time()) then
		DespawnMob(17330177); -- Despawn after 30min
		DespawnMob(17330183);
		DespawnMob(17330184);
	end
	]]
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	SpawnMob(17330183):updateEnmity(target); -- Spawn Ying
	SpawnMob(17330184):updateEnmity(target); -- Spawn Yang
	
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getLocalVar("timeLimit") <= os.time()) then
		DespawnMob(17330177); -- Despawn after 30min
		DespawnMob(17330183);
		DespawnMob(17330184);
	end
	
	if(mob:getBattleTime() % 90 == 0) then
		if(GetMobAction(17330183) == 0) then
			SpawnMob(17330183):updateEnmity(target); -- Respawn Ying after 90sec
		end
		if(GetMobAction(17330184) == 0) then
			SpawnMob(17330184):updateEnmity(target); -- Respawn Yang after 90sec
		end
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:addTitle(LIFTER_OF_SHADOWS);
	
	local npc = GetNPCByID(17330778); -- Spawn ???
	npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
	npc:setStatus(0);
	
end;