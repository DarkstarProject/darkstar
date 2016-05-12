-----------------------------------
-- Area:
--  MOB: Baronet_Romwe
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

    -- Set Baronet_Romwe's Window Open Time
    local wait = math.random(3600,28800);
    SetServerVariable("[POP]Baronet_Romwe", os.time(t) + wait); -- 1-8 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Baronet_Romwe");
    SetServerVariable("[PH]Baronet_Romwe", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;