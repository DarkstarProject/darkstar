-----------------------------------
-- Area: East Sarutabaruta
-- MOB: River Crab
-- Note: PH for Duke Decapod
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,92,1);

    local mobid = mob:getID();
    if (Duke_Decapod_PH[mobid] ~= nil) then
        local ToD = GetServerVariable("[POP]Duke_Decapod");
        if (ToD <= os.time(t) and GetMobAction(Duke_Decapod) == 0) then
            UpdateNMSpawnPoint(Duke_Decapod);
            GetMobByID(Duke_Decapod):setRespawnTime(GetMobRespawnTime(mobid));
            SetServerVariable("[PH]Duke_Decapod", mobid);
            DeterMob(mobid, true);
        end
    end
end;
