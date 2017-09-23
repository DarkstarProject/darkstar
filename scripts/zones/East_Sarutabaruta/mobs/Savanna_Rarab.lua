-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Savanna Rarab
-- Note: PH for Sharp Eared Ropipi
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,91,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Sharp_Eared_Ropipi_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Sharp_Eared_Ropipi");
        if (ToD <= os.time() and GetMobAction(Sharp_Eared_Ropipi) == 0) then
            if (math.random(1,5) == 3) then
                UpdateNMSpawnPoint(Sharp_Eared_Ropipi);
                GetMobByID(Sharp_Eared_Ropipi):setRespawnTime(mob);
                SetServerVariable("[PH]Sharp_Eared_Ropipi", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;
