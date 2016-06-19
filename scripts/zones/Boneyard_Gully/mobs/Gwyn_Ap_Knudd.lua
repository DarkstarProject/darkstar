-----------------------------------
-- Area: Boneyard Gully
--  MOB: Gwyn Ap Knudd
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");

local offsets = {2, 5, 8, 3, 6, 9, 4, 7, 0};

-----------------------------------
-- OnMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, target)
    mob:resetLocalVars();
end

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

    local spawnTime = mob:getLocalVar("spawnTime");
    
    if (spawnTime == 0) then
        spawnTime = math.random(3, 5);
        mob:setLocalVar("spawnTime", spawnTime);
    end
    
    if (mob:getBattleTime()/15 > spawnTime) then
        for i, offset in ipairs(offsets) do
            if (GetMobAction(mob:getID()+offset) == ACTION_SPAWN or GetMobAction(mob:getID()+offset) == ACTION_NONE) then
                local pet = SpawnMob(mob:getID()+offset, 15);
                local pos = mob:getPos();
                pet:setPos(pos.x, pos.y, pos.z);
                pet:updateEnmity(target)
                break;
            end
        end
        mob:setLocalVar("spawnTime", (mob:getBattleTime()/15)+4);
    end
end

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob, weather)
    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
    end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller) 
end;
