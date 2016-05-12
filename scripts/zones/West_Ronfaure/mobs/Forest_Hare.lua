-----------------------------------
-- Area: West Ronfaure
--  MOB: Forest Hare
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,2,1);

    local mobID = mob:getID();
    if (Jaggedy_Eared_Jack_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Jaggedy_Eared_Jack");
        if (ToD <= os.time(t) and GetMobAction(Jaggedy_Eared_Jack) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Jaggedy_Eared_Jack);
                GetMobByID(Jaggedy_Eared_Jack):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Jaggedy_Eared_Jack", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
