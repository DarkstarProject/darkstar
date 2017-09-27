-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Crawler
-- Note: PH for Spiny Spipi
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,92,2);
    checkRegime(player,mob,93,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Spiny_Spipi_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Spiny_Spipi");
        local checkPH = GetServerVariable("[PH]Spiny_Spipi");
        if (ToD <= os.time() and GetMobAction(Spiny_Spipi) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Spiny_Spipi);
                GetMobByID(Spiny_Spipi):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Spiny_Spipi", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

end;
