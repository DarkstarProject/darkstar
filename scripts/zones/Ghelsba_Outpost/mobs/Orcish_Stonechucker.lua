-----------------------------------
-- Area: Ghelsba Outpost (140)
--  MOB: Orcish_Stonechucker
-----------------------------------

require("scripts/zones/Ghelsba_Outpost/MobIDs");

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
    if (Thousandarm_Deshglesh_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Thousandarm_Deshglesh");
        local checkPH = GetServerVariable("[PH]Thousandarm_Deshglesh");
        if (ToD <= os.time() and GetMobAction(Thousandarm_Deshglesh) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Thousandarm_Deshglesh);
                GetMobByID(Thousandarm_Deshglesh):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Thousandarm_Deshglesh", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end
end;