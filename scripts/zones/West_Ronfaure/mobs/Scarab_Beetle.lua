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

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Fungus_Beetle_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Fungus_Beetle");
        local checkPH = GetServerVariable("[PH]Fungus_Beetle");
        if (ToD <= os.time() and GetMobAction(Fungus_Beetle) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Fungus_Beetle);
                GetMobByID(Fungus_Beetle):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Fungus_Beetle", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end
end;
