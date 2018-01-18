-----------------------------------------
-- ID: 17583
-- Item: Kingdom Signet Staff
-- Effect: Signet
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/conquest");
require("scripts/globals/zone");
require("scripts/globals/msg");
-----------------------------------------

function onItemCheck(target, param, caster)
    
    if (target:getNation() ~= NATION_SANDORIA) then
        return msgBasic.ITEM_CANNOT_USE_ON
    end
    
    -- If target's current region is not a conquest region or not a nation city involved with conquest
    if (target:getCurrentRegion() > REGION_JEUNO) then
        return msgBasic.ITEM_UNABLE_TO_USE
    end

    -- Can only use on targets within party or self
    if (target:getID() ~= caster:getID()) then
        if (caster:getPartyLeader() == nil or target:getPartyLeader():getID() ~= caster:getPartyLeader():getID()) then
            return msgBasic.ITEM_CANNOT_USE_ON
        end
    end
    
    return 0;
end;


function onItemUse(target)

    target:delStatusEffect(EFFECT_SIGIL);
    target:delStatusEffect(EFFECT_SANCTION);
    target:delStatusEffect(EFFECT_SIGNET);
    target:addStatusEffect(EFFECT_SIGNET,0,0,18000);
    
end;
