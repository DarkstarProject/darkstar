-----------------------------------
-- Area: West Sarutabaruta (115)
--  NM:  Nunyenunc
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Nunyenunc's Window Open Time
    local wait = math.random(720010800);
    SetServerVariable("[POP]Nunyenunc", os.time(t) + wait); -- 2-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Nunyenunc");
    SetServerVariable("[PH]Nunyenunc", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

