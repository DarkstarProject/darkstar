-----------------------------------
-- Area: Bhaflau Thickets
--  NM:  Mahishasura
-- !pos 206.510 -16.320 357.724 52
-----------------------------------

require("scripts/zones/Bhaflau_Thickets/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Mahishasura's ToD
    SetServerVariable("[POP]Mahishasura", os.time() + 10800); -- 3 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Mahishasura");
    SetServerVariable("[PH]Mahishasura", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;