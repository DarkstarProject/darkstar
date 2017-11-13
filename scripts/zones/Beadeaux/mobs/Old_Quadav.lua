-----------------------------------
-- Area: Beadeaux
--  MOB: Old Quadav
-- PH for Ge'Dha Evileye
-----------------------------------
require("scripts/zones/Beadeaux/MobIDs");

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
    if (mobID == Ge_Dha_Evileye_PH) then
        local ToD = GetServerVariable("[POP]Ge_Dha_Evileye");
        if (ToD <= os.time() and GetMobByID(Ge_Dha_Evileye):isDead()) then
            -- Set ToD, DisallowRespawn PH repop, set NM respawn time
            if (math.random(1,4) == 2) then
                DisallowRespawn(Ge_Dha_Evileye, false);
                UpdateNMSpawnPoint(Ge_Dha_Evileye);
                GetMobByID(Ge_Dha_Evileye):setRespawnTime(GetMobRespawnTime(mobID));
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
