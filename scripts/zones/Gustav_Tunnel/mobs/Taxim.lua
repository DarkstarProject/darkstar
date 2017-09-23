----------------------------------
-- Area: Gustav Tunnel
--   NM: Taxim
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

    -- Set Taxim's Window Open Time
    SetServerVariable("[POP]Taxim", os.time() + 7200); -- 2 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Taxim");
    SetServerVariable("[PH]Taxim", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;