---------------------------------------------------
-- Spike Flail
-- Deals extreme damage in a threefold attack to targets behind the user.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_SUPER_BUFF)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_INVINCIBLE)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON)) then
        return 1;
	elseif (target:isBehind(mob, 48) == false) then
		return 1;
    elseif (mob:AnimationSub() == 1) then
        return 1;
	end
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 2;
	local dmgmod = math.random(5,7);
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2,3,4);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
