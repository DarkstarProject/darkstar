-----------------------------------
-- Blade Kamu
-- Katana weapon skill
-- Skill Level: N/A
-- Lowers target's params.accuracy. Duration of effect varies with TP. Nagi: Aftermath effect varies with TP.
-- Effect lasts 60 seconds @ 100 TP, 90 seconds @ 200 TP, and 120 seconds @ 300 TP
-- Available only after completing the Unlocking a Myth (Ninja) quest.
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:50% ; INT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
    params.str_wsc = 0.5; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.5; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6; params.int_wsc = 0.6;
        params.atkmulti = 1.3125;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params);
    if (damage > 0) then
        local duration = (tp/1000 * 45) + 30;
        if (target:hasStatusEffect(EFFECT_ACCURACY_DOWN) == false) then
            target:addStatusEffect(EFFECT_ACCURACY_DOWN, 10, 0, duration);
        end
    end

    -- Aftermath calculations from : https://www.bg-wiki.com/bg/Nagi_(Level_75)
    if (damage > 0) then
        local aftermathParams = initAftermathParams()
        aftermathParams.power = player:getAftermathModPower(false)
        if (shouldApplyAftermath(player, aftermathParams.power, tp, AFTERMATH_MYTHIC)) then
            if (tp == 3000) then
                aftermathParams.type = EFFECT_AFTERMATH_LV3
                aftermathParams.subpower.type = MOD_OCC_ATT_X_TIMES
            elseif (tp >= 2000) then
                aftermathParams.type = EFFECT_AFTERMATH_LV2
                aftermathParams.subpower.type = MOD_ATT
            else
                aftermathParams.type = EFFECT_AFTERMATH_LV1
                aftermathParams.subpower.power = MOD_ACC
            end

            applyMythicAftermath(player, tp, aftermathParams)
        end
    end
    
    return tpHits, extraHits, criticalHit, damage
end
