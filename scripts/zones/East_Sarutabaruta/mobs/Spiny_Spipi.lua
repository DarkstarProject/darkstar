-----------------------------------
-- Area: East Sarutabaruta
--  NM:  Spiny Spipi
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

    -- Set Spiny_Spipi's Window Open Time
    local wait = math.random(2700,7200)
    SetServerVariable("[POP]Spiny_Spipi", os.time() + wait); -- 45 - 120 minutes
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Spiny_Spipi");
    SetServerVariable("[PH]Spiny_Spipi", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;