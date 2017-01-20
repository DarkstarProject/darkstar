-----------------------------------
-- Area: Ranguemont Pass
--  NM:  Taisaijin
-----------------------------------

require("scripts/globals/titles");

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

    local Taisaijin = 17457216;
    local Taisaijin_PH = GetServerVariable("Taisaijin_PH");

    -- time to spawn
    local tts = os.time() + math.random(86400, 259200);
    SetServerVariable("Taisaijin_TTS", tts);

    -- reset ph and nm
    SetServerVariable("Taisaijin_PH", 0);
    DeterMob(Taisaijin_PH, false);

    DeterMob(Taisaijin, true);
    SpawnMob(Taisaijin_PH, "", GetMobRespawnTime(Taisaijin_PH));

end;
