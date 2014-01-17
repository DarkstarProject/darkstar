---------------------------------------------
--  Water Blade
--  Description: Applies Enwater and absorbs Water damage.
--  Type: Enhancing
--  Used only by Kam'lanaut. Enwater aspect adds 70+ to his melee attacks.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	
    local typeEffect = EFFECT_ENWATER;

    skill:setMsg(MobBuffMove(mob, typeEffect, 65, 0, 60));

    return typeEffect;
    
end;
