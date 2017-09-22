----------------------------------
-- Area: Kuftal Tunnel
--   NM: Yowie
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

    -- Set Yowie's Window Open Time
    local wait = math.random(7200,28800); -- 2-8 hours
    SetServerVariable("[POP]Yowie", os.time() + wait);
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Yowie");
    SetServerVariable("[PH]Yowie", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;