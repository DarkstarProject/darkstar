-----------------------------------
-- Area: Carpenters' Landing
--  NM:  Orctrap (NM)
-- !pos 180.087 -5.484 -532.799 2
-----------------------------------

require("scripts/zones/Carpenters_Landing/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Orctrap's ToD
    SetServerVariable("[POP]Orctrap", os.time() + math.random(3600,25200)); -- 1-7 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Orctrap");
    SetServerVariable("[PH]Orctrap", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;