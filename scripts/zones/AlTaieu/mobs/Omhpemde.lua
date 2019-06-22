-----------------------------------
-- Area: Al'Taieu
--  MOB: Om'Hpemde
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMod(dsp.mod.REGEN, 10);
    mob:wait(2000);
end;

function onMobEngaged(mob, target)
    mob:hideName(false);
    mob:untargetable(false);
    if (mob:AnimationSub() == 5) then
        mob:AnimationSub(6);
        mob:wait(2000);
    end
end;

function onMobDisengage(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMod(dsp.mod.REGEN, 10);
end;

function onMobRoam(mob)
    if (mob:getHPP() == 100) then
        mob:setLocalVar("damaged", 0);
        mob:SetAutoAttackEnabled(false);
        mob:SetMobAbilityEnabled(false);
    end
end;

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
            mob:addMod(dsp.mod.ATTP, 100);
            mob:addMod(dsp.mod.DEFP, -50);
            mob:addMod(dsp.mod.DMGMAGIC, -50);
            mob:setLocalVar("changeTime", mob:getBattleTime());

        elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > 30) then
            mob:AnimationSub(6); -- Mouth Closed
            mob:wait(2000);
            mob:addMod(dsp.mod.ATTP, -100);
            mob:addMod(dsp.mod.DEFP, 50);
            mob:addMod(dsp.mod.DMGMAGIC, 50);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;