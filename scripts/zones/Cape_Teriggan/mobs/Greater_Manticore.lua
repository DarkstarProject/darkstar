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

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,108,2);
    local mob = mob:getID();
    if (Frostmane_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Frostmane");
        if (ToD <= os.time(t) and GetMobAction(Frostmane) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Frostmane);
                GetMobByID(Frostmane):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Frostmane", mob);
                DeterMob(mob, true);
            end
        end
    end
end;
