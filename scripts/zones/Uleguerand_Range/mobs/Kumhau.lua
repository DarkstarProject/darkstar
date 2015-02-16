-----------------------------------
-- Area: Uleguaerand Range
-- NPC:  Kumhau
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMod(MOD_REGEN, 30);
    mob:addMod(MOD_MDEF,80);
    mob:addMod(MOD_ACC,150);
    mob:addMod(MOD_DOUBLE_ATTACK,10)
    mob:addMod(MOD_DEF,-80);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_REGAIN,15);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
    mob:setLocalVar("BattleStart", os.time());
end;

-----------------------------------
-- onMobDisEngage Action
-----------------------------------

function onMobDisEngage(mob, target)
    mob:delStatusEffect(EFFECT_RAGE);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------


function onMobFight(mob, target)
    local BattleStart = mob:getLocalVar("BattleStart");
    local Kumhau_2hr_Used = 0;
    if (mob:getLocalVar("Kumhau_2hr") ~= nil) then
        Kumhau_2hr_Used = mob:getLocalVar("Kumhau_2hr");
    end

    if (mob:getHPP() <= 10) then 
        if (Kamhau_2hr_Used == 2) then
            mob:useMobAbility(438); -- Invincible
            mob:setLocalVar("Kumhau_2hr", 3);
        end
    elseif (mob:getHPP() <= 30) then 
        if (Kamhau_2hr_Used == 1) then
            mob:useMobAbility(438); -- Invincible
            mob:setLocalVar("Kumhau_2hr", 2);
        end
    elseif (mob:getHPP() <= 70) then 
        if (Kamhau_2hr_Used == 0) then
            mob:useMobAbility(438); -- Invincible
            mob:setLocalVar("Kamhau_2hr", 1);
        end
    elseif (Kamhau_2hr_Used == 3) then
        mob:addStatusEffect(EFFECT_HASTE,200,0,200);
    elseif (os.time() -BattleStart > 3600 and mob:getLocalVar("RAGED") == 0) then
        mob:addStatusEffectEx(EFFECT_RAGE,0,1,0,0);
        mob:setLocalVar("RAGED", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;