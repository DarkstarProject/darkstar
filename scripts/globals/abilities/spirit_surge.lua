-----------------------------------
-- Ability: Spirit Surge
-- Adds your wyvern's strength to your own.
-- Obtained: Dragoon Level 1
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    -- The wyvern must be present in order to use Spirit Surge
    if (target:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- Spirit Surge increases dragoon's MAX HP increases by 25% of wyvern MaxHP
    -- bg wiki says 25% ffxiclopedia says 15%, going with 25 for now
    local mhp_boost = target:getPet():getMaxHP()*0.25;

    -- Spirit Surge increases dragoon's Strength
    local strBoost = 0;
    if (target:getMainJob()==JOB_DRG) then
        strBoost = (1 + target:getMainLvl()/5); -- Use Mainjob Lvl
    else
        strBoost = (1 + target:getSubLvl()/5);  -- Use Subjob Lvl
    end

    -- Spirit Surge lasts 60 seconds, or 20 more if Wyrm Mail+2 is equipped
    local duration = 60;
    if (target:getEquipID(SLOT_BODY)==10683) then
        duration = duration + 20;
    end

    target:despawnPet();
    -- All Jump recast times are reset
    target:resetRecast(RECAST_ABILITY,158); -- Jump
    target:resetRecast(RECAST_ABILITY,159); -- High Jump
    target:resetRecast(RECAST_ABILITY,160); -- Super Jump

    target:addStatusEffect(EFFECT_SPIRIT_SURGE, mhp_boost, 0, duration, 0, strBoost);
end;