-----------------------------------
-- Ability: Chi Blast
-- Releases Chi to attack an enemy.
-- Obtained: Monk Level 41
-- Recast Time: 3:00
-- Duration: Instant
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
    local boost = player:getStatusEffect(EFFECT_BOOST);
    local multiplier = 1.0;
    if (boost ~= nil) then
        multiplier = (boost:getPower()/100) * 4; --power is the raw % atk boost
    end
    
    local dmg = math.floor(player:getStat(MOD_MND)*(0.5+(math.random()/2))) * multiplier;

    dmg = utils.stoneskin(target, dmg);
    
    target:delHP(dmg);
    
    target:updateClaim(player);
    target:updateEnmityFromDamage(player,dmg);
    player:delStatusEffect(EFFECT_BOOST);
    return dmg;
end;
