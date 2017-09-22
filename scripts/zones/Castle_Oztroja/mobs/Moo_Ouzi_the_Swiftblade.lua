-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Moo_Ouzi_the_Swiftblade
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    if (math.random(1,100) <= 14) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(2343,16936,1000); -- Demonic Sword
        SetDropRate(2343,16935,0);
    else
        SetDropRate(2343,16936,0);
        SetDropRate(2343,16935,1000); -- Barbarians Sword
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Moo_Ouzi_the_Swiftblade's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Moo_Ouzi_the_Swiftblade", os.time() + wait); -- 1-3 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Moo_Ouzi_the_Swiftblade");
    SetServerVariable("[PH]Moo_Ouzi_the_Swiftblade", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
