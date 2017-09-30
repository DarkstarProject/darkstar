-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Eldritch Edge
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

    -- Set Eldritch Edge's Window Open Time
    local wait = math.random(5400,7200);
    SetServerVariable("[POP]Eldritch_Edge", os.time() + wait); -- 90 to 120 minutes
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Eldritch_Edge");
    SetServerVariable("[PH]Eldritch_Edge", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
