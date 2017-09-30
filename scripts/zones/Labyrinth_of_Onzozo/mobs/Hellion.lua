----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Hellion
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

    -- Set Hellion's Window Open Time
    local wait = math.random(7200,14400);
    SetServerVariable("[POP]Hellion", os.time() + wait); -- 2-4 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Hellion");
    SetServerVariable("[PH]Hellion", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;