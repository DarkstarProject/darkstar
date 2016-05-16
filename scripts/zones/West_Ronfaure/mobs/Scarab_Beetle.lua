-----------------------------------
-- Area: West Ronfaure(100)
--  MOB: Scarab Beetle
-- Note: Place holder for Fungus Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,3,1);
    checkRegime(player,mob,4,2);

    local mobID = mob:getID();
    if (Fungus_Beetle_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Fungus_Beetle");
        if (ToD <= os.time(t) and GetMobAction(Fungus_Beetle) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Fungus_Beetle);
                GetMobByID(Fungus_Beetle):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Fungus_Beetle", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
