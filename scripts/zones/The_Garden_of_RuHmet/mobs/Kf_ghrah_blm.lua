-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  MOB: Kf'ghrah BLM
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic"); -- no spells are currently set due to lack of info

-----------------------------------
-- OnMobSpawn
-- Set core Skin and mob elemental bonus
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(0);
    mob:setLocalVar("roamTime", os.time());
    mob:setModelId(1168); -- Dark
end;

-----------------------------------
-- onMobRoam
-- AutochangeForm
-----------------------------------

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("roamTime");
    local roamForm;
    if (os.time() - roamTime > 60) then
        roamForm = math.random(1,3) -- forms 2 and 3 are spider and bird; can change forms at will
        if (roamForm == 1) then
            roamForm = 0; -- We don't want form 1 as that's humanoid - make it 0 for ball
        end;
        mob:AnimationSub(roamForm);
        mob:setLocalVar("roamTime", os.time());
    end;
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- OnMobFight
-- Free form change between ball, spider, and bird.
-----------------------------------

function onMobFight(mob,target)
    local changeTime = mob:getLocalVar("changeTime");
    local battleForm;

    if (mob:getBattleTime() - changeTime > 60) then
        battleForm = math.random(1,3) -- same deal as above
        if (battleForm == 1) then
            battleForm = 0;
        end;
        mob:AnimationSub(battleForm);
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
