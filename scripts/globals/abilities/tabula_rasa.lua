-----------------------------------
-- Ability: Tabula Rasa
-- Optimizes both white and black magic capabilities while allowing charge-free stratagem use.
-- Obtained: Scholar Level 1
-- Recast Time: 1:00:00
-- Duration: 0:03:00
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

    local regenbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
    end

    local helixbonus = 0;
    if (player:getMainJob() == JOBS.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor(player:getMainLvl() / 4);
    end
    player:resetRecast(RECAST_ABILITY, 228);
    player:resetRecast(RECAST_ABILITY, 231);
    player:resetRecast(RECAST_ABILITY, 232);
    player:addStatusEffect(EFFECT_TABULA_RASA,math.floor(helixbonus*1.5),0,180,0,math.floor(regenbonus*1.5));

    return EFFECT_TABULA_RASA;
end;