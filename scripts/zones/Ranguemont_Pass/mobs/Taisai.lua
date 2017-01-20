-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Taisai
-----------------------------------

require("scripts/globals/status");

local Taisaijin = 17457216;
local Taisaijin_PH_Table = {
    [17457213] = 1,
    [17457214] = 1,
    [17457215] = 1
};
local Taisaijin_PH_Array = {};
local numPHs = 0;
for k,v in pairs(Taisaijin_PH_Table) do
    numPHs = numPHs + 1;
    table.insert(Taisaijin_PH_Array, k);
end

function onMobRoam(mob)

    local tts = GetServerVariable("Taisaijin_TTS");
    if (tts > 0 and tts <= os.time() and GetMobAction(Taisaijin) == ACTION_NONE) then
        -- choose a new PH
        local idx = math.random(1, numPHs);
        local ph = Taisaijin_PH_Array[idx];
        -- print("New jin ph: " .. ph); -- debug
        SetServerVariable("Taisaijin_PH", ph);

        -- despawn ph, spawn nm
        DeterMob(ph, true);
        DespawnMob(ph);
        DeterMob(Taisaijin, false);
        SpawnMob(Taisaijin);

        -- reset
        -- print("Resetting jin tts"); -- debug
        SetServerVariable("Taisaijin_TTS", 0);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    if (Taisaijin_PH_Table[mob:getID()] and GetServerVariable("Taisaijin_PH") > 0) then
        -- time to spawn
        local tts = os.time() + math.random(86400, 259200);
        SetServerVariable("Taisaijin_TTS", tts);
    end

end
