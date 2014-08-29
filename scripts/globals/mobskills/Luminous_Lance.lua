---------------------------------------------
--  Luminous Lance
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/zones/Empyreal_Paradox/TextIDs");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    local lanceTime, lanceOut, rejuv = mob:getExtraVar(3);
    if (not (target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD) and target:hasStatusEffect(EFFECT_MAGIC_SHIELD)))
        and (lanceTime + 60 < mob:getBattleTime()) and target:getCurrentAction() ~= ACTION_MOBABILITY_USING
        and lanceOut == 1 then

        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    mob:showText(mob, SELHTEUS_TEXT + 1);

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.6;

    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

    mob:entityAnimationPacket("ids0");
    local lanceTime, lanceOut, rejuv = mob:getExtraVar(3);
    mob:setExtraVar(mob:getBattleTime(), 0, rejuv);
    target:AnimationSub(3);
    target:addStatusEffect(EFFECT_STUN, 0, 0, 20);
    
    target:delHP(dmg);
    return dmg;
end;
