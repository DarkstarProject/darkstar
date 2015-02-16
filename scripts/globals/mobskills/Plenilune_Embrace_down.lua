---------------------------------------------
-- Plenilune_Embrace
-- Attack Boost and Magic Attack Boost are based on Lunar Phase:
-- The boost effects are inverted;
-- the Attack Boost grows stronger approaching Full Moons while Magic Attack Bonus grows stronger approaching New Moons.
-- New Moon 0~5% - Grants Attack Boost of ~1% and Magic Attack Boost of ~15.
-- Waxing Crescent 5~25% - Grants Attack Boost of ~4.5% and Magic Attack Boost of ~12.
-- Waxing Crescent 25%~40% - Grants Attack Boost of ~5.25% and Magic Attack Boost of ~10.
-- First Quarter Moon 40%~60% - Grants Attack Boost of ~7.5% and Magic Attack Boost of ~6-7.
-- Waxing Gibbous 60%~75% - Grants Attack Boost of ~10% and Magic Attack Boost of 5.
-- Waxing Gibbous 75%~90% - Grants Attack Boost of ~12.25% and Magic Attack Boost of ~2-3.
-- Full Moon 90%~100% - Grants Attack Boost of ~15.0% and Magic Attack Boost of ~1.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	if (mob:AnimationSub() == 1) then
		return 1;
	else	
	return 0;
	end
end;

function onMobWeaponSkill(target, mob, skill)
	local moonPhase = VanadielMoonPhase();
	local potency = skill:getParam();
	local eraseChance = 0;
	local AB = 0;
	local MB = 0;

	if(potency == 0) then
		potency = 20;
	end
	if (AB == 0) then
		AB = 7;
	end
	if (MB == 0) then
		MB = 7;
	end
	if (moonPhase > 0 and moonPhase < 5) then
		AB = 1;
		MB = 15;
		eraseChance = math.random(15);
	elseif (moonPhase > 5 and moonPhase < 25) then
		AB = 4.5;
		MB = 12;
		eraseChance = math.random(12);
	elseif (moonPhase > 25 and moonPhase < 40) then
		AB = 5.25;
		MB = 10;
		eraseChance = math.random(10);
	elseif (moonPhase > 40 and moonPhase < 60) then
		AB = 7;
		MB = 7;
		eraseChance = math.random(7);
	elseif (moonPhase > 60 and moonPhase < 75) then
		AB = 10;
		MB = 5;
		eraseChance = math.random(5);
	elseif (moonPhase > 75 and moonPhase < 90) then
		AB = 12.25;
		MB = 3;
		eraseChance = math.random(3);
	elseif (moonPhase > 90 and moonPhase < 100) then
		AB = 15;
		MB = 1;
		eraseChance = 1;
	end

	if (eraseChance == 1) then
		target:eraseStatusEffect();
	end

	potency = potency - math.random(0, potency / 2);

	skill:setMsg(MobBuffMove(mob, EFFECT_ATTACK_BOOST, AB, 0, 60));
	skill:setMsg(MobBuffMove(mob, EFFECT_MAGIC_ATK_BOOST, MB, 0, 60));
	skill:setMsg(MSG_SELF_HEAL);

	return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
