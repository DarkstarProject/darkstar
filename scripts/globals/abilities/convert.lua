-----------------------------------
-- Ability: Convert
-- Swaps current HP with MP.
-- Obtained: Red Mage Level 40
-- Recast Time: 10:00
-- Duration: Instant
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
    local MP = player:getMP();
    local HP = player:getHP();
    if (MP > 0) then
        -- Murgleis sword augments Convert.
        if ((player:getMod(MOD_AUGMENTS_CONVERT)) > 0 and (HP > (player:getMaxHP()/2))) then
            HP = HP * (player:getMod(MOD_AUGMENTS_CONVERT));
        end
        player:setHP(MP);
        player:setMP(HP);
    end
end;