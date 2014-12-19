-----------------------------------------
--	ID: 14430
--	Equip: Federation Aketon
--  Movement speed +56%
--  Movement Speed bonus works only if Windurst is your current allegiance
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)

    if (target:getNation() == 2) then 
    
        local body = target:getEquipID(SLOT_BODY)
        local feet = target:getEquipID(SLOT_FEET)
        local legs = target: getEquipID(SLOT_LEGS)
        
        if (body ~= 14430) then
            target:delMod(MOD_MOVE,35);
        elseif (feet == 15736 and legs == 14281) then -- Trotter's Boots + Blood Cuisses
            target:setMod(MOD_MOVE,59);
        elseif (feet == 15736 and legs == 14280) then -- Trotter's Boots + Crimson Cuisses
            target:setMod(MOD_MOVE,59);
        elseif (feet == 15736) then -- Trotter's Boots
            target:setMod(MOD_MOVE,47);
        elseif (legs == 14280 or legs == 14281) then -- Crimson Cuisses or Blood Cuisses
            target:setMod(MOD_MOVE,47);
        elseif (feet ~= 15736 and legs ~= 14280 and legs ~= 14281) then -- Aketon only
            target:setMod(MOD_MOVE,35);
        else
            target:setMod(MOD_MOVE,35); -- Also aketon only, probably useless with the above elseif but it can't hurt
        end
    end
end;