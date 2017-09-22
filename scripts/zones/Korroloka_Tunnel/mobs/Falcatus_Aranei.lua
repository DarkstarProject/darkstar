-----------------------------------
-- Area: Korroloka Tunnel (173)
--  NM:  Falcatus_Aranei
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

    -- Set Falcatus_Aranei's Window Open Time
    local wait = math.random(7200,14400);
    SetServerVariable("[POP]Falcatus_Aranei", os.time() + wait); -- 1-2 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Falcatus_Aranei");
    SetServerVariable("[PH]Falcatus_Aranei", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

