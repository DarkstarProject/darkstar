-----------------------------------
-- Ability: Reward
-- Feeds pet to restore its HP.
-- Obtained: Beastmaster Level 12
-- Recast Time: 1:30
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    else
        local id = player:getEquipID(SLOT_AMMO);
        if (id >= 17016 and id <= 17023) then
            player:setBattleSubTarget(player:getPet());
            return 0,0;
        else
            return MSGBASIC_MUST_HAVE_FOOD,0;
        end
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)

    -- 1st need to get the pet food is equipped in the range slot.
    local rangeObj = player:getEquipID(SLOT_AMMO);
    
    local minimumHealing = 0;
    local totalHealing = 0;
    local playerMnd = player:getStat(MOD_MND);
    local rewardHealingMod = player:getMod(MOD_REWARD_HP_BONUS);
    local regenAmount = 1; -- 1 is the minimum.
    local regenTime = 180; -- 3 minutes
    
    local pet = player:getPet();
    local petCurrentHP = pet:getHP();
    local petMaxHP = pet:getMaxHP();
    
    
    -- Need to start to calculate the HP to restore to the pet.
    -- Please note that I used this as base for the calculations:
    -- http://wiki.ffxiclopedia.org/wiki/Reward
    
    switch (rangeObj) : caseof {
        [17016] = function (x) -- pet food alpha biscuit
            -- printf("Food: pet food alpha biscuit.");
            minimumHealing = 50;
            regenAmount = 1;
            totalHealing = math.floor(minimumHealing + 2*(playerMnd-10));
            end,
        [17017] = function (x) -- pet food beta biscuit
            -- printf("Food: pet food beta biscuit.");
            minimumHealing = 180;
            regenAmount = 3;
            totalHealing = math.floor(minimumHealing + 1*(playerMnd-33));
            end,
        [17018] = function (x) -- pet food gamma biscuit
            -- printf("Food: pet food gamma biscuit.");
            minimumHealing = 300;
            regenAmount = 5;
            totalHealing = math.floor(minimumHealing + 1*(playerMnd-35)); -- TO BE VERIFIED.
            end,
        [17019] = function (x) -- pet food delta biscuit
            -- printf("Food: pet food delta biscuit.");
            minimumHealing = 530;
            regenAmount = 8;
            totalHealing = math.floor(minimumHealing + 2*(playerMnd-40)); -- TO BE VERIFIED.
            end,
        [17020] = function (x) -- pet food epsilon biscuit
            -- printf("Food: pet food epsilon biscuit.");
            minimumHealing = 750;
            regenAmount = 11;
            totalHealing = math.floor(minimumHealing + 2*(playerMnd-45));
            end,
        [17021] = function (x) -- pet food zeta biscuit
            -- printf("Food: pet food zeta biscuit.");
            minimumHealing = 900;
            regenAmount = 14;
            totalHealing = math.floor(minimumHealing + 3*(playerMnd-45));
            end,
        [17022] = function (x) -- pet food eta biscuit
            -- printf("Food: pet food eta biscuit.");
            minimumHealing = 1200;
            regenAmount = 17;
            totalHealing = math.floor(minimumHealing + 4*(playerMnd-50));
            end,
        [17023] = function (x) -- pet food theta biscuit
            -- printf("Food: pet food theta biscuit.");
            minimumHealing = 1600;
            regenAmount = 20;
            totalHealing = math.floor(minimumHealing + 4*(playerMnd-55));
            end,
    }
    
    
    
    -- Now calculating the bonus based on gear.
    local body = player:getEquipID(SLOT_BODY);
    

    switch (body) : caseof {
        [12646] = function (x) -- beast jackcoat
            -- This will remove Paralyze, Poison and Blind from the pet.
            -- printf("Beast jackcoat detected.");
            pet:delStatusEffect(EFFECT_PARALYSIS);
            pet:delStatusEffect(EFFECT_POISON);
            pet:delStatusEffect(EFFECT_BLINDNESS);
            end,
        [14481] = function (x) -- beast jackcoat +1
            -- This will remove Paralyze, Poison, Blind, Weight, Slow and Silence from the pet.
            -- printf("Beast jackcoat +1 detected.");
            pet:delStatusEffect(EFFECT_PARALYSIS);
            pet:delStatusEffect(EFFECT_POISON);
            pet:delStatusEffect(EFFECT_BLINDNESS);
            pet:delStatusEffect(EFFECT_WEIGHT);
            pet:delStatusEffect(EFFECT_SLOW);
            pet:delStatusEffect(EFFECT_SILENCE);
            end,
        [15095] = function (x) -- monster jackcoat
            -- This will remove Weight, Slow and Silence from the pet.
            -- printf("Monster jackcoat detected.");
            pet:delStatusEffect(EFFECT_WEIGHT);
            pet:delStatusEffect(EFFECT_SLOW);
            pet:delStatusEffect(EFFECT_SILENCE);
            end,
        [14481] = function (x) -- monster jackcoat +1
            -- This will remove Paralyze, Poison, Blind, Weight, Slow and Silence from the pet.
            -- printf("Monster jackcoat +1 detected.");
            pet:delStatusEffect(EFFECT_PARALYSIS);
            pet:delStatusEffect(EFFECT_POISON);
            pet:delStatusEffect(EFFECT_BLINDNESS);
            pet:delStatusEffect(EFFECT_WEIGHT);
            pet:delStatusEffect(EFFECT_SLOW);
            pet:delStatusEffect(EFFECT_SILENCE);
            end,        
    }
    
    -- Adding bonus to the total to heal.
    
    if (rewardHealingMod ~= nil and rewardHealingMod > 0) then
        totalHealing = totalHealing + math.floor(totalHealing * rewardHealingMod / 100);
    end
    
    local diff = petMaxHP - petCurrentHP;

    if (diff < totalHealing) then
        totalHealing = diff;
    end

    pet:addHP(totalHealing);
    pet:wakeUp();

    -- Apply regen effect.

    pet:delStatusEffect(EFFECT_REGEN);
    pet:addStatusEffect(EFFECT_REGEN,regenAmount,3,regenTime); -- 3 = tick, each 3 seconds.
    player:removeAmmo();
    
    return totalHealing;
end;
