-----------------------------------
-- Area: Ranguemont Pass
--  NM:  Taisaijin
-----------------------------------

require("scripts/globals/titles");
local MobIDs = require("scripts/zones/Ranguemont_Pass/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(BYEBYE_TAISAI);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local ph = GetServerVariable("Taisaijin_PH");

    -- time to spawn
    local tts = os.time() + math.random(86400, 259200);
    SetServerVariable("Taisaijin_TTS", tts);

    -- reset ph and nm
    SetServerVariable("Taisaijin_PH", 0);
    DeterMob(ph, false);

    DeterMob(MobIDs.Taisaijin, true);
    SpawnMob(ph, "", GetMobRespawnTime(ph));

end;
