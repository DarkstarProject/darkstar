-----------------------------------
-- Ability: Apogee
-- Increases the MP Cost of the Next Blood Pact but makes its recast timer 0
-- Obtained: Summoner Level 70
-- Recast Time: 5 Minutes
-- Duration: 1 Blood Pact or 60 seconds, whichever occurs first.
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(EFFECT.APOGEE) then
        return msgBasic.EFFECT.ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:addStatusEffect(EFFECT.APOGEE,1,0,60);

    return EFFECT.APOGEE;
end;