-----------------------------------
-- Ability: Despoil
-- Steals and item and inflicts a 
-- status effect
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)

	local thfLevel;
	local stolen = 0;
	thfLevel = player:getMainLvl();
	local statusEffectMelee = math.random(5);
	local statusEffectMagic = math.random(3);
	local mobJob = target:getMainJob();
	
	local stealChance = 50 + (player:getMod(MOD_DESPOIL) * 2) + thfLevel - target:getMainLvl();

	if(math.random(100) < stealChance) then
		stolen = target:getStealItem();

		player:addItem(stolen);
		ability:setMsg(125);
		if(mobJob == 3 or mobJob == 4 or mobJob == 5 or mobJob == 10 or mobJob == 15 or mobJob == 16) then
			if(statusEffectMagic == 1) then
				if(target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			elseif(statusEffectMagic == 2) then
				if(target:addStatusEffect(EFFECT_MAGIC_ACC_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			elseif(statusEffectMagic == 3) then
				if(target:addStatusEffect(EFFECT_MAGIC_ATK_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			end
		else
			if(statusEffectMelee == 1) then
				if(target:addStatusEffect(EFFECT_SLOW,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			elseif(statusEffectMelee == 2) then
				if(target:addStatusEffect(EFFECT_EVASION_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			elseif(statusEffectMelee == 3) then
				if(target:addStatusEffect(EFFECT_ATTACK_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			elseif(statusEffectMelee == 4) then
				if(target:addStatusEffect(EFFECT_ACCURACY_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			elseif(statusEffectMelee == 5) then
				if(target:addStatusEffect(EFFECT_DEFENSE_DOWN,25,0,30)) then
					target:messageBasic(194);
				else
					target:messageBasic(189);
				end
			end
		end
	else
		ability:setMsg(153);
	end

	return stolen;
end;
