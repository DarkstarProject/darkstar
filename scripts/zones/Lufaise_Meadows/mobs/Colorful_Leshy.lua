-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Colorful Leshy
-----------------------------------

function onMobSpawn(mob)
    local Defoliate_Leshy = 16875763;
    GetMobByID(Defoliate_Leshy):setLocalVar("1", os.time() + math.random((43200), (86400)));
end;

function onMobRoam(mob)
    local Defoliate_Leshy = 16875763;
    local Defoliate_Leshy_PH = 0;
    local Defoliate_Leshy_PH_Table =
    {
        16875762
    };
    local Defoliate_Leshy_ToD = GetMobByID(Defoliate_Leshy):getLocalVar("1");

    if (Defoliate_Leshy_ToD <= os.time()) then
        Defoliate_Leshy_PH = math.random((0), (#Defoliate_Leshy_PH_Table));
        if (Defoliate_Leshy_PH_Table[Defoliate_Leshy_PH] ~= nil) then
            if (GetMobAction(Defoliate_Leshy) == 0) then
                SetServerVariable("Defoliate_Leshy_PH", Defoliate_Leshy_PH_Table[Defoliate_Leshy_PH]);
                DisallowRespawn(Defoliate_Leshy_PH_Table[Defoliate_Leshy_PH], true);
                DisallowRespawn(Defoliate_Leshy, false);
                DespawnMob(Defoliate_Leshy_PH_Table[Defoliate_Leshy_PH]);
                SpawnMob(Defoliate_Leshy, "", 0);
            end
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local Colorful_Leshy = 16875762;
    local Colorful_Leshy_PH = GetServerVariable("Colorful_Leshy_PH");

    GetMobByID(Colorful_Leshy):setLocalVar("1", os.time() + math.random((43200), (86400)));
    SetServerVariable("Colorful_Leshy_PH", 0);
    DisallowRespawn(Colorful_Leshy, true);
    DisallowRespawn(Colorful_Leshy_PH, false);
    SpawnMob(Colorful_Leshy_PH, "", GetMobRespawnTime(Colorful_Leshy_PH));
end;