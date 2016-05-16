-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Mercenary
-- Note: Place Holder for Bloodthirster Madkix
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,740,2);

    local mobID = mob:getID();
    if (Bloodthirster_Madkix_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Bloodthirster_Madkix");
        if (ToD <= os.time(t) and GetMobAction(Bloodthirster_Madkix) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Bloodthirster_Madkix);
                GetMobByID(Bloodthirster_Madkix):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Bloodthirster_Madkix", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
