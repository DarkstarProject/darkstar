-----------------------------------
-- Area: Crawlers nest [S] (171)
--  NM:  Morille Mortelle
-- @pos 59.788 -0.939 22.316 171
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
    -- Set Window Open Time
    SetServerVariable("[POP]Morille_Mortelle", os.time() + 18000); -- 5 hour
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Morille_Mortelle");
    SetServerVariable("[PH]Morille_Mortelle", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;
