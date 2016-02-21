-----------------------------------
-- Pyrrhic Kleos
-- Dagger weapon skill
-- Skill level: N/A
-- Description: Delivers a fourfold attack that lowers target's evasion. Duration of effect varies with TP. Terpsichore: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Dancer) quest.
-- Aligned with the Soil Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Soil Belt, Aqua Belt & Snow Belt.
-- Element: Unknown
-- Skillchain Properties: Distortion/Scission
-- Modifiers: STR:40% ; DEX:40%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 1.5        1.5        1.5
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 4;
    params.ftp100 = 1.5; params.ftp200 = 1.5; params.ftp300 = 1.5;
    params.str_wsc = 0.2; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4; params.dex_wsc = 0.4;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    if (damage > 0) then
        local duration = (tp/100 * 60);
        if (target:hasStatusEffect(EFFECT_EVASION_DOWN) == false) then
            target:addStatusEffect(EFFECT_EVASION_DOWN, 10, 0, duration);
        end
    end


    if ((player:getEquipID(SLOT_MAIN) == 18989) and (player:getMainJob() == JOB_DNC)) then
        if (damage > 0) then

--        AFTERMATH LV1

        if ((tp >= 100) and (tp <= 110)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 10, 0, 180, 0, 1);
    elseif ((tp >= 111) and (tp <= 120)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 11, 0, 180, 0, 1);
    elseif ((tp >= 121) and (tp <= 130)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 12, 0, 180, 0, 1);
    elseif ((tp >= 131) and (tp <= 140)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 13, 0, 180, 0, 1);
    elseif ((tp >= 141) and (tp <= 150)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 14, 0, 180, 0, 1);
    elseif ((tp >= 151) and (tp <= 160)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 15, 0, 180, 0, 1);
    elseif ((tp >= 161) and (tp <= 170)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 16, 0, 180, 0, 1);
    elseif ((tp >= 171) and (tp <= 180)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 17, 0, 180, 0, 1);
    elseif ((tp >= 181) and (tp <= 190)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 18, 0, 180, 0, 1);
    elseif ((tp >= 191) and (tp <= 199)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 19, 0, 180, 0, 1);



--        AFTERMATH LV2

    elseif ((tp >= 200) and (tp <= 210)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 24, 0, 180, 0, 1);
    elseif ((tp >= 211) and (tp <= 219)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 28, 0, 180, 0, 1);
    elseif ((tp >= 221) and (tp <= 229)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 32, 0, 180, 0, 1);
    elseif ((tp >= 231) and (tp <= 239)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 36, 0, 180, 0, 1);
    elseif ((tp >= 241) and (tp <= 249)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 40, 0, 180, 0, 1);
    elseif ((tp >= 251) and (tp <= 259)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 44, 0, 180, 0, 1);
    elseif ((tp >= 261) and (tp <= 269)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 48, 0, 180, 0, 1);
    elseif ((tp >= 271) and (tp <= 279)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 52, 0, 180, 0, 1);
    elseif ((tp >= 281) and (tp <= 289)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 56, 0, 180, 0, 1);
    elseif ((tp >= 291) and (tp <= 299)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 59, 0, 180, 0, 1);


--        AFTERMATH LV3

        elseif ((tp == 300)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV3, 45, 0, 120, 0, 1);

            end
        end
    end
    return tpHits, extraHits, criticalHit, damage;

end