---------------------------------------------
--  Frost Blade
--  Description: Applies Enblizzard and absorbs Ice damage.
--  Type: Enhancing
--  Used only by Kam'lanaut. Enblizzard aspect adds 70+ to his melee attacks.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	
    local typeEffect = EFFECT_ENBLIZZARD;

    skill:setMsg(MobBuffMove(mob, typeEffect, 65, 0, 60));

    return typeEffect;
    
end;
