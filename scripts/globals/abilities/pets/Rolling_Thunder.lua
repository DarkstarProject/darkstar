---------------------------------------------------
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	duration = 60 + 2 * summoner:getMod(MOD_SUMMONING);
    target:delStatusEffect(EFFECT_ENFIRE);
    target:delStatusEffect(EFFECT_ENSTONE);
    target:delStatusEffect(EFFECT_ENWATER);
    target:delStatusEffect(EFFECT_ENAERO);
    target:delStatusEffect(EFFECT_ENBLIZZARD);
    target:delStatusEffect(EFFECT_ENTHUNDER);
    target:delStatusEffect(EFFECT_ENFIRE_II);
    target:delStatusEffect(EFFECT_ENSTONE_II);
    target:delStatusEffect(EFFECT_ENWATER_II);
    target:delStatusEffect(EFFECT_ENAERO_II);
    target:delStatusEffect(EFFECT_ENBLIZZARD_II);
    target:delStatusEffect(EFFECT_ENTHUNDER_II);
    target:delStatusEffect(EFFECT_ENLIGHT);
    target:delStatusEffect(EFFECT_ENDARK);
	
    magicskill = getSkillLvl(1, target:getMainLvl()); 

    potency = 3 + ((6*magicskill)/100);
    if(magicskill>200) then
        potency = 5 + ((5*magicskill)/100);
    end
	
	target:addStatusEffect(EFFECT_ENTHUNDER,potency,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_ENTHUNDER;
end