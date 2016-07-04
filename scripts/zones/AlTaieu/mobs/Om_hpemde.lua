-----------------------------------
-- Area: Al'Taieu
--  MOB: Om'Hpemde
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMod(MOD_REGEN, 10);
    mob:wait(2000);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, target)
    mob:hideName(false);
    mob:untargetable(false);
    if (mob:AnimationSub() == 5) then
        mob:AnimationSub(6);
        mob:wait(2000);
    end
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMod(MOD_REGEN, 10);
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    if (mob:getHPP() == 100) then
        mob:setLocalVar("damaged", 0);
        mob:SetAutoAttackEnabled(false);
        mob:SetMobAbilityEnabled(false);
    end
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)

    if (mob:getHP() < mob:getMaxHP()) then -- it will attack once it has been damaged.
        if (mob:getLocalVar("damaged") == 0) then
            mob:SetAutoAttackEnabled(true);
            mob:SetMobAbilityEnabled(true);
            mob:setLocalVar("damaged", 1);
        end

        local changeTime = mob:getLocalVar("changeTime");

        if (mob:AnimationSub() == 6 and mob:getBattleTime() - changeTime > 30) then
            mob:AnimationSub(3); -- Mouth Open
            mob:wait(2000);
            mob:addMod(MOD_ATTP, 100);
            mob:addMod(MOD_DEFP, -50);
            mob:addMod(MOD_DMGMAGIC, -50);
            mob:setLocalVar("changeTime", mob:getBattleTime());

        elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > 30) then
            mob:AnimationSub(6); -- Mouth Closed
            mob:wait(2000);
            mob:addMod(MOD_ATTP, -100);
            mob:addMod(MOD_DEFP, 50);
            mob:addMod(MOD_DMGMAGIC, 50);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;