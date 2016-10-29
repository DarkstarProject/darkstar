-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Aw'ghrah
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- OnMobSpawn Action
-- Set core Skin and mob elemental resist/weakness; other elements set to 0.
-- Set to non aggro. 
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(0);
    mob:setAggressive(0);
    mob:setLocalVar("roamTime", os.time());
    mob:setLocalVar("form2",math.random(1,3));
    local skin = math.random(1161,1168);
    mob:setModelId(skin);
    if (skin == 1161) then -- Fire
        mob:setMod(MOD_ICERES, 27);
        mob:setMod(MOD_WATERRES, -27);
    elseif (skin == 1164) then --Earth
        mob:setMod(MOD_THUNDERRES, 27);
        mob:setMod(MOD_WINDRES, -27);
    elseif (skin == 1162) then -- Water
        mob:setMod(MOD_THUNDERRES, -27);
        mob:setMod(MOD_FIRERES, 27);
    elseif (skin == 1163) then -- Wind
        mob:setMod(MOD_ICERES, -27);
        mob:setMod(MOD_EARTHRES, 27);
    elseif (skin == 1166) then --Ice
        mob:setMod(MOD_WINDRES, 27);
        mob:setMod(MOD_FIRERES, -27);
    elseif (skin == 1165) then --Lightning
        mob:setMod(MOD_WATERRES, 27);
        mob:setMod(MOD_EARTHRES, -27);
    elseif (skin == 1167) then --Light
        mob:setMod(MOD_LIGHTRES, 27);
        mob:setMod(MOD_DARKRES, -27);
    elseif (skin == 1168) then --Dark
        mob:setMod(MOD_DARKRES, 27);
        mob:setMod(MOD_LIGHTRES, -27);
    end;
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobRoam Action
-- Autochange Aggro and Form
-----------------------------------

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("roamTime");
    if (mob:AnimationSub() == 0 and os.time() - roamTime > 60) then
        mob:AnimationSub(mob:getLocalVar("form2"));
        mob:setLocalVar("roamTime", os.time());
        mob:setAggressive(1);
    elseif (mob:AnimationSub() == mob:getLocalVar("form2") and os.time() - roamTime > 60) then
        mob:AnimationSub(0);
        mob:setAggressive(0);
        mob:setLocalVar("roamTime", os.time());
    end
end;

-----------------------------------
-- OnMobFight Action
-- Set ball form and secondary form
-----------------------------------

function onMobFight(mob,target)

    local changeTime = mob:getLocalVar("changeTime");

    if (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
        mob:AnimationSub(mob:getLocalVar("form2"));
        mob:setAggressive(1);
        mob:setLocalVar("changeTime", mob:getBattleTime());
    elseif (mob:AnimationSub() == mob:getLocalVar("form2") and mob:getBattleTime() - changeTime > 60) then
        mob:AnimationSub(0);
        mob:setAggressive(0);
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
end;
