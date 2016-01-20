-----------------------------------
-- Ability: High Jump
-- Performs a high jumping attack on enemy.
-- Obtained: Dragoon Level 35
-- Recast Time: 2:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/weaponskills");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)
    local params = {};
    params.numHits = 1;
    local ftp = 1
    params.ftp100 = ftp; params.ftp200 = ftp; params.ftp300 = ftp;
    params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    --ryunohige jump augment (guaranteed crit) can probably just set these to 1.0
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = true;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = (player:getMod(MOD_JUMP_ATT_BONUS) + 100) / 100
    params.bonusTP = player:getMod(MOD_JUMP_TP_BONUS)
    params.targetTPMult = 0
    if player:getMainJob() == JOB_DRG then 
        params.enmityMult = 0.5
    else
        params.enmityMult = 0.7
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, 0, params, 0, true)

    if (tpHits + extraHits > 0) then
        -- Under Spirit Surge, High Jump reduces TP of target
        if (player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true) then
            target:delTP(damage * 2)
        end
        if (criticalHit) then
            action:speceffect(target:getID(), 38)
        end
        action:speceffect(target:getID(), 32)
    else
        ability:setMsg(MSGBASIC_USES_BUT_MISSES)
        action:speceffect(target:getID(), 0)
    end

    return damage;
end;
