-----------------------------------
-- Ability: Devotion
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
        --You can't cast Devotion on Yourself
        if(player:getName() == target:getName()) then
            return MSGBASIC_CANNOT_ON_THAT_TARG,0;
        -- Fails if HP < 4
        elseif(player:getHP() < 4) then
            return MSGBASIC_UNABLE_TO_USE_JA,0;
        -- Distance must be < 10 for it to work...
        elseif(player:checkDistance(target)>10) then
            return MSGBASIC_TARG_OUT_OF_RANGE,0;
        else
            return 0,0;
        end
end;

function OnUseAbility(player, target, ability)
    --Plus 5 percent mp recovers per extra devotion merit
    local meritBonus = player:getMerit(MERIT_DEVOTION);
    --printf("Devotion Merit Bonus: %d", meritBonus);
    
    local mpPercent = (25 + meritBonus) / 100;
    --printf("Devotion MP Percent: %f", mpPercent);
    
    local damageHP = math.floor(player:getHP() * 0.25);    
    --printf("Devotion HP Damage: %d", damageHP);

    --If stoneskin is present, it should absorb damage...
    damageHP = utils.stoneskin(player, damageHP);    
    --printf("Devotion HP Damage (after Stoneskin): %d", damageHP);
    
    local healMP = player:getHP() * mpPercent;
    --printf("Devotion MP Healed: %d", healMP);
    
    player:delHP(damageHP);
    target:addMP(healMP);
end;