-----------------------------------
-- Area: Yuhtunga Jungle
-- MOB:  Rose Garden
-----------------------------------


-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)

    local Voluptuous_Vilma = 17281358;
    GetMobByID(Voluptuous_Vilma):setLocalVar("1",os.time() + math.random((36000), (37800)));

end;

-----------------------------------
-- onMobRoam
-----------------------------------

function onMobRoam(mob)

    local Voluptuous_Vilma = 17281358;
    local Voluptuous_Vilma_PH = 0;
    local Voluptuous_Vilma_PH_Table =
    {
        17281357
    };
    local Voluptuous_Vilma_ToD = GetMobByID(Voluptuous_Vilma):getLocalVar("1");

    if (Voluptuous_Vilma_ToD <= os.time()) then
        Voluptuous_Vilma_PH = math.random((0), (table.getn(Voluptuous_Vilma_PH_Table)));
        if (Voluptuous_Vilma_PH_Table[Voluptuous_Vilma_PH] ~= nil) then
            if (GetMobAction(Voluptuous_Vilma) == 0) then
                SetServerVariable("Voluptuous_Vilma_PH", Voluptuous_Vilma_PH_Table[Voluptuous_Vilma_PH]);
                DeterMob(Voluptuous_Vilma_PH_Table[Voluptuous_Vilma_PH], true);
                DeterMob(Voluptuous_Vilma, false);
                DespawnMob(Voluptuous_Vilma_PH_Table[Voluptuous_Vilma_PH]);
                SpawnMob(Voluptuous_Vilma, "", 0);
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local Rose_Garden = 17281357;
    local Rose_Garden_PH = GetServerVariable("Rose_Garden_PH");

    GetMobByID(Rose_Garden):setLocalVar("1",os.time() + math.random(36000,37800));
    SetServerVariable("Rose_Garden_PH", 0);
    DeterMob(Rose_Garden, true);
    DeterMob(Rose_Garden_PH, false);
    SpawnMob(Rose_Garden_PH, "", GetMobRespawnTime(Rose_Garden_PH));

end;