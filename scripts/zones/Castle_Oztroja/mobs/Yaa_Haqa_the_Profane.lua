-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yaa_Haqa_the_Profane
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Yaa_Haqa_the_Profane's Window Open Time
    local wait = math.random(3600,7200);
    SetServerVariable("[POP]Yaa_Haqa_the_Profane", os.time(t) + wait); -- 1-2 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Yaa_Haqa_the_Profane");
    SetServerVariable("[PH]Yaa_Haqa_the_Profane", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

