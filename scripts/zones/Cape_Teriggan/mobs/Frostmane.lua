----------------------------------
-- Area: Cape Teriggan
--  NM:  Frostmane
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

    -- Set Frostmane's Window Open Time
    local wait = math.random(3600,21600) -- 1-6 hours
    SetServerVariable("[POP]Frostmane", os.time() + wait);
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Frostmane");
    SetServerVariable("[PH]Frostmane", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;