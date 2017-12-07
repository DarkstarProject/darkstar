-----------------------------------
-- Area: Batallia Downs (105)
--  MOB: Tottering_Toby
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Tottering_Toby's Window Open Time
    SetServerVariable("[POP]Tottering_Toby", os.time() + math.random(3600,10800)); -- 1-6 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Tottering_Toby");
    SetServerVariable("[PH]Tottering_Toby", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;
