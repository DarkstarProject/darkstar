----------------------------------
-- Area: Gustav Tunnel
--   NM: Goblinsavior Heronox
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

    -- Set Goblinsavior Heronox's Window Open Time
    local wait = math.random(10800,18000);  -- 3-5 hours
    SetServerVariable("[POP]Goblinsavior_Heronox", os.time() + wait);
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Goblinsavior_Heronox");
    SetServerVariable("[PH]Goblinsavior_Heronox", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;