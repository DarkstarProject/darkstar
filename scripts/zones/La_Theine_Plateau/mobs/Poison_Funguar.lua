-----------------------------------
-- Area: La Theine Plateau
--  MOB: Poison Funguar
-----------------------------------

require("scripts/zones/La_Theine_Plateau/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Tumbling_Truffle_PH[mobID] ~= nil) then
    -- printf("%u is a PH",mob);
        local TT_ToD = GetServerVariable("[POP]Tumbling_Truffle");

        if (TT_ToD <= os.time(t) and GetMobAction(Tumbling_Truffle) == 0) then

            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Tumbling_Truffle);
                GetMobByID(Tumbling_Truffle):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Tumbling_Truffle", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;

