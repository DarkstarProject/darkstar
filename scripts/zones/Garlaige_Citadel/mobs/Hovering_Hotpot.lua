-----------------------------------
-- Area: Garlaige Citadel (164)
--  NM:  Hovering Hotpot
-----------------------------------
require("scripts/zones/Garlaige_Citadel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Set Hovering Hotpot's Window Open Time
    local wait = math.random(1800,3600);
    SetServerVariable("[POP]Hovering_Hotpot", os.time(t) + 3600); -- 1 hour
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn
    local PH = GetServerVariable("[PH]Hovering_Hotpot");
    SetServerVariable("[PH]Hovering_Hotpot", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;
