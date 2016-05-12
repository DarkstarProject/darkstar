-----------------------------------
-- Area: Mount Zhayolm
--  NM:  Energetic Eruca
-- @pos 176.743 -14.210 -180.926 61
-----------------------------------

require("scripts/zones/Mount_Zhayolm/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set EnE's ToD
    SetServerVariable("[POP]Energetic_Eruca", os.time(t) + 86400); -- 24 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Energetic_Eruca");
    SetServerVariable("[PH]Energetic_Eruca", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
