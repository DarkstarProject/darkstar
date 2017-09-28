-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Tundra Tiger
-- Note: PH for Nue, Kirata
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Beaucedine_Glacier/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,46,1);
    checkRegime(player,mob,47,1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    -- Kirata
    if (Kirata_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Kirata");
        local checkPH = GetServerVariable("[PH]Kirata");
        if (ToD <= os.time() and GetMobAction(Kirata) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Kirata);
                GetMobByID(Kirata):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Kirata", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

    -- Nue
    if (Nue_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Nue");
        local checkPH = GetServerVariable("[PH]Nue");
        if (ToD <= os.time() and GetMobAction(Nue) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Nue);
                GetMobByID(Nue):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Nue", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end
end;
