-----------------------------------
-- Area: Buburimu Peninsula (118)
--  MOB: Helldiver
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

    -- Set Helldiver's Window Open Time
    local wait = math.random(3600,28800);
    SetServerVariable("[POP]Helldiver", os.time() + wait); -- 1-8 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Helldiver");
    SetServerVariable("[PH]Helldiver", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

