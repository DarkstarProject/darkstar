-----------------------------------
-- Area: Riverne Site A01
--  MOB: Heliodromos
-----------------------------------


-----------------------------------
-- onMobRoam
-----------------------------------

function onMobRoam(mob)

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

    if (Heliodromos_Despawn > 0 and Heliodromos_Despawn <= os.time()) then
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
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

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

    for i = 1, table.getn(Heliodromos_Table), 1 do
        if (Heliodromos_Table[i] ~= nil) then
            if (Heliodromos == Heliodromos_Table[i]) then
                SetServerVariable("Heliodromos_ToD", (os.time() + math.random((43200), (54000))));
                DeterMob(Heliodromos_PH_Table[i], false);
                DeterMob(Heliodromos_Table[i], true);
                SpawnMob(Heliodromos_PH_Table[i], "", GetMobRespawnTime(Heliodromos_PH_Table[i]));
            end
        end
    end

    if (GetServerVariable("Heliodromos_Despawn") == 0) then
        SetServerVariable("Heliodromos_Despawn", os.time() + 600);
    end
end;
