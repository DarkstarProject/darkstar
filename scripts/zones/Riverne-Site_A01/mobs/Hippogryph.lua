-----------------------------------
-- Area: Riverne Site A01
-- MOB:  Hippogryph
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
    local Heliodromos_ToD = GetServerVariable("Heliodromos_ToD");


    if (Heliodromos_ToD <= os.time()) then
        for i=1, table.getn(Heliodromos_Table), 1 do
            if (Heliodromos_PH_Table[i] ~= nil) then
                if (GetMobAction(Heliodromos_Table[i]) == 0) then
                    DeterMob(Heliodromos_PH_Table[i], true);
                    DeterMob(Heliodromos_Table[i], false);
                    DespawnMob(Heliodromos_PH_Table[i]);
                    SetServerVariable("Heliodromos_Despawn", 0);
                    SpawnMob(Heliodromos_Table[i], "", 0);
                end
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local Hippogryph = mob:getID();
    local Heliodromos_PH_Table =
    {
        16900107,
        16900108,
        16900109
    };

    for i = 1, table.getn(Heliodromos_PH_Table), 1 do
        if (Heliodromos_PH_Table[i] ~= nil) then
            if (Hippogryph == Heliodromos_PH_Table[i]) then
                SetServerVariable("Heliodromos_ToD", (os.time() + math.random((43200), (54000))));
            end
        end
    end

end;