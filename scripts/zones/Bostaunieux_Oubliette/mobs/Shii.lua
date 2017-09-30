-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Shii
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Shii's Window Open Time
    local wait = math.random((14400),(28800));
    SetServerVariable("[POP]Shii", os.time() + wait); -- 4-8 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Shii");
    SetServerVariable("[PH]Shii", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

