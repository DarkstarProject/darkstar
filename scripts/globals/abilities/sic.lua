-----------------------------------
-- Ability: Sic
-- Commands the charmed Pet to make a random special attack.
-- Obtained: Beastmaster Level 25
-- Recast Time: 2 minutes
-- Duration: N/A
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    else
        if (player:getPet():getHP() == 0) then
            return MSGBASIC_UNABLE_TO_USE_JA,0;
        elseif (player:getPet():getTarget() == nil) then
            return MSGBASIC_PET_CANNOT_DO_ACTION,0;
        elseif (not player:getPet():hasTPMoves()) then
            return MSGBASIC_UNABLE_TO_USE_JA,0;
        else
            return 0,0;
        end
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local function doSic(mob)
        if mob:getTP() >= 1000 then
            mob:useMobAbility()
        elseif mob:hasSpellList() then
            mob:castSpell()
        else
            mob:queue(0,doSic)
        end

    end

    player:getPet():queue(0, doSic)
end;
