-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Loo Hepe the Eyepiercer
-- Boss Trigger for MEGA BOSS
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	-- If last boss trigger is killed -> pop the boss
	if(GetServerVariable("[DynaWindurst]Boss_Trigger") == 8) then
		SpawnMob(17543169);
		SetServerVariable("[DynaWindurst]Boss_Trigger",16);
	end
	
end;