-----------------------------------------
-- ID: 4175
-- Item: Vile Elixir +1
-- Item Effect: Instantly restores 55% of HP and MP
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
local mHP = target:getMaxHP();
local cHP = target:getHP();
local mMP = target:getMaxMP();
local cMP = target:getMP();


if (mHP == cHP and mMP == cMP) then
    result = 56; -- Does not let player use item if their hp and mp are full
end

return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addHP((target:getMaxHP()/100)*55);
    target:addMP((target:getMaxMP()/100)*55);
    target:messageBasic(26);
end;