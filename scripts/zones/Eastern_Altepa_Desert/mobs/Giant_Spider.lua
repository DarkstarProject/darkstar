-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Giant Spider
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Eastern_Altepa_Desert/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,109,1);

    local mobID = mob:getID();
    if (Dune_Widow_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Dune_Widow");
        if (ToD <= os.time(t) and GetMobAction(Dune_Widow) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Dune_Widow);
                GetMobByID(Dune_Widow):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Dune_Widow", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
