-----------------------------------
-- Area: East Sarutabaruta (116)
--  NM:  Sharp-Eared_Ropipi
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Sharp_Eared_Ropipi's Window Open Time
    SetServerVariable("[POP]Sharp_Eared_Ropipi", os.time(t) + 300); -- 5 minutes
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Sharp_Eared_Ropipi");
    SetServerVariable("[PH]Sharp_Eared_Ropipi", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

