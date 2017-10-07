-----------------------------------
-- Area: Crawlers' Nest (197)
--  MOB: Demonic_Tiphia
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

    -- Set Demonic_Tiphia's Window Open Time
    local wait = math.random(7200,28800);
    SetServerVariable("[POP]Demonic_Tiphia", os.time() + wait); -- 2-8 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Demonic_Tiphia");
    SetServerVariable("[PH]Demonic_Tiphia", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;