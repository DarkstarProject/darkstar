-----------------------------------
-- Area:
-- NPC:  Pandemonium_Warden
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 25);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Make sure model is reset back to start
    mob:setModelId(1839);

end;
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(petIDs[i]):setModelId(1840);
    SpawnMob(petIDs[i]):updateEnmity(target);
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    local mobHPP = mob:getHPP();
    local change = mob:getLocalVar("change");
    local petIDs = {17056170,17056171,17056172,17056173,17056174,17056175,17056176,17056177};
    local petStatus = {GetMobAction(petIDs[1]),GetMobAction(petIDs[2]),GetMobAction(petIDs[3]),GetMobAction(petIDs[4]),GetMobAction(petIDs[5]),GetMobAction(petIDs[6]),GetMobAction(petIDs[7]),GetMobAction(petIDs[8])};
    local TP = mob:getLocalVar("TP");

    if(mobHPP <= 15 and change == 13) then -- Final Form, pets take Dvger form as well
        mob:setModelId(1839);
        mob:setLocalVar("change", 14);
        for i = 1,8 do
            GetMobByID(petIDs[i]):setModelId(1840);
            if petStatus[i] == 0 then -- Dead pet, get it up.
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 26 and change == 12) then -- Khim and Co.
        mob:setModelId(1805);
        mob:setLocalVar("change", 13);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(1746);
            if petStatus[i] == 0 then -- Dead pet, get it up.
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 28 and change == 11) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 12);
            if (TP <= 5) then
            mob:useMobAbility(1858);
            mob:setLocalVar("TP", 6)
            end
    elseif(mobHPP <= 38 and change == 10) then -- Hydra and Co.
        mob:setModelId(1796);
        mob:setLocalVar("change", 11);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(421);
            if petStatus[i] == 0 then
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 40 and change == 9) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 10);
            if (TP <= 4) then
            mob:useMobAbility(1860);
            mob:setLocalVar("TP", 5)
            end
    elseif(mobHPP <= 50 and change == 8) then -- Cerb and Co.
        mob:setModelId(1793);
        mob:setLocalVar("change", 9);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(281);
            if petStatus[i] == 0 then
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 52 and change == 7) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 8);
            if (TP <= 3) then
            mob:useMobAbility(1861);
            mob:setLocalVar("TP", 4)
            end
    elseif(mobHPP <= 62 and change == 6) then -- Troll and Co.
        mob:setModelId(1867);
        mob:setLocalVar("change", 7);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(1680);
            if petStatus[i] == 0 then
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 64 and change == 5) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 6);
            if (TP <= 2) then
            mob:useMobAbility(1862);
            mob:setLocalVar("TP", 3)
            end
    elseif(mobHPP <= 74 and change == 4) then -- Lamia and Co.
        mob:setModelId(1865);
        mob:setLocalVar("change", 5);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(1643);
            if petStatus[i] == 0 then
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 76 and change == 3) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 4);
            if (TP <= 1) then
            mob:useMobAbility(1863);
            mob:setLocalVar("TP", 2)
            end
    elseif(mobHPP <= 86 and change == 2) then -- Mamool and Co.
        mob:setModelId(1863);
        mob:setLocalVar("change", 3);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(1639);
            if petStatus[i] == 0 then
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    elseif(mobHPP <= 88 and change == 1) then -- Normal Form
        mob:setModelId(1839);
        mob:setLocalVar("change", 2);
            if (TP <= 0) then
            mob:useMobAbility(1857);
            mob:setLocalVar("TP", 1)
            end
    elseif(mobHPP <= 98 and change == 0) then -- Chariots
        mob:setModelId(1825);
        mob:setLocalVar("change", 1);
        for i = 1, 8 do
            GetMobByID(petIDs[i]):setModelId(1820);
            if petStatus[i] == 0 then
               SpawnMob(petIDs[i]):updateEnmity(target);
            end
        end
    end

    ------------------------ Keep pets active ------------------------
    -- Pets probably shouldn't despawn for this, but proof otherwise should remove this code.

    for i = 1, 8 do
        if (petStatus[i] == 16 or petStatus[i] == 18) then -- idle or disengaging pet
            GetMobByID(petIDs[i]):updateEnmity(target);
        end
    end

    ------------------------ Despawn timer ------------------------
    if (os.time(t) > PWardenDespawnTime) then
        for i=17056170, 17056186 do
            DespawnMob(i);
        end
            printf("Timer expired at %i.  Despawning Pandemonium Warden.",PWardenDespawnTime);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    killer:addTitle(PANDEMONIUM_QUELLER);
end;