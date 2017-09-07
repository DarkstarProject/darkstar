-----------------------------------
-- Area: Palborough Mines
--  Mob: Veteran Quadav
-----------------------------------
require("scripts/zones/Palborough_Mines/MobIDs");

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
    if (mobID == Zi_Ghi_Boneeater_PH) then
        local ToD = GetServerVariable("[ToD]Zi_Ghi_Boneeater");
        if (ToD <= os.time() and GetMobAction(Zi_Ghi_Boneeater):isDead()) then
            if (math.random(1,10) == 5) then
                GetMobByID(Zi_Ghi_Boneeater):setRespawnTime(GetMobRespawnTime(mobID));
                DeterMob(mobID, true);
            end
        end
    end
end;
