-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Ochu
-- Note: PH for Drooling Daisy
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Rolanberry_Fields/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,88,1);

    local mobID = mob:getID();
    if (Drooling_Daisy_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Drooling_Daisy");
        if (ToD <= os.time(t) and GetMobAction(Drooling_Daisy) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Drooling_Daisy);
                GetMobByID(Drooling_Daisy):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Drooling_Daisy", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
