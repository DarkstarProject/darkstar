---------------------------------------------------
-- Spikeball
-- Additional effect: Poison.
-- Range is 13.5 yalms.
-- Additional Effect: Poison is 3 HP/tick.
-- Poison effect may not always process.
-- Removes all Shadow Images on the target.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_POISON;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WATER);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,3,3,160*resist);
        end
    end

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.3 + math.random();
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
