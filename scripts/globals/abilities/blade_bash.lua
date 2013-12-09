-----------------------------------
-- Ability: Blade Bash
-- @author Katrinka (SinisterSkies)
-- @version 131207
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (not player:isWeaponTwoHanded()) then
		return MSGBASIC_NEEDS_2H_WEAPON,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	-- Stun rate
	if(math.random(1,100) < 99) then
		target:addStatusEffect(EFFECT_STUN,1,0,6);
	end
	
	-- Yes, even Blade Bash deals damage dependant of Dark Knight level
	local darkKnightLvl = 0;
    local damage = 0;
	if(player:getMainJob()==JOB_DRK) then
        damage = math.floor(((player:getMainLvl() + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
	elseif(player:getSubJob()==JOB_DRK) then
        damage = math.floor(((player:getSubLvl() + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
	end
	
	-- Calculating and applying Blade Bash damage
	target:delHP(damage);
	target:updateEnmityFromDamage(player,damage);
    
	-- Applying Plague based on merit level.
    if(math.random(1,100) < 65) then
        target:addStatusEffect(EFFECT_PLAGUE,5,0,15 + player:getMerit(MERIT_BLADE_BASH));
    end
	
    ability:setMsg(110)
    
	return damage;
end;
