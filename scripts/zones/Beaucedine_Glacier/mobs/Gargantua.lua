-----------------------------------
-- Area: Beaucedine Glacier (111)
--  NM:  Gargantua
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

    -- Set Gargantua's Window Open Time
    local wait = math.random((3600),(25200));
    SetServerVariable("[POP]Gargantua", os.time() + wait); -- 1-7 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Gargantua");
    SetServerVariable("[PH]Gargantua", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;