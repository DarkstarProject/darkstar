-----------------------------------
-- Ability: Jump
-- Delivers a short jumping attack on a targeted enemy.
-- Obtained: Dragoon Level 10
-- Recast Time: 1:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/weaponskills");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability,action)
    local params = {};
    params.numHits = 1;
    local ftp = 1 + (player:getStat(MOD_VIT) / 256);
    params.ftp100 = ftp; params.ftp200 = ftp; params.ftp300 = ftp;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    if (player:getMod(MOD_FORCE_JUMP_CRIT) > 0) then
        params.crit100 = 1.0; params.crit200 = 1.0; params.crit300 = 1.0;
    end
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = (player:getMod(MOD_JUMP_ATT_BONUS) + 100) / 100
    params.bonusTP = player:getMod(MOD_JUMP_TP_BONUS)

    local taChar = player:getTrickAttackChar(target);
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, 0, 0, true, action, taChar, params);

    if (tpHits + extraHits > 0) then
        -- Under Spirit Surge, Jump also decreases target defense by 20% for 60 seconds
        if (player:hasStatusEffect(EFFECT.SPIRIT_SURGE) == true) then
            if (target:hasStatusEffect(EFFECT.DEFENSE_DOWN) == false) then
                target:addStatusEffect(EFFECT.DEFENSE_DOWN, 20, 0, 60);
            end
        end
        if (criticalHit) then
            action:speceffect(target:getID(), 38)
        end
        action:messageID(target:getID(), msgBasic.USES_JA_TAKE_DAMAGE)
        action:speceffect(target:getID(), 32)
    else
        action:messageID(target:getID(), msgBasic.JA_MISS_2)
        action:speceffect(target:getID(), 0)
    end

    return damage;
end;
