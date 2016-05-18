-----------------------------------
-- Area: Bhaflau Thickets
--  NM:  Emergent Elm
-- @pos 71.000 -33.000 627.000 52
-----------------------------------

require("scripts/zones/Bhaflau_Thickets/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set EE's ToD
    SetServerVariable("[POP]Emergent_Elm", os.time(t) + 14400); -- 4 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Emergent_Elm");
    SetServerVariable("[PH]Emergent_Elm", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;