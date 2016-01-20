-----------------------------------
-- Ability: Meditate
-- Gradually charges TP.
-- Obtained: Samurai Level 30
-- Recast Time: 3:00 (Can be reduced to 2:30 using Merit Points)
-- Duration: 15 seconds
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local amount = 12;
    if (player:getMainJob()==12) then
        amount = 20;
    end

    local tick = 15;
    local extratick = 0;
    local sHands = target:getEquipID(SLOT_HANDS);
    local sHead = target:getEquipID(SLOT_HEAD);
    -- Todo: change these item checks into a modifier.
    if (sHands == 15113 or sHands == 14920) then
        extratick = 1;
    end
    if (sHead == 13868 or sHead == 15236) then
        extratick = extratick + 1;
    end
    if (extratick == 1) then
        extratick = math.random(1,2);
    elseif (extratick == 2) then
        extratick = math.random(2,3);
    end

    tick = tick + (extratick * 3);
    player:addStatusEffectEx(EFFECT_MEDITATE,0,amount,3,tick);
end;