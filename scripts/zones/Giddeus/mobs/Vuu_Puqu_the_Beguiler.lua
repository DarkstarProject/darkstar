-----------------------------------
-- Area: Giddeus (145)
--  NM:  Vuu_Puqu_the_Beguiler
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Vuu_Puqu_the_Beguiler's Window Open Time
    SetServerVariable("[POP]Vuu_Puqu_the_Beguiler", os.time(t) + math.random((7200),(14400))); -- 2-4 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Vuu_Puqu_the_Beguiler");
    SetServerVariable("[PH]Vuu_Puqu_the_Beguiler", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

