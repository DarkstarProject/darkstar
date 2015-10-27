-----------------------------------------
-- ID: 15182
-- Item: Zoolater Hat
-- Item Effect: Pet gets meditate
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local pet = target:getPet();

    if (pet) then
        pet:addStatusEffect(EFFECT_REGAIN, 15, 3, 15);
    else
        target:messageBasic(423);
    end
end;
