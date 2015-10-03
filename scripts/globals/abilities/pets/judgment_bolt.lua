---------------------------------------------------
-- Judgment Bolt
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    local level = player:getMainLvl() * 2;
    
    if(player:getMP()<level) then
       return 87,0;
    end
    
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local master = pet:getMaster();
	local smnSkill = master:getSkillLevel(SKILL_SUM);
	local dmgmod = 3 + math.floor(smnSkill / 100);
	
	local damage = MobMagicalMove(pet,target,skill,pet:getWeaponDmg()*3,ELE_LIGHTNING,dmgmod,TP_NO_EFFECT);
	damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_LIGHTNING);
	damage = MobFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHTNING,MOBPARAM_IGNORE_SHADOWS);
	
	target:delHP(damage);
	target:updateEnmityFromDamage(pet,damage);
	
	master:setMP(0);
	
	return damage;
end