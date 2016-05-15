-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Shoal Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Buburimu_Peninsula/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,1);

    local mobID = mob:getID();
    if (Buburimboo_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Buburimboo");
        if (ToD <= os.time(t) and GetMobAction(Buburimboo) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Buburimboo);
                GetMobByID(Buburimboo):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Buburimboo", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
