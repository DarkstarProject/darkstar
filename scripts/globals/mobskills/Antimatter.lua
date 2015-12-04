---------------------------------------------------
--  Antimatter
--
--  Description:  Single-target ranged Light damage (~700-1500), ignores Utsusemi.
--  Type: Magical
--  

---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobID = mob:getID();   --(16908295 ,16908302 ,16908309 = ultima ,          16928966=proto-ultima   )
    local mobhp = mob:getHPP();
	local phase = mob:getLocalVar("battlePhase");

	if ((mobID == 16928966 and phase < 4) or ((mobID == 16908295 or mobID == 16908302 or mobID == 16908309) and mobhp < 20)) then
		return 0;
	end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_LIGHT,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
