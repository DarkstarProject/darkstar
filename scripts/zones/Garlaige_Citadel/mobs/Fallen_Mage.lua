-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Mage
-- Note: Place holder Hovering Hotpot
-----------------------------------
require("scripts/zones/Garlaige_Citadel/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,703,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Hovering_Hotpot_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Hovering_Hotpot");
        if (ToD <= os.time(t) and GetMobAction(Hovering_Hotpot) == 0) then
            if (math.random(1,4) == 4) then
                UpdateNMSpawnPoint(Hovering_Hotpot);
                GetMobByID(Hovering_Hotpot):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Hovering_Hotpot", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
