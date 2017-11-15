-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Boggart
-- Note: Place holder Nocuous Weapon
-----------------------------------
require("scripts/zones/Inner_Horutoto_Ruins/MobIDs");
require("scripts/globals/groundsofvalor");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,650,1);
end;

function onMobDespawn(mob)
    local mobID = mob:getID();
    if (NOCUOUS_WEAPON_PH[mobID] ~= nil) then
        local nm = GetMobByID(NOCUOUS_WEAPON);
        if (
            os.time() > GetServerVariable("[POP]Nocuous_Weapon") and
            GetServerVariable("[PH]Nocuous_Weapon") == 0 and
            not nm:isSpawned() and
            math.random(100) <= 10
        ) then
            UpdateNMSpawnPoint(NOCUOUS_WEAPON);
            DisallowRespawn(NOCUOUS_WEAPON, false);
            nm:setRespawnTime(GetMobRespawnTime(mobID));
            SetServerVariable("[PH]Nocuous_Weapon", mobID);
            DisallowRespawn(mobID, true);
        end
    end
end;
