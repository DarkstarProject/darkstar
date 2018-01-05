-----------------------------------
-- Area: Promyvion-Vahzl
--  MOB: Memory Receptacle
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 100); -- 10% Regain for now
    mob:SetAutoAttackEnabled(false); -- Recepticles only use TP moves.
end;

function checkStray(mob)
    local mobId = mob:getID();
    local numStrays = VAHZL_MEMORY_RECEPTACLES[mobId][2];
    
    if (os.time() > mob:getLocalVar("nextStray")) then
        for i = mobId + 1, mobId + numStrays do
            local stray = GetMobByID(i);
            if (not stray:isSpawned()) then
                mob:setLocalVar("nextStray", os.time() + 20);
                SpawnMob(stray:getID());
                break;
            end
        end
    else
        mob:AnimationSub(2);
    end
end;

function onMobFight(mob, target)
    local mobId = mob:getID();
    local numStrays = VAHZL_MEMORY_RECEPTACLES[mobId][2];

    -- keep pets linked
    for i = mobId + 1, mobId + numStrays do
        local stray = GetMobByID(i);
        if (stray:isSpawned()) then
            stray:updateEnmity(target);
        end
    end
    
    checkStray(mob);
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        mob:AnimationSub(0);
        
        -- chance to open portal
        local mobId = mob:getID();
        local floor = VAHZL_MEMORY_RECEPTACLES[mobId][1];
        local numAlive = 1;
        for k, v in pairs(VAHZL_MEMORY_RECEPTACLES) do
            if (k ~= mobId and v[1] == floor and GetMobByID(k):isAlive()) then
                numAlive = numAlive + 1;
            end
        end
        if (math.random(numAlive) == 1) then
            local stream = GetNPCByID(VAHZL_MEMORY_RECEPTACLES[mobId][3]);
            stream:openDoor(180);
        end
    end
end;
