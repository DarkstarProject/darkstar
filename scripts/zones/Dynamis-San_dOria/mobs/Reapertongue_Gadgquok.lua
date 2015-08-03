-----------------------------------
-- Area: Dynamis San d'Oria
-- NPC:  Reapertongue Gadgquok
-- Boss Trigger for Overlord's Tombstone
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
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	local bossTrigger = GetServerVariable("[DynaSandoria]Boss_Trigger");

	if (bossTrigger == 0 or bossTrigger == 1) then
		SetServerVariable("[DynaSandoria]Boss_Trigger",bossTrigger + 2);
		SpawnMob(17535003); -- 036
		SpawnMob(17535383); -- 143
		SpawnMob(17535384); -- 144
	end

	-- If 2 boss trigger is killed -> pop the boss
	if (GetServerVariable("[DynaSandoria]Boss_Trigger") == 3) then
		SpawnMob(17534977);
		SetServerVariable("[DynaSandoria]Boss_Trigger",4);
	end

end;