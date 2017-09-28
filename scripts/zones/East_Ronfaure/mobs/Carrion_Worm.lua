-----------------------------------
-- Area: East Ronfaure
--  MOB: Carrion Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,65,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Bigmouth_Billy_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Bigmouth_Billy");
        local checkPH = GetServerVariable("[PH]Bigmouth_Billy");
        if (ToD <= os.time() and GetMobAction(Bigmouth_Billy) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Bigmouth_Billy);
                GetMobByID(Bigmouth_Billy):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Bigmouth_Billy", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

end;
