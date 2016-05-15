-----------------------------------
-- Area: Wajaom Woodlands
--  MOB: Lesser Colibri
-- Note: Place holder Zoraal Ja's Pkuucha
-----------------------------------

require("scripts/zones/Wajaom_Woodlands/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();

    if (Zoraal_Ja_s_Pkuucha_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Zoraal_Ja_s_Pkuucha");

        if (ToD <= os.time(t) and GetMobAction(Zoraal_Ja_s_Pkuucha) == ACTION_NONE) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Zoraal_Ja_s_Pkuucha);
                GetMobByID(Zoraal_Ja_s_Pkuucha):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Zoraal_Ja_s_Pkuucha", mobID);
                DeterMob(mobID, true);
            end
        end

    end
end;
