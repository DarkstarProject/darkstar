-----------------------------------
-- Ability: Modus Veritas
-- Increases damage done by helix spells while lowering spell duration by 50%.
-- Obtained: Scholar Level 65
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

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
    local helix = target:getStatusEffect(EFFECT_HELIX);
    if (helix ~= nil) then
        local mvPower = helix:getSubPower();
        local resist = applyResistanceAbility(player,target,ELE_NONE,SKILL_ELE,0); -- seems reasonable...
        -- Doesn't work against NMs apparently
        if (mvPower > 0) or (resist < 0.25) or (target:isNM()) then -- Don't let Modus Veritas stack to prevent abuse
            ability:setMsg(158); --Miss
            return 0;
        else
            -- Double power and halve remaining time
            local mvMerits = player:getMerit(MERIT_MODUS_VERITAS_DURATION);
            local durationMultiplier = 0.5 + (0.05 * mvMerits);
            mvPower = mvPower +1;
            local helixPower = helix:getPower() * 2;
            local duration = helix:getDuration();
            local remaining = helix:getTimeRemaining();
            duration = (duration-remaining) + math.floor(remaining * durationMultiplier);
            helix:setSubPower(mvPower);
            helix:setPower(helixPower);
            helix:setDuration(duration);
        end
    else
        ability:setMsg(323); -- No effect
    end
end;