-----------------------------------
-- Fast Blade      
-- Sword weapon skill
-- Skill level: 5
-- Delivers a two-hit attack. Damage varies with TP.
-- Modifiers: STR:20% ; DEX:20% 
-- 100%TP 	200%TP 	300%TP
-- 1.00 	1.50 	2.00 
-----------------------------------

function OnUseWeaponSkill(attacker, target, wsID)
	-- Weapon Damage
	D = 5; --attacker->m_Weapons[SLOT_MAIN]->getDamage();weapon->getDamage()
	-- Attacker's STR - Target's VIT
	fSTR = math.abs(attacker:getMod(MOD_STR) - target:getMod(MOD_VIT));
	-- Attacker's ATK % Target's DEF (Max 2.4)
	PDIF = math.abs(attacker:getMod(MOD_ATT) - target:getMod(MOD_DEF));
	-- Stat Modifiers (STR * 20/100) * 1~0.83 (lvl30: 1, lvl75: 0.83)
	WSC = ((attacker:getMod(MOD_STR) * 0.2) + (attacker:getMod(MOD_DEX) * 0.2)) * 1;
	-- TP Modifiers
	if(attacker:getTP() <= 199) then
		fTP = 1;
	elseif(attacker:getTP() <= 299) then 
		fTP = 1.5;
	else
		fTP = 2;
	end
	
	-- Melee Damage = NB HIT * (((D + fSTR + WSC) * fTP) * PDIF)
	Damage = 2 * (((D + fSTR + WSC) * fTP) * PDIF);
	
	return math.floor(Damage);
end
