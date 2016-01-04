-----------------------------------------
-- ID: 10440
-- Item: Murzim Zucchetto
-- Item Effect: Automation: Haste +6%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local pet = target:getPet();
    
    if (target:getEquipID(SLOT_HEAD) == 10440) then
        pet:addMod(MOD_HASTE_GEAR, 61);
    else
        pet:delMod(MOD_HASTE_GEAR, 61);
    end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;
