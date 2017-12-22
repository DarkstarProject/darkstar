-----------------------------------------
-- ID: 4378
-- Item: Jug of Selbina Milk
-- Item Effect: regen: 1 HP/tick x 120sec, x 150sec w/ dream robe +1 
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_REGEN)) then
        if (target:getEquipID(SLOT_BODY) == 14520) then -- Dream Robe +1
            target:addStatusEffect(EFFECT_REGEN,1,3,150);
        else
            target:addStatusEffect(EFFECT_REGEN,1,3,120);
        end
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
