-----------------------------------
-- Area: La Theine Plateau
--  MOB: Battering Ram
-----------------------------------

require("scripts/zones/La_Theine_Plateau/MobIDs");

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
    local chanceForLambert = 0;
    local chanceForBaldurf = 0;
    local nmToPop = 0;

    if (mobID == Battering_Ram) then
        if (GetServerVariable("[POP]Lumbering_Lambert") <= os.time()) then
            chanceForLambert = math.random(1,100);
        end

        if (GetServerVariable("[POP]Bloodtear_Baldurf") <= os.time()) then
            chanceForBaldurf = math.random(1,100);
        end

        if (chanceForLambert > 0 or chanceForBaldurf > 0) then
            if (chanceForLambert > chanceForBaldurf) then
                nmToPop = Lumbering_Lambert;
            else
                nmToPop = Bloodtear_Baldurf;
            end
        end

        if (nmToPop > 0 and GetMobAction(Lumbering_Lambert) == ACTION_NONE and GetMobAction(Bloodtear_Baldurf) == ACTION_NONE) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(nmToPop);
                GetMobByID(nmToPop):setRespawnTime(GetMobRespawnTime(mobID));
                DeterMob(mobID, true);
            end
        end
    end
end;

