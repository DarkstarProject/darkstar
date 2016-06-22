-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Quu_Domi_the_Gallant
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDespawn(mob, player, isKiller)
    if (isKiller) then -- using killer check to run once
        if (math.random(1,100) <= 7) then
            player:addTreasure(15737); -- Sarutobi Kyahan
        else
            player:addTreasure(16820); -- Strider Sword
        end
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Quu_Domi_the_Gallant's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Quu_Domi_the_Gallant", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Quu_Domi_the_Gallant");
    SetServerVariable("[PH]Quu_Domi_the_Gallant", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

