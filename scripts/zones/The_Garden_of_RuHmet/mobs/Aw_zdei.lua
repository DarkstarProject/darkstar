-----------------------------------
-- Area: The Garden of Ru'Hmet
-- MOB:  Aw'Zdei
-- Animation Sub 0 Pot Form
-- Animation Sub 1 Pot Form (reverse eye position)
-- Animation Sub 2 Bar Form
-- Animation Sub 3 Ring Form
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnMobSpawn Action
-- Set AnimationSub to 0, put it in pot form
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(0);
    onPath(mob);
end;

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