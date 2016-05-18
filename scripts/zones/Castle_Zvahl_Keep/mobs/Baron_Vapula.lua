-----------------------------------
-- Area:
--  MOB: Baron_Vapula
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

    -- Set Baron_Vapula's Window Open Time
    local wait = math.random(3600,28800);
    SetServerVariable("[POP]Baron_Vapula", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Baron_Vapula");
    SetServerVariable("[PH]Baron_Vapula", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;