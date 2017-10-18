----------------------------------
-- Area: North Gustaberg
--  NM: tinging Sophie
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

    -- Set Stinging_Sophie's Window Open Time
    local wait = math.random(1200,3600)
    SetServerVariable("[POP]Stinging_Sophie", os.time() + wait); -- 20-60 minutes
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Stinging_Sophie");
    SetServerVariable("[PH]Stinging_Sophie", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;