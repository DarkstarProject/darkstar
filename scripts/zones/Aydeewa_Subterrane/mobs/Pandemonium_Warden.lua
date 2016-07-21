-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Pandemonium_Warden
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");


-----------------------------------
-- Constant Initializations
-----------------------------------
-- General Variables @pos 194 33 -104
local PW = 17056167;

-- Pet Arrays, we'll alternate between phases
local petIDs = {};
petIDs[0] = {17056169, 17056170, 17056171, 17056172, 17056173, 17056174, 17056175, 17056176};
petIDs[1] = {17056177, 17056178, 17056179, 17056180, 17056181, 17056182, 17056183, 17056184};

-- Phase Arrays      Dverg,  Char1, Dverg,  Char2, Dverg,  Char3, Dverg,  Char4,  Dverg,   Mamo,  Dverg,  Lamia,  Dverg,  Troll,  Dverg,   Cerb,  Dverg,  Hydra,  Dverg,   Khim,  Dverg
--                       1       2      3       4      5       6      7       8       9      10      11      12      13      14      15      16      17      18      19      20
local triggerHPP = {    95,      1,    95,      1,    95,      1,    95,      1,     95,      1,     95,      1,     95,      1,     95,      1,     95,      1,     95,      1};
local mobHP =      { 10000, 147000, 10000, 147000, 10000, 147000, 10000, 147000,  15000, 147000,  15000, 147000,  15000, 147000,  20000, 147000,  20000, 147000,  20000, 147000};
local mobModelID = {  1825,   1840,  1825,   1840,  1825,   1840,  1825,   1840,   1863,   1840,   1865,   1840,   1867,   1840,   1793,   1840,   1796,   1840,   1805,   1840};
local petModelID = {  1820,   1841,  1820,   1841,  1820,   1841,  1820,   1841,   1639,   1841,   1643,   1841,   1680,   1841,    281,   1841,    421,   1841,   1746,   1839};

-- Avatar Arrays         Shiva, Ramuh, Titan, Ifrit, Levia, Garud, Fenri, Carby
local avatarAbilities = {  917,   918,   914,   913,   915,   916,   839,   919};
local avatarSkins =     {   22,    23,    19,    18,    20,    21,    17,    16};

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Make sure model is reset back to start
    mob:setModelId(1840);
    
    -- Prevent death and hide HP until final phase
    mob:setUnkillable(true);
    mob:hideHP(true);

    -- Two hours to forced depop
    mob:setLocalVar("PWardenDespawnTime", os.time(t) + 7200);
    mob:setLocalVar("phase", 1);
    mob:setLocalVar("astralFlow", 1);
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------

function onMobDisengage(mob)
    -- Make sure model is reset back to start
    mob:setModelId(1840);
    
    -- Prevent death and hide HP until final phase
    mob:setUnkillable(true);
    mob:hideHP(true);

    -- Reset phases (but not despawn timer)
    mob:setLocalVar("phase", 1);
    mob:setLocalVar("astralFlow", 1);
    
    -- Despawn pets
    for i = 0, 1 do
        for j = 1, 8 do
            if GetMobByID(petIDs[i][j]):isSpawned() then
                DespawnMob(petIDs[i][j]);
            end
        end
    end
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    -- pop pets
    for i = 1, 8 do
        local pet = GetMobByID(petIDs[1][i]);
        pet:setModelId(1841);
        pet:spawn();
    end
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    -- Init Vars
    local mobHPP = mob:getHPP();
    local depopTime = mob:getLocalVar("PWardenDespawnTime");
    local phase = mob:getLocalVar("phase");
    local astral = mob:getLocalVar("astralFlow");
    local pets = {};
    for i = 0, 1 do
        pets[i] = {};
        for j = 1, 8 do
            pets[i][j] = GetMobByID(petIDs[i][j]);
        end
    end
    
    -- Check for phase change
    if (phase < 21 and mobHPP <= triggerHPP[phase]) then           
        if (phase == 20) then -- Prepare for death
            mob:hideHP(false);
            mob:setUnkillable(false);
        end
        
        -- Change phase
        mob:setModelId(mobModelID[phase]);
        mob:setHP(mobHP[phase]);
        
        -- Handle pets
        for i = 1, 8 do
            local oldPet = pets[phase % 2][i];
            local newPet = pets[(phase - 1) % 2][i];
            handlePet(mob, newPet, oldPet, target, petModelID[phase]);
        end
        
        -- Increment phase
        mob:setLocalVar("phase", phase + 1);
        
    -- Or, check for Astral Flow    
    elseif (phase == 21 and astral < 9 and mobHPP <= (100 - 10 * astral)) then 
        for i = 1, 8 do
            local oldPet = pets[astral % 2][i];
            local newPet = pets[(astral - 1) % 2][i];
            if i == 1 then
                handlePet(mob, newPet, oldPet, target, avatarSkins[astral]);
                newPet:updateEnmity(target);
                newPet:useMobAbility(avatarAbilities[astral]);
            else
                handlePet(mob, newPet, oldPet, target, 1839);
            end
        end
        
        -- Increment astral
        mob:setLocalVar("astralFlow", astral + 1);
        
    -- Or, at least make sure pets weren't drug off...
    else 
        for i = 1, 8 do
            local pet = nil;
            if phase == 21 then
                pet = pets[astral % 2][i];
            else
                pet = pets[phase % 2][i];
            end
            if (not pet:isEngaged() and not pet:isAsleep() and pet:getHP() > 0) then
                pet:updateEnmity(target);
                pet:setPos(mob:getXPos() + math.random(-2, 2), mob:getYPos(), mob:getZPos() + math.random(-2, 2));
            end
        end
    end
    
    -- Check for time limit, too
    if (os.time(t) > depopTime) then
        for i = 1, 2 do
            for j = 1, 8 do
                if pets[i][j]:isSpawned() then
                    DespawnMob(petIDs[i][j]);
                end
            end
        end
        DespawnMob(PW);
        printf("Timer expired at %i. Despawning Pandemonium Warden.", depopTime);       
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- TODO: Death speech.
    player:addTitle(PANDEMONIUM_QUELLER);
    
    -- Despawn pets
    for i = 0, 1 do
        for j = 1, 8 do
            if GetMobByID(petIDs[i][j]):isSpawned() then
                DespawnMob(petIDs[i][j]);
            end
        end
    end
end;

-----------------------------------
-- handlePet
-----------------------------------

function handlePet(mob, newPet, oldPet, target, modelId)
    if oldPet:isSpawned() then
        DespawnMob(oldPet:getID());
    end
    newPet:setModelId(modelId);
    newPet:setPos(mob:getXPos() + math.random(-2, 2), mob:getYPos(), mob:getZPos() + math.random(-2, 2));
    newPet:spawn();
    
end;