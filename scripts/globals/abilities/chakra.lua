-----------------------------------
-- Ability: Chakra
-- Cures certain status effects and restores a small amount of HP to user.
-- Obtained: Monk Level 35
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    local hp = player:getHP();
    local vit = player:getStat(MOD_VIT);
    local multi = 2;
    local merits = player:getMerit(MERIT_INVIGORATE);
    local body = player:getEquipID(SLOT_BODY);
    local hand = player:getEquipID(SLOT_HANDS);

    if (player:hasStatusEffect(EFFECT.POISON)) then
        player:delStatusEffect(EFFECT.POISON);
    end

    if (player:hasStatusEffect(EFFECT.BLINDNESS)) then
        player:delStatusEffect(EFFECT.BLINDNESS);
    end

    if ((body == 12639) or (body == 14474)) then -- Temple Cyclas (+1) equipped
        if (player:hasStatusEffect(EFFECT.PARALYSIS)) then
            player:delStatusEffect(EFFECT.PARALYSIS);
        end
        multi = multi + 1;
    end

    if ((hand == 15103) or (hand == 14910)) then -- Melee Gloves (+1) equipped
        if (player:hasStatusEffect(EFFECT.DISEASE)) then
            player:delStatusEffect(EFFECT.DISEASE);
        end
        multi = multi + 0.6;
    end

    local recover = (multi * vit);
    player:setHP((hp + recover));

    if (merits >= 1) then
        if (player:hasStatusEffect(EFFECT.REGEN)) then
            player:delStatusEffect(EFFECT.REGEN);
        end
        player:addStatusEffect(EFFECT.REGEN,10,0,merits,0,0,1);
    end

    return recover;
end;