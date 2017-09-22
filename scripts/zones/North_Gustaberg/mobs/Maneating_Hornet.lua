-----------------------------------
-- Area: North Gustaberg
--  MOB: Maneating Hornet
-- Note: Place Holder For Stinging Sophie
-----------------------------------

require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,17,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Stinging_Sophie_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Stinging_Sophie");
        if (ToD <= os.time() and GetMobAction(Stinging_Sophie) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Stinging_Sophie);
                GetMobByID(Stinging_Sophie):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Stinging_Sophie", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
