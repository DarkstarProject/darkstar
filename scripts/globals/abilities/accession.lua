-----------------------------------
-- Ability: Accession
-- Extends the effect of your next healing or enhancing white magic spell to party members within range.
-- MP cost and casting time are doubled.
-- Obtained: Scholar Level 40
-- Recast Time: Stratagem Charge
-- Duration: 1 compatible white magic spell or 60 seconds, whichever occurs first
--
-- Level   |Charges |Recharge Time per Charge
-- -----   -------- ---------------
-- 10      |1       |4:00 minutes
-- 30      |2       |2:00 minutes
-- 50      |3       |1:20 minutes
-- 70      |4       |1:00 minute
-- 90      |5       |48 seconds
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(dsp.effects.ACCESSION) then
        return msgBasic.EFFECT_ALREADY_ACTIVE, 0;
    end
    return 0,0;
end;

function onUseAbility(player,target,ability)
    player:addStatusEffect(dsp.effects.ACCESSION,1,0,60);

    return dsp.effects.ACCESSION;
end;