-----------------------------------
-- Area: East Ronfaure
--  NM:  Swamfisk
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Swamfisk's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Swamfisk", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Swamfisk");
    SetServerVariable("[PH]Swamfisk", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
