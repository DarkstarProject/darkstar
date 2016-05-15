----------------------------------
-- Area: Gustav Tunnel
--  MOB: Erlik
-- Note: Place holder Baobhan Sith
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,767,2);

    local mobID = mob:getID();
    if (Baobhan_Sith_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Baobhan_Sith");
        if (ToD <= os.time(t) and GetMobAction(Baobhan_Sith) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Baobhan_Sith);
                GetMobByID(Baobhan_Sith):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Baobhan_Sith", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
