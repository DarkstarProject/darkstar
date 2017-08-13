-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Quu_Domi_the_Gallant
-----------------------------------


-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    if (math.random(1,100) <= 7) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(2916,15737,1000); -- Sarutobi Kyahan
        SetDropRate(2916,16820,0);
    else
        SetDropRate(2916,15737,0);
        SetDropRate(2916,16820,1000); -- Strider Sword
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

    -- Set Quu_Domi_the_Gallant's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Quu_Domi_the_Gallant", os.time() + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Quu_Domi_the_Gallant");
    SetServerVariable("[PH]Quu_Domi_the_Gallant", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
