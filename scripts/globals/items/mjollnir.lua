-----------------------------------------
-- ID: 18324
-- Item: Mjollnir
-- Additional Effect: Recover MP
-----------------------------------------
require("scripts/globals/msg");

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local mp = math.random(4,16);
        player:addMP(mp);
        player:messageBasic(msgBasic.RECOVERS_MP, 0, mp);
        return 0,0,0; -- Function REQUIRES a return or will error!
    end
end;