-----------------------------------
-- Area: Korroloka Tunnel (173)
--  NM:  Cargo Crab Colin
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

    -- Set Cargo_Crab_Colin's Window Open Time
    local wait = math.random(7200,21600);
    SetServerVariable("[POP]Cargo_Crab_Colin", os.time() + wait); -- 1-6 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Cargo_Crab_Colin");
    SetServerVariable("[PH]Cargo_Crab_Colin", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

