---------------------------------------------
--  Hysteric Barrage
--
--  Description: Delivers a fivefold attack. Damage varies with TP.
--  Type: Physical (Hand-to-Hand)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	local ID = mob:getID();
    if (ID == 16998862) then
	    return 1;
	else
	    return 0;
	end	
end;

function onMobWeaponSkill(target, mob, skill)
	-- local numhits = 5;
	-- local accmod = 1;
	-- local dmgmod = .7;
	-- local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	-- local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);
	-- target:delHP(dmg);
	-- return dmg;
end;
