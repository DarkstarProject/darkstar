-----------------------------------
-- Area: East Sarutabaruta (116)
-- NM: Duke_Decapod
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    -- Set Duke_Decapod's Window Open Time
    local wait = math.random(3000,3600); -- between 50 and 60 minute spawn timer
    SetServerVariable("[POP]Duke_Decapod", os.time(t) + wait);
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Duke_Decapod");
    SetServerVariable("[PH]Duke_Decapod", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
