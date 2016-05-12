-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Evil Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,100,2);

    local mobID = mob:getID();
    if (Blighting_Brand_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Blighting_Brand");
        if (ToD <= os.time(t) and GetMobAction(Blighting_Brand) == 0) then
            if (math.random(1,5) == 5) then
                UpdateNMSpawnPoint(Blighting_Brand);
                GetMobByID(Blighting_Brand):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Blighting_Brand", mobID);
                DeterMob(mobID, true);
            end
        end
     end
end;
