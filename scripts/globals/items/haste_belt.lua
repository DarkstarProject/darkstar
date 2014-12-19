-----------------------------------------
-- ID: 15290
-- Item: Haste Belt
-- Item Effect: 10% haste
-- Modified By: Euda
-- Modification Date: 04/17/14
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
	-- Changed From EFFECT_HASTE to EFFECT_HASTE_SAMBA
	-- Due to Haste Spell Overwriting the effect of the belt.
    if(target:hasStatusEffect(EFFECT_HASTE_SAMBA) == false) then
        target:addStatusEffect(EFFECT_HASTE_SAMBA,102,0,180);
    else
        target:messageBasic(423);
    end

end;