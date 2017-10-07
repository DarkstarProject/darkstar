----------------------------------
-- Area: North Gustaberg
--  NM:  Maighdean Uaine
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Maighdean_Uaine's Window Open Time
    local wait = math.random(900,10800)
    SetServerVariable("[POP]Maighdean_Uaine", os.time() + wait); -- 15-180 minutes
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Maighdean_Uaine");
    SetServerVariable("[PH]Maighdean_Uaine", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;