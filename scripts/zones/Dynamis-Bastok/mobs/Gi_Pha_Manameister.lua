-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gi'Pha Manameister
-- Boss Trigger for Gu'Dha Effigy
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
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
	
	SetServerVariable("[DynaBastok]Boss_Trigger",GetServerVariable("[DynaBastok]Boss_Trigger") + 1);
	SetServerVariable("[DynaBastok]Already_Killed",GetServerVariable("[DynaBastok]Already_Killed") + 8);
	
	-- If 3 boss trigger is killer -> pop the boss
	if(GetServerVariable("[DynaBastok]Boss_Trigger") == 7) then
		SpawnMob(17539073):updateEnmity(killer);
		GetMobByID(17539073):setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
		SetServerVariable("[DynaBastok]Boss_Trigger",0);
	end
	
end;