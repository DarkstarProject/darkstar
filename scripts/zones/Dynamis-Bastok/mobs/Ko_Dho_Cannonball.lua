-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Ko'Dho Cannonball
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
	
	SetServerVariable("[DynaBastok]Boss_Trigger",GetServerVariable("[DynaBastok]Boss_Trigger") + 2);
	
	-- If 3 boss trigger is killer -> pop the boss
	if(GetServerVariable("[DynaBastok]Boss_Trigger") == 7) then
		SpawnMob(17539073);
		SetServerVariable("[DynaBastok]Boss_Trigger",0);
	end
	
end;