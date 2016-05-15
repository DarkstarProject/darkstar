-----------------------------------
-- Area: Yughott Grotto (142)
--  MOB: Orcish_Stonechucker
-----------------------------------

-- require("scripts/zones/Yughott_Grotto/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Ashmaker_Gotblut_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Ashmaker_Gotblut");
        if (ToD <= os.time(t) and GetMobAction(Ashmaker_Gotblut) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Ashmaker_Gotblut);
                GetMobByID(Ashmaker_Gotblut):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Ashmaker_Gotblut", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;