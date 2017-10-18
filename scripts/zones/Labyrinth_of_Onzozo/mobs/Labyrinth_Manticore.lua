-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Labyrinth Manticore
-- Note: Place holder Narasimha
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,775,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Narasimha_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Narasimha");
        if (ToD <= os.time() and GetMobAction(Narasimha) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Narasimha);
                GetMobByID(Narasimha):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Narasimha", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;