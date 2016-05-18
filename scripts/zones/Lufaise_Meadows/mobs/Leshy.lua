-----------------------------------
-- Area: Lufaise Meadows
-- MOB:  Leshy
-----------------------------------

function onMobRoam(mob)

    local Colorful_Leshy = 16875762;
    local Colorful_Leshy_PH = 0;
    local Colorful_Leshy_PH_Table =
    {
        16875754,
        16875755,
        16875756,
        16875757,
        16875758,
        16875759,
        16875760,
        16875761
    };
    local Colorful_Leshy_ToD = GetMobByID(Colorful_Leshy):getLocalVar("1");

    if (Colorful_Leshy_ToD <= os.time()) then
        Colorful_Leshy_PH = math.random((0), (table.getn(Colorful_Leshy_PH_Table)));
        if (Colorful_Leshy_PH_Table[Colorful_Leshy_PH] ~= nil) then
            if (GetMobAction(Colorful_Leshy) == 0) then
                SetServerVariable("Colorful_Leshy_PH", Colorful_Leshy_PH_Table[Colorful_Leshy_PH]);
                DeterMob(Colorful_Leshy_PH_Table[Colorful_Leshy_PH], true);
                DeterMob(Colorful_Leshy, false);
                DespawnMob(Colorful_Leshy_PH_Table[Colorful_Leshy_PH]);
                SpawnMob(Colorful_Leshy, "", 0);
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local Leshy = mob:getID();
    local Colorful_Leshy = 16875762;
    local Colorful_Leshy_PH_Table =
    {
        16875754,
        16875755,
        16875756,
        16875757,
        16875758,
        16875759,
        16875760,
        16875761
    };

    for i = 1, table.getn(Colorful_Leshy_PH_Table), 1 do
        if (Colorful_Leshy_PH_Table[i] ~= nil) then
            if (Leshy == Colorful_Leshy_PH_Table[i]) then
                GetMobByID(Colorful_Leshy):setLocalVar("1",os.time() + math.random((43200), (86400)));
            end
        end
    end

end;
