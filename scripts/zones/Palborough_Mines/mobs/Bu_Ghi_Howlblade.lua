-----------------------------------
-- Area: Palborough Mines
--  NM : Bu'Ghi Howlblade
-----------------------------------
require("scripts/zones/Palborough_Mines/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Set ToD, DisallowRespawn NM, set placeholder respawn time, set Placeholder back to normal
    SetServerVariable("[ToD]Bu_Ghi_Howlblade", os.time() + 3600); -- 1 hour
    DisallowRespawn(mob:getID(), true);
    local PH = GetServerVariable("[PH]Bu_Ghi_Howlblade");
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    SetServerVariable("[PH]Bu_Ghi_Howlblade", 0);
    DisallowRespawn(PH, false);
end;
