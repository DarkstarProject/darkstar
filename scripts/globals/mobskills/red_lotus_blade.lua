---------------------------------------------
--  red lotus blade
--
--  Description: Delivers a four-hit attack. Chance of critical varies with TP. 
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/zones/Qubia_Arena/TextIDs");
require("scripts/zones/Throne_Room/TextIDs");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
if(mob:getFamily() == 482)then
	target:showText(mob,NO_HIDE_AWAY);
    return 0;
elseif(mob:getFamily() == 483)then
	target:showText(mob,RLB_PREPARE);
    return 0;
else 
	return 0;
end
end;

function onMobWeaponSkill(target, mob, skill)
	if(mob:getFamily() == 482)then
	target:showText(mob,FEEL_MY_PAIN);
	elseif(mob:getFamily() == 483)then
	target:showText(mob,RLB_LAND);
	else
	mob:messageBasic(43, 0, 687+256);
	end
	skill:setSkillchain(40);

    
	local numhits = 4;
	local accmod = 1;
	local dmgmod = 1.25;
   local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1,1.2,1.3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);


   target:delHP(dmg);
return dmg;
end;
