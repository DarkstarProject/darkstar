----------------------------------
-- Area: Kuftal Tunnel
--   NM: Bloodthirster Madkix
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Bloodthirster Madkix's Window Open Time
    local wait = math.random(7200,28800); -- 2-8 hours
    SetServerVariable("[POP]Bloodthirster_Madkix", os.time(t) + wait);
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Bloodthirster_Madkix");
    SetServerVariable("[PH]Bloodthirster_Madkix", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;