-----------------------------------
-- Area: Castle Zvahl Keep
--  MOB: Count_Bifrons
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(HELLSBANE);

    -- Set Count_Bifrons's Window Open Time
    local wait = math.random(3600,28800);
    SetServerVariable("[POP]Count_Bifrons", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Count_Bifrons");
    SetServerVariable("[PH]Count_Bifrons", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;