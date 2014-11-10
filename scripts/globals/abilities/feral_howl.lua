---------------------------------------------------
-- Ability: Feral Howl
-- Causes Terror for 1 to 20 seconds, which causes the victim to be stunned for the duration of the effect.
-- http://wiki.ffxiclopedia.org/wiki/Feral_Howl
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------
function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	merits = player:getMerit(MERIT_FERAL_HOWL);
	--printf("merits : %u",merits);
	body = player:getEquipID(SLOT_BODY);
	--printf("body : %u",body);
    if target:hasStatusEffect(EFFECT_TERROR) == true or target:hasStatusEffect(EFFECT_STUN) == true then -- effect already on, or target stunned, do nothing
--        spell:setMsg(75);
    else
        -- Calculate duration.
        duration = 10;
		--printf("Duration : %u",duration);
		if body == 10678 then
			-- http://wiki.ffxiclopedia.org/wiki/Monster_Jackcoat_(Augmented)_%2B2
			-- add 20% duration per merit level if wearing Augmented Monster Jackcoat +2
			duration = (duration + (duration * merit * 0.2));
			--printf("Duration post merit : %u",duration);
		end
    end

	-- Leaving potency at 1 since I am not sure it applies with this ability... no known way to increase resistance
	potency = 1;
    --printf("Potency : %u",potency);
	
	-- Grabbing variables for terror accuracy. Unknown if ability is stat based. Using Beastmaster's level versus Target's level
    pLvl = player:getMainLvl();
	--printf("player level : %u",pLvl);
    mLvl = target:getMainLvl();
	--printf("mob level : %u",mLvl);

	-- Checking level difference between the target and the BST
	dLvl = (mLvl - pLvl);
	--printf("level difference : %u",dLvl);

	-- Determining what level of resistance the target will have to the ability
	if dLvl <= 0 then -- default level difference to 1 if mob is equal to the Beastmaster's level or less.
		resist = 1 
	--printf("resist : %u",resist);
	else
	resist = math.random(1,(dLvl + 10)); -- calculate chance of missing based on number of levels mob is higher than you. Target gets 10% resist per level over BST
	--printf("resist : %u",resist);
	end

	-- Adjusting duration based on resistance. Only fair way I could see to do it...
	if resist >= 2 then
		if resist >= (duration) then
			resist = (duration - 2)
		end
		duration = (duration - math.random(1,resist));
		--printf("Duration post resist : %u",duration);
	end
	
	-- execute ability based off of resistance value; space reserved for resist message
    if resist <= 9 then -- still experimental. not exactly sure how to calculate hit %
        target:addStatusEffect(EFFECT_TERROR,potency,0,duration);
    else
        -- reserved for text related to resist
    end

	return EFFECT_TERROR;
end;
