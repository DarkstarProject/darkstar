-----------------------------------
-- Area: Yuhtunga Jungle
-- MOB:  Overgrown Rose
-----------------------------------

function onMobRoam(mob)

    local Rose_Garden = 17281357;
    local Rose_Garden_PH = 0;
    local Rose_Garden_PH_Table =
    {
        17281356
    };
    local Rose_Garden_ToD = GetMobByID(Rose_Garden):getLocalVar("1");

    if (Rose_Garden_ToD <= os.time()) then
        Rose_Garden_PH = math.random((0), (table.getn(Rose_Garden_PH_Table)));
        if (Rose_Garden_PH_Table[Rose_Garden_PH] ~= nil) then
            if (GetMobAction(Rose_Garden) == 0) then
                SetServerVariable("Rose_Garden_PH", Rose_Garden_PH_Table[Rose_Garden_PH]);
                DeterMob(Rose_Garden_PH_Table[Rose_Garden_PH], true);
                DeterMob(Rose_Garden, false);
                DespawnMob(Rose_Garden_PH_Table[Rose_Garden_PH]);
                SpawnMob(Rose_Garden, "", 0);
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local Overgrown_Rose = mob:getID();
    local Rose_Garden = 17281357;
    local Rose_Garden_PH_Table =
    {
        17281356
    };

    for i = 1, table.getn(Rose_Garden_PH_Table), 1 do
        if (Rose_Garden_PH_Table[i] ~= nil) then
            if (Overgrown_Rose == Rose_Garden_PH_Table[i]) then
                GetMobByID(Rose_Garden):setLocalVar("1",os.time() + math.random((36000), (37800)));
            end
        end
    end

end;
