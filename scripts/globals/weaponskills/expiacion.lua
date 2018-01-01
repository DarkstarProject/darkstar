-----------------------------------
-- Expiacion
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Damage varies with TP. Tizona: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Blue Mage) quest.
-- Aligned with the Aqua Gorget, Snow Gorget & Soil Gorget.
-- Aligned with the Aqua Belt, Snow Belt & Soil Belt.
-- Element: None
-- Modifiers: STR:30% INT:30%
-- 100%TP    200%TP    300%TP
-- 1.50      2.00      2.50
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {};
    params.numHits = 2;
    params.ftp100 = 1.5; params.ftp200 = 2; params.ftp300 = 2.5;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.3; 
    params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 3.75; params.ftp200 = 10.25; params.ftp300 = 12.5;
        params.dex_wsc = 0.2;
    end

    -- Aftermath calculations from : https://www.bg-wiki.com/bg/Tizona_(Level_75)
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, tp, primary, action, taChar, params)
    if (damage > 0) then
        local aftermathParams = initAftermathParams();
        aftermathParams.power = player:getAftermathModPower(false)
        if (shouldApplyAftermath(player, aftermathParams.power, tp, AFTERMATH_MYTHIC)) then
            if (tp == 3000) then
                aftermathParams.type = EFFECT_AFTERMATH_LV3
                aftermathParams.subpower.type = MOD_DOUBLE_ATTACK
            elseif (tp >= 2000) then
                aftermathParams.type = EFFECT_AFTERMATH_LV2
                aftermathParams.subpower.type = MOD_ATT
            else
                aftermathParams.type = EFFECT_AFTERMATH_LV1
                aftermathParams.subpower.type = MOD_ACC
            end

            applyMythicAftermath(player, tp, aftermathParams)
        end
    end

    return tpHits, extraHits, criticalHit, damage
end
