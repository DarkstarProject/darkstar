-----------------------------------
-- Area: Ghelsba Outpost (140)
--  MOB: Orcish_Grunt
-----------------------------------

require("scripts/zones/Ghelsba_Outpost/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();
    if (Thousandarm_Deshglesh_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Thousandarm_Deshglesh");
        if (ToD <= os.time(t) and GetMobAction(Thousandarm_Deshglesh) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Thousandarm_Deshglesh);
                GetMobByID(Thousandarm_Deshglesh):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Thousandarm_Deshglesh", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
