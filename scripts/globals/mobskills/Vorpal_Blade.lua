---------------------------------------------
--  Vorpal Blade
--
--  Description: Delivers a four-hit attack. Chance of critical varies with TP. 
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

---------------------------------------------------
-- OnMobSkillCheck
-- Check for Grah Family id 122,123,124
-- if not in Paladin form, then ignore. 
---------------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    if((mob:getFamily() == 122 or mob:getFamily() == 123 or mob:getFamily() == 124) and mob:AnimationSub() ~= 1) then
		return 1;
	else
		return 0;
	end
end;

function OnMobWeaponSkill(target, mob, skill)

	mob:messageBasic(43, 0, 687+256);
	skill:setSkillchain(40);
    
	local numhits = 4;
	local accmod = 1;
	local dmgmod = 1.25;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1,1.2,1.3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

	-- AA EV: Approx 900 damage to 75 DRG/35 THF.  400 to a NIN/WAR in Arhat, but took shadows.
   target:delHP(dmg);
	return dmg;
end;
