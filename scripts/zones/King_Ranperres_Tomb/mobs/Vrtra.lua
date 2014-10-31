-----------------------------------
-- Area: King Ranperre's Tomb
-- NPC:  Vrtra
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");

local offsets = {1, 3, 5, 2, 4, 6};

-----------------------------------
-- OnMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGEN, 30);
end;

function onMobEngaged(mob)
    mob:setExtraVar(0, 0);
end

function onMobFight(mob, target)

    local spawnTime, twohourTime = mob:getExtraVar(2);

    if (twohourTime == 0) then
        twohourTime = math.random(4, 6);
        mob:setExtraVar(changeTime, twohourTime);
    end
    
    if (spawnTime == 0) then
        spawnTime = math.random(3, 5);
        mob:setExtraVar(changeTime, twohourTime);
    end
    
    if (mob:getBattleTime()/15 > twohourTime) then
        --mob:useMobAbility(454);
        mob:setExtraVar(spawnTime, (mob:getBattleTime()/15)+math.random(4,6));
    elseif (mob:getBattleTime()/15 > spawnTime or true) then
        for i, offset in ipairs(offsets) do
            if (GetMobAction(mob:getID()+offset) == ACTION_SPAWN or GetMobAction(mob:getID()+offset) == ACTION_NONE) then
                local pet = SpawnMob(mob:getID()+offset, 60);
                local pos = mob:getPos();
                pet:setPos(pos.x, pos.y, pos.z);
                pet:updateEnmity(target)
                break;
            end
        end
        mob:setExtraVar((mob:getBattleTime()/15)+4, twohourTime);
    end
end

function onMobDisengage(mob, weather)
    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
    end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(VRTRA_VANQUISHER);
    
    -- Set Vrtra's spawnpoint and respawn time (3-5 days)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((259200),(432000)));
    
end;