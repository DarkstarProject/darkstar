---------------------------------------------------
-- Healing Ruby II
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local base = 28 + pet:getMainLvl()*4;

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP(); --cap it
    end
    skill:setMsg(MSG_SELF_HEAL);
    target:addHP(base);
    return base;
end