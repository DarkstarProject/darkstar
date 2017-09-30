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
        local checkPH = GetServerVariable("[PH]Bu_Ghi_Howlblade");
        if (ToD <= os.time() and GetMobByID(Bu_Ghi_Howlblade):isDead()) then
            -- Set ToD, DisallowRespawn PH repop, set NM respawn time
            if (math.random(1,10) == 5 and checkPH == 0) then
                DisallowRespawn(Bu_Ghi_Howlblade, false);
                UpdateNMSpawnPoint(Bu_Ghi_Howlblade);
                GetMobByID(Bu_Ghi_Howlblade):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Bu_Ghi_Howlblade", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
