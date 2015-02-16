---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
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
    target:SpoofChatPlayer( "3.....2.....1.....", MESSAGE_SAY, mob:getID() )    
	local typeEffect = EFFECT_KO;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 1));
    return typeEffect;
end;
