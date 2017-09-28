-----------------------------------
-- Area: Yughott Grotto (142)
--   NM: Ashmaker_Gotblut
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

    -- Set Ashmaker_Gotblut's Window Open Time
    local wait = math.random(7200,10800)
    SetServerVariable("[POP]Ashmaker_Gotblut", os.time() + wait); -- 2-3 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Ashmaker_Gotblut");
    SetServerVariable("[PH]Ashmaker_Gotblut", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

