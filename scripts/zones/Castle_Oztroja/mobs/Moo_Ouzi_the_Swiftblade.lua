-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Moo_Ouzi_the_Swiftblade
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDespawn(mob, player, isKiller)
    if (isKiller) then -- using killer check to run once
        if (math.random(1,100) <= 14) then
            player:addTreasure(16936); -- Demonic Sword
        else
            player:addTreasure(16935); -- Barbarians Sword
        end
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Moo_Ouzi_the_Swiftblade's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Moo_Ouzi_the_Swiftblade", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Moo_Ouzi_the_Swiftblade");
    SetServerVariable("[PH]Moo_Ouzi_the_Swiftblade", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

