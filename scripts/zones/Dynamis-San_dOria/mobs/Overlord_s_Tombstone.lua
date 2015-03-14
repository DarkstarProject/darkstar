-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Overlord's Tombstone
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/dynamis");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	SpawnMob(17535350):updateEnmity(target); -- 110
	SpawnMob(17535351):updateEnmity(target); -- 111
	SpawnMob(17535352):updateEnmity(target); -- 112
	SpawnMob(17535354):updateEnmity(target); -- 114
	
	SpawnMob(17534978):updateEnmity(target); -- Battlechoir Gitchfotch
	GetMobByID(17534978):setMobMod(MOBMOD_MAIN_2HOUR,1);
	
	SpawnMob(17534979):updateEnmity(target); -- Soulsender Fugbrag
	GetMobByID(17534979):setMobMod(MOBMOD_MAIN_2HOUR,1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	if(alreadyReceived(killer,8) == false) then
		addDynamisList(killer,128);

		killer:addTitle(DYNAMISSAN_DORIA_INTERLOPER); -- Add title

		local npc = GetNPCByID(17535224); -- Spawn ???
		npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
		npc:setStatus(0);

		killer:launchDynamisSecondPart(); -- Spawn dynamis second part
	end

	for i = 17534978, 17534979 do
		if (GetMobAction(i) ~= 0) then
			DespawnMob(i);
		end
	end
end;