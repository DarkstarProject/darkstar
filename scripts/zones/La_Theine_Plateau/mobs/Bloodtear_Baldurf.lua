-----------------------------------
-- Area: La Theine Plateau
--  MOB: Bloodtear_Baldurf
-----------------------------------
require("scripts/globals/titles");
require("scripts/zones/La_Theine_Plateau/MobIDs");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ALWAYS_AGGRO, 1);
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMobMod(MOBMOD_2HOUR_MULTI, 1);
    mob:setMobMod(MOBMOD_DRAW_IN, 1);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(THE_HORNSPLITTER);
end;

function onMobDespawn(mob)
    local mobID = mob:getID();
    local chanceForLambert = 0;

    if (GetServerVariable("[POP]Lumbering_Lambert") <= os.time()) then
        chanceForLambert = math.random(1,100);
    end

    if (chanceForLambert > 95 and GetMobAction(Battering_Ram) == ACTION_NONE and GetMobAction(Lumbering_Lambert) == ACTION_NONE) then
        UpdateNMSpawnPoint(Lumbering_Lambert);
        GetMobByID(Lumbering_Lambert):setRespawnTime(GetMobRespawnTime(Battering_Ram));
        DisallowRespawn(mobID, true);
    else
        GetMobByID(Battering_Ram):setRespawnTime(GetMobRespawnTime(Battering_Ram));
        DisallowRespawn(mobID, true);
    end

    SetServerVariable("[POP]Bloodtear_Baldurf", os.time() + math.random(75600, 86400)); -- 21-24hours repop
end;
