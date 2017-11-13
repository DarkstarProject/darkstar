-----------------------------------------
-- ID: 18551
-- Item: Twilight Scythe
-- Additional Effect: DEATH
-- TODO: Enchantment: Non-elemental
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 3;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    elseif (target:isMob()) then
        if (target:isMobType(MOBTYPE_NOTORIOUS)) then
            return 0,0,0;
        else
            target:setHP(0)
            return SUBEFFECT_DEATH, msgBasic.ADD_EFFECT_STATUS, EFFECT_KO;
        end
    else
        target:setHP(0)
        return SUBEFFECT_DEATH, msgBasic.ADD_EFFECT_STATUS, EFFECT_KO;
    end
end;