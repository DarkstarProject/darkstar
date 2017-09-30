-----------------------------------
-- Area: Korroloka Tunnel (173)
--  NM:  Dame_Blanche
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

    -- Set Dame_Blanche's Window Open Time
    local wait = math.random(7200,28800);
    SetServerVariable("[POP]Dame_Blanche", os.time() + wait); -- 1-8 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Dame_Blanche");
    SetServerVariable("[PH]Dame_Blanche", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

