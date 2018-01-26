-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--   NM: Bomb_King
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- Set Lilac Tower NMs Window Open Time
    local wait = math.random(2700,3600); -- between 45 and 60 minute spawn timer
    SetServerVariable("[POP]MultiNM_Zone_194", os.time() + wait);
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]MultiNM_Zone_194");
    SetServerVariable("[PH]MultiNM_Zone_194", 0);
    SetServerVariable("[NM]MultiNM_Zone_194", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
