-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Myxomycete
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/weather");

function onMobRoam(mob)

    local Noble_Mold = 17273278;
    local Noble_Mold_PH = 0;
    local Noble_Mold_PH_Table =
    {
        17273276,
        17273277
    };
    local Noble_Mold_ToD = GetMobByID(Noble_Mold):getLocalVar("ToD");

    if (Noble_Mold_ToD <= os.time()) then
        Noble_Mold_PH = math.random((0), (table.getn(Noble_Mold_PH_Table)));
        if (Noble_Mold_PH_Table[Noble_Mold_PH] ~= nil) then
            if (
            GetMobAction(Noble_Mold) == 0 and
                (
                GetMobByID(Noble_Mold_PH_Table[Noble_Mold_PH]):getWeather() == WEATHER_RAIN or
                GetMobByID(Noble_Mold_PH_Table[Noble_Mold_PH]):getWeather() == WEATHER_SQUALL
                )
            ) then
                SetServerVariable("Noble_Mold_PH", Noble_Mold_PH_Table[Noble_Mold_PH]);
                DeterMob(Noble_Mold_PH_Table[Noble_Mold_PH], true);
                DeterMob(Noble_Mold, false);
                DespawnMob(Noble_Mold_PH_Table[Noble_Mold_PH]);
                SpawnMob(Noble_Mold, "", 0);
            end
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local Myxomycete = mob:getID();
    local Noble_Mold = 17273278;
    local Noble_Mold_PH_Table =
    {
        17273276,
        17273277
    };

    for i = 1, table.getn(Noble_Mold_PH_Table), 1 do
        if (Noble_Mold_PH_Table[i] ~= nil) then
            if (Myxomycete == Noble_Mold_PH_Table[i]) then
                GetMobByID(Noble_Mold):setLocalVar("ToD",os.time() + math.random((43200), (57600)));
            end
        end
    end

    checkRegime(player, mob, 115, 1);
    checkRegime(player, mob, 116, 2);

end;
