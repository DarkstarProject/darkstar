-----------------------------------
-- Area: Cape Teriggan
--  MOB: Greater Manticore
-- Note: Place Holder for Frostmane
-----------------------------------

require("scripts/zones/Cape_Teriggan/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,108,2);
    local mobID = mob:getID();
    if (Frostmane_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Frostmane");
        if (ToD <= os.time(t) and GetMobAction(Frostmane) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Frostmane);
                GetMobByID(Frostmane):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Frostmane", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
