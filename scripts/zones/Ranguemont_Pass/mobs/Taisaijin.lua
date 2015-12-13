-----------------------------------
-- Area: Ranguemont Pass
--  NM:  Taisaijin
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)

    local Taisaijin = 17457216;
    local Taisaijin_PH = GetServerVariable("Taisaijin_PH");

    GetMobByID(Taisaijin):setLocalVar("ToD", os.time() + math.random(86400, 259200));
    SetServerVariable("Taisaijin_PH", 0);
    DeterMob(Taisaijin, true);
    DeterMob(Taisaijin_PH, false);
    SpawnMob(Taisaijin_PH, "", GetMobRespawnTime(Taisaijin_PH));

    ally:addTitle(BYEBYE_TAISAI);

end;