-----------------------------------------
-- ID: 18306
-- Item: Apocalypse
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 10;

    -- if (target:hasImmunity(64)) then
        -- spell:setMsg(75);
    -- This does nothing, as this is not a spell, and it doesn't get used in the return. 
    -- That should be handled in the resist check in the global anyways.

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_BLINDNESS, 15, 0, 30);
        return SUBEFFECT_BLIND, 160, EFFECT_BLINDNESS;
    end
end;