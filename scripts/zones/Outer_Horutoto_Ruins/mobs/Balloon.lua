-----------------------------------
-- Area: Outer Horutoto Ruins (194)
-- MOB:  Balloon
-- Note: Place holder Bomb King, Doppelganger Dio, Doppelganger Gog
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Outer_Horutoto_Ruins/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobid = mob:getID();
    if (MultiNM_Zone_194_PH[mobid] ~= nil) then
        local ToD = GetServerVariable("[POP]MultiNM_Zone_194");
        local SpawnNM = GetServerVariable("[NM]MultiNM_Zone_194");
        local PH = GetServerVariable("[PH]MultiNM_Zone_194");

        -- default case: window open, no other NM up and not decided which NM should be spawned
        if (ToD <= os.time(t) and SpawnNM == 0 and GetMobAction(Bomb_King) == 0 and GetMobAction(Doppelganger_Gog) == 0 and GetMobAction(Doppelganger_Dio) == 0) then
            if (math.random(1,20) > 16) then  -- set higher pop chance because of testimonials
                local whichNM = math.random(0,98);
                if (whichNM <= 32) then
                    UpdateNMSpawnPoint(Bomb_King);
                    GetMobByID(Bomb_King):setRespawnTime(GetMobRespawnTime(mobid));
                    SetServerVariable("[PH]MultiNM_Zone_194", mobid);
                    SetServerVariable("[NM]MultiNM_Zone_194", Bomb_King);
                    DeterMob(mobid, true);
                elseif (whichNM >= 33 and whichNM <= 65) then
                    UpdateNMSpawnPoint(Doppelganger_Gog);
                    GetMobByID(Doppelganger_Gog):setRespawnTime(GetMobRespawnTime(mobid));
                    SetServerVariable("[PH]MultiNM_Zone_194", mobid);
                    SetServerVariable("[NM]MultiNM_Zone_194", Doppelganger_Gog);
                    DeterMob(mobid, true);
                else 
                    UpdateNMSpawnPoint(Doppelganger_Dio);
                    GetMobByID(Doppelganger_Dio):setRespawnTime(GetMobRespawnTime(mobid));
                    SetServerVariable("[PH]MultiNM_Zone_194", mobid);
                    SetServerVariable("[NM]MultiNM_Zone_194", Doppelganger_Dio);
                    DeterMob(mobid, true);
                end
            end

        -- special case: window open, NM and PH decided but NM not yet spawned (eg. on server restart before spawn)
        elseif (ToD <= os.time(t) and SpawnNM > 0 and PH > 0 and GetMobAction(Bomb_King) == 0 and GetMobAction(Doppelganger_Gog) == 0 and GetMobAction(Doppelganger_Dio) == 0) then
            if (math.random(1,20) > 16) then  -- set higher pop chance because of testimonials
                UpdateNMSpawnPoint(SpawnNM);
                GetMobByID(SpawnNM):setRespawnTime(GetMobRespawnTime(mobid));
                DeterMob(mobid, true);
            end
        end
    end
end;
