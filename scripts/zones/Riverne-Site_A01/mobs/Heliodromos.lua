-----------------------------------
-- Area: Riverne Site A01
-- MOB:  Heliodromos
-----------------------------------
-----------------------------------


function OnMobRoam(mob)


	local Heliodromos_Table = 
	{
		16900110,
		16900111,
		16900112
	};
	local Heliodromos_PH_Table =
	{
		16900107,
		16900108,
		16900109
	};
	local Heliodromos_Despawn = GetServerVariable("Heliodromos_Despawn");
	local Despawn_Time = 0;
	
	if ( Heliodromos_Despawn > 0) then
		Despawn_Time = os.time() + 600;
	end
	
	if (Despawn_Time <= os.time() and Despawn_Time > 0) then
		for i=1, table.getn(Heliodromos_Table), 1 do
			if (Heliodromos_PH_Table[i] ~= nil) then
				if (GetMobAction(Heliodromos_PH_Table[i]) == 0) then
					DeterMob(Heliodromos_Table[i], true);
					DeterMob(Heliodromos_PH_Table[i], false);
					DespawnMob(Heliodromos_Table[i]);
					SpawnMob(Heliodromos_PH_Table[i], "", GetMobRespawnTime(Heliodromos_PH_Table[i]));
				end
			end
		end
		Despawn_Time = 0;
	end
	
	
end;


-----------------------------------
-- onMobDeath
-----------------------------------


function onMobDeath(mob, killer)	


	local Heliodromos = mob:getID();
	local Heliodromos_Table = 
	{
		16900110,
		16900111,
		16900112
	};
	local Heliodromos_PH_Table =
	{
		16900107,
		16900108,
		16900109
	};
	local Heliodromos_Despawn = GetServerVariable("Heliodromos_Despawn");
	
	
	for i = 1, table.getn(Heliodromos_Table), 1 do
		if (Heliodromos_Table[i] ~= nil) then
			if (Heliodromos == Heliodromos_Table[i]) then
				SetServerVariable("Heliodromos_ToD", (os.time() + math.random((43200), (54000))));
				SetServerVariable("Heliodromos_Despawn", Heliodromos_Despawn + 1);
				DeterMob(Heliodromos_PH_Table[i], false);
				SpawnMob(Heliodromos_PH_Table[i], "", GetMobRespawnTime(Heliodromos_PH_Table[i]));
			end
		end
	end
end;
