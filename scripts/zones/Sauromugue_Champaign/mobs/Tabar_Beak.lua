-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Tabar Beak
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Sauromugue_Champaign/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,100,1);

    local mobID = mob:getID();
    if (Deadly_Dodo_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Deadly_Dodo");
        if (ToD <= os.time(t) and GetMobAction(Deadly_Dodo) == 0) then
            if (math.random(1,3) == 2) then
                UpdateNMSpawnPoint(Deadly_Dodo);
                GetMobByID(Deadly_Dodo):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Deadly_Dodo", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
