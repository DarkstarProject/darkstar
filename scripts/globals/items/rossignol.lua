-----------------------------------------
--    ID: 18075
--    Equip: Rossignol
--    Dusk to Dawn: STR +2
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target, totd)

main = target:getEquipID(SLOT_MAIN);
    
    if (main == 18075) then
        if (VanadielTOTD() ~= 3) then
            target:addMod(MOD_STR,2);
        elseif (totd ~= 0) then
            target:delMod(MOD_STR,2);
        end
    elseif (VanadielTOTD() ~= 3) then
        target:delMod(MOD_STR,2);
    end
end;