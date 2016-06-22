-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Mee_Deggi_the_Punisher
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDespawn(mob, player, isKiller)
    if (isKiller) then -- using killer check to run once
        if (math.random(1,100) <= 5) then
            player:addTreasure(14986); -- Ochimusha Kote
        else
            player:addTreasure(16703); -- Impact Knuckles
        end
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Mee_Deggi_the_Punisher's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Mee_Deggi_the_Punisher", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Mee_Deggi_the_Punisher");
    SetServerVariable("[PH]Mee_Deggi_the_Punisher", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

