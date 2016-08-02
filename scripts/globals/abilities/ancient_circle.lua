-----------------------------------
-- Ability: Ancient Circle
-- Grants resistance, defense, and attack against dragons to party members within the area of effect.
-- Obtained: Dragoon Level 5
-- Recast Time: 5:00
-- Duration: 03:00

--According to BGWiki:
--	When cast as Subjob DRG it gives 5% damage reduction/increase
--	as Mainjob it gives 15%
--	when wearing certain Brais it gets another +2% power
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local power = 5;			--when cast as Subjob
    local duration = 180;

    if (player:getMainJob() == JOBS.DRG) then
        local sLegs = player:getEquipID(SLOT_LEGS);

        if (sLegs == 14227 or sLegs == 15574 or sLegs == 28103) then
            power = 17;			--when cast as Mainjob w/ equipment
            duration = 240;		--Brais increase duration by 50%
        else
            power = 15;			--when cast as Mainjob w/o equipment
        end
    end
	
    target:addStatusEffect(EFFECT_ANCIENT_CIRCLE,power,0,duration);
end;