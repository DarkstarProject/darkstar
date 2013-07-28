-----------------------------------
-- Ability: Ice Shot
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	--ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
	--no card: <name> cannot perform that action.
	if (player:getWeaponSkillType(SLOT_RANGED) ~= SKILL_MRK or player:getWeaponSkillType(SLOT_AMMO) ~= SKILL_MRK) then
		return 216,0;
	end
	if (player:hasItem(2177, 0) or player:hasItem(2974, 0)) then
		return 0,0;
	else
		return 71, 0;
	end
end;

function OnUseAbility(player, target, ability)
	local dmg = 2 * player:getRangedDmg() + player:getAmmoDmg() + player:getMod(MOD_QUICK_DRAW_DMG);
	dmg  = addBonuses(player, ELE_ICE, target, dmg);
	dmg = dmg * applyResistanceMinimal(player,target,ELE_ICE,SKILL_MRK);
	dmg = adjustForTarget(target,dmg);
	
	dmg = utils.stoneskin(target, dmg);
		
	target:delHP(dmg);
	target:updateEnmityFromDamage(player,dmg);
	
	local effects = {};
	local counter = 1;
	local frost = target:getStatusEffect(EFFECT_FROST);
	if (frost ~= nil) then
		effects[counter] = frost;
		counter = counter + 1;
	end
	local threnody = target:getStatusEffect(EFFECT_THRENODY);
	if (threnody ~= nil and threnody:getSubPower() == MOD_WINDRES) then
		effects[counter] = threnody;
		counter = counter + 1;
	end
	local paralyze = target:getStatusEffect(EFFECT_PARALYSIS);
	if (paralyze ~= nil) then
		effects[counter] = paralyze;
		counter = counter + 1;
	end
	
	if counter > 1 then
		local effect = effects[math.random(1, counter-1)];
		local duration = effect:getDuration();
		local startTime = effect:getStartTime();
		local tick = effect:getTick();
		local power = effect:getPower();
		local subpower = effect:getSubPower();
		local tier = effect:getTier();
		local effectId = effect:getType();
		local subId = effect:getSubType();
		power = power * 1.2;
		target:delStatusEffectSilent(effectId);
		target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier);
		local newEffect = target:getStatusEffect(effectId);
		newEffect:setStartTime(startTime);
	end
	
	return dmg;
end;