-----------------------------------
-- Area: Beaucedine Glacier (111)
--  NM:  Kirata
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

    -- Set Kirata's Window Open Time
    local wait = math.random((3600),(28800));
    SetServerVariable("[POP]Kirata", os.time() + wait); -- 1-8 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Kirata");
    SetServerVariable("[PH]Kirata", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;