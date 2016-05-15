-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Tottering_Toby
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Tottering_Toby's Window Open Time
    local wait = math.random((3600),(10800));
    SetServerVariable("[POP]Tottering_Toby", os.time(t) + wait); -- 1-6 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Tottering_Toby");
    SetServerVariable("[PH]Tottering_Toby", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

