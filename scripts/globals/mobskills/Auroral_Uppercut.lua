---------------------------------------------
--  Auroral Uppercut
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/zones/Empyreal_Paradox/TextIDs");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD) or target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
        return 1;
    end
    mob:showText(mob, PRISHE_TEXT + 4);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.0;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    
    target:delHP(dmg);
    return dmg;
end;
