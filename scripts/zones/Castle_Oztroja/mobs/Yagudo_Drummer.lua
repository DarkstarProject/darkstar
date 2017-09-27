-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Drummer
-----------------------------------

require("scripts/zones/Castle_Oztroja/MobIDs");

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
    if (Mee_Deggi_the_Punisher_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Mee_Deggi_the_Punisher");
        local checkPH = GetServerVariable("[PH]Mee_Deggi_the_Punisher");
        if (ToD <= os.time() and GetMobAction(Mee_Deggi_the_Punisher) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Mee_Deggi_the_Punisher);
                GetMobByID(Mee_Deggi_the_Punisher):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Mee_Deggi_the_Punisher", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

end;

