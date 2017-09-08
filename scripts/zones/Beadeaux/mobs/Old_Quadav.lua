-----------------------------------
-- Area: Beadeaux
--  MOB: Old Quadav
-- PH for Ge'Dha Evileye
-----------------------------------
require("scripts/zones/Beadeaux/TextIDs");
require("scripts/globals/missions");

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
    if (Ge_Dha_Evileye_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Ge_Dha_Evileye");
        if (ToD <= os.time() and GetMobAction(Ge_Dha_Evileye) == 0) then
            if (math.random(1,4) == 2) then
                UpdateNMSpawnPoint(Ge_Dha_Evileye);
                GetMobByID(Ge_Dha_Evileye):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Ge_Dha_Evileye", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;