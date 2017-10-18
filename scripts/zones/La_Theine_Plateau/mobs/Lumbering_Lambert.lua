-----------------------------------
-- Area: La Theine Plateau
--  MOB: Lumbering Lambert
-----------------------------------

require("scripts/zones/La_Theine_Plateau/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();
    local chanceForBaldurf = 0;

    if (GetServerVariable("[POP]Bloodtear_Baldurf") <= os.time()) then
        chanceForBaldurf = math.random(1,100);
    end

    if (chanceForBaldurf > 95 and GetMobAction(Battering_Ram) == ACTION_NONE and GetMobAction(Bloodtear_Baldurf) == ACTION_NONE) then
        UpdateNMSpawnPoint(Bloodtear_Baldurf);
        GetMobByID(Bloodtear_Baldurf):setRespawnTime(GetMobRespawnTime(Battering_Ram));
        DisallowRespawn(mobID, true);
    else
        GetMobByID(Battering_Ram):setRespawnTime(GetMobRespawnTime(Battering_Ram));
        DisallowRespawn(mobID, true);
    end

    SetServerVariable("[POP]Lumbering_Lambert", os.time() + math.random(3600, 28800)); -- 1-8hours repop
end;
