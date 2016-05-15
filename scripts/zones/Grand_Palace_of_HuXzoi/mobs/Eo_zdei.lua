-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  MOB: Eo'Zdei
-- Animation Sub 0 Pot Form
-- Animation Sub 1 Pot Form (reverse eye position)
-- Animation Sub 2 Bar Form
-- Animation Sub 3 Ring Form
-----------------------------------

require("scripts/zones/Grand_Palace_of_HuXzoi/MobIDs");
require("scripts/globals/status");

-----------------------------------
-- OnMobSpawn Action
-- Set AnimationSub to 0, put it in pot form
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(0);
    onPath(mob);
end;

-----------------------------------
-- onPath Action
-----------------------------------

function onPath(mob)
    local spawnPos = mob:getSpawnPos();
    mob:pathThrough({spawnPos.x, spawnPos.y, spawnPos.z});
    local pos = mob:getPos();
    if (spawnPos.x == pos.x and spawnPos.z == pos.z) then
        mob:setPos(spawnPos.x, spawnPos.y, spawnPos.z, mob:getRotPos() + 16);
    end
end;

-----------------------------------
-- onMobFight Action
-- Randomly change forms
-----------------------------------

function onMobFight(mob)

    local randomTime = math.random(15,45);
    local changeTime = mob:getLocalVar("changeTime");

    if (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > randomTime) then
        mob:AnimationSub(math.random(2,3));
        mob:setLocalVar("changeTime", mob:getBattleTime());
    elseif (mob:AnimationSub() == 1 and mob:getBattleTime() - changeTime > randomTime) then
        mob:AnimationSub(math.random(2,3));
        mob:setLocalVar("changeTime", mob:getBattleTime());
    elseif (mob:AnimationSub() == 2 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChance = math.random(0,1);
        if (aniChance == 0) then
            mob:AnimationSub(0);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        else
            mob:AnimationSub(3)
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > randomTime) then
        mob:AnimationSub(math.random(0,2));
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end

end;


-----------------------------------
-- onMobDeath Action
-- Jailer of Temperance pop
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    local PH = GetServerVariable("[SEA]Jailer_of_Temperance_PH");

    if (PH == mobID) then
        -- printf("%u is a PH",mobID);
        -- printf("JoT will pop");
        -- We need to set Jailer of Temperance spawn point to where the PH spawns (The platform in the room).
        local mobSpawnPoint = GetMobByID(mobID):getSpawnPos();
        GetMobByID(Jailer_of_Temperance):setSpawn(mobSpawnPoint.x, mobSpawnPoint.y, mobSpawnPoint.z);

        -- The jailer spawns instantly, so don't need to set respawn time
        SpawnMob(Jailer_of_Temperance,300):updateEnmity(killer);
        DeterMob(mobID, true);
    end
end;