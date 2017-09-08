-----------------------------------
-- Area: Palborough Mines
--  Mob: Copper Beetle
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
    local mobID = mob:getID();
    if (Bu_Ghi_Howlblade_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[ToD]Bu_Ghi_Howlblade");
        if (ToD <= os.time() and GetMobAction(Bu_Ghi_Howlblade) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Bu_Ghi_Howlblade);
                GetMobByID(Bu_Ghi_Howlblade):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Bu_Ghi_Howlblade", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
