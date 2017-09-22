-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Dhalmel
-- Note: Place holder for Celphie
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Western_Altepa_Desert/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,135,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Celphie_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Celphie");
        if (ToD <= os.time() and GetMobAction(Celphie) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Celphie);
                GetMobByID(Celphie):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Celphie", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;
