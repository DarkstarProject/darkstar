-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Taisai
-----------------------------------

function onMobRoam(mob)

    local Taisaijin = 17457216;
    local Taisaijin_PH = 0;
    local Taisaijin_PH_Table =
    {
        17457213,
        17457214,
        17457215
    };
    local Taisaijin_ToD = GetMobByID(Taisaijin):getLocalVar("ToD");

    if (Taisaijin_ToD <= os.time()) then
        Taisaijin_PH = math.random((0), (table.getn(Taisaijin_PH_Table)));
        if (Taisaijin_PH_Table[Taisaijin_PH] ~= nil) then
            if (GetMobAction(Taisaijin) == 0) then
                SetServerVariable("Taisaijin_PH", Taisaijin_PH_Table[Taisaijin_PH]);
                DeterMob(Taisaijin_PH_Table[Taisaijin_PH], true);
                DeterMob(Taisaijin, false);
                DespawnMob(Taisaijin_PH_Table[Taisaijin_PH]);
                SpawnMob(Taisaijin, "", 0);
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local Taisai = mob:getID();
    local Taisaijin = 17457216;
    local Taisaijin_PH_Table =
    {
        17457213,
        17457214,
        17457215
    };

    for i = 1, table.getn(Taisaijin_PH_Table), 1 do
        if (Taisaijin_PH_Table[i] ~= nil) then
            if (Taisai == Taisaijin_PH_Table[i]) then
                GetMobByID(Taisaijin):setLocalVar("ToD",os.time() + math.random((86400), (259200)));
            end
        end
    end

end;
