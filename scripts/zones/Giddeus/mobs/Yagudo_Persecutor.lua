-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Persecutor
-----------------------------------

require("scripts/zones/Giddeus/MobIDs");

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
    if (Juu_Duzu_the_Whirlwind_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Juu_Duzu_the_Whirlwind");
        if (ToD <= os.time() and GetMobAction(Juu_Duzu_the_Whirlwind) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Juu_Duzu_the_Whirlwind);
                GetMobByID(Juu_Duzu_the_Whirlwind):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Juu_Duzu_the_Whirlwind", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;

