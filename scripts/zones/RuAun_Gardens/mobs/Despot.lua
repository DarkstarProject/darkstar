-----------------------------------
-- Area: RuAun Gardens
--  NM:  Despot
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

    -- Set Despot ToD
    SetServerVariable("[POP]Despot", os.time() + 7200); -- 2 hour
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Despot");
    SetServerVariable("[PH]Despot", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
