-----------------------------------
-- Area: Batallia Downs
--  MOB: Stalking Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Batallia_Downs/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,72,1);
    checkRegime(player,mob,73,1);

    local mobID = mob:getID();
    if (Tottering_Toby_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Tottering_Toby");
        if (ToD <= os.time(t) and GetMobAction(Tottering_Toby) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Tottering_Toby);
                GetMobByID(Tottering_Toby):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Tottering_Toby", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
