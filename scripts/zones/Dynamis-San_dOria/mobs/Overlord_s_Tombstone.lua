-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Overlord's Tombstone
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	SpawnMob(17535350):updateClaim(target); -- 110
	SpawnMob(17535351):updateClaim(target); -- 111
	SpawnMob(17535352):updateClaim(target); -- 112
	SpawnMob(17535354):updateClaim(target); -- 114
	SpawnMob(17534978):updateClaim(target); -- Battlechoir Gitchfotch
	SpawnMob(17534979):updateClaim(target); -- Soulsender Fugbrag

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