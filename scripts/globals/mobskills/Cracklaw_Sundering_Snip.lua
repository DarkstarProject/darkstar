---------------------------------------------
--  Ravenous_Cracklaw_Sundering_Snip
--
--  Description: Damage varies with TP.
--  Type: Physical (Slashing)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_AMNESIA;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 5, 3, 90);
	local numhits = 1;
	local accmod = 1;
	local dmgmod = math.random(4,6)+math.random();
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_WIPE_SHADOWS,info.hitslanded);

    -- keep damage around 700
    if(dmg < 1000) then
        dmg = dmg * 1.7;
    end

	target:delHP(dmg);
	return dmg;
end
