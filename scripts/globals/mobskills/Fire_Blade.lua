---------------------------------------------
--  Fire Blade
--  Description: Applies Enfire and absorbs Fire damage.
--  Type: Enhancing
--  Used only by Kam'lanaut. Enfire aspect adds 70+ to his melee attacks.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	
    local typeEffect = EFFECT_ENFIRE;

    skill:setMsg(MobBuffMove(mob, typeEffect, 65, 0, 60));

    return typeEffect;
    
end;
