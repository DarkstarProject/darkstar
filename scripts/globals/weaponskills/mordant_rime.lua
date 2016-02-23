-----------------------------------
-- Mordant Rime
-- Dagger weapon skill
-- Skill level: N/A
-- Description: Delivers a twofold attack that decreases target's movement speed. Chance of decreasing movement speed varies with TP. Carnwenhan: Aftermath effect varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt.
-- Element: None
-- Skillchain Properties: Fragmentation/Distortion
-- Modifiers: DEX:30% ; CHR:70%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 5.0        5.0        5.0
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 2;
    params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
    params.str_wsc = 0.0; params.dex_wsc = 0.3; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.5;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 5; params.ftp200 = 5; params.ftp300 = 5;
        params.chr_wsc = 0.7;
    end

    local chance = tp-100 > math.random()*150;
    if (damage > 0 and chance) and (target:hasStatusEffect(EFFECT_WEIGHT) == false) then
        target:addStatusEffect(EFFECT_WEIGHT, 50, 0, 60);
    end

        if ((player:getEquipID(SLOT_MAIN) == 19000) and (player:getMainJob() == JOB_BRD)) then
        if (damage > 0) then

--        AFTERMATH LV1

        if ((tp >= 100) and (tp <= 110)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 10, 0, 180, 0, 2);
    elseif ((tp >= 111) and (tp <= 120)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 11, 0, 180, 0, 2);
    elseif ((tp >= 121) and (tp <= 130)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 12, 0, 180, 0, 2);
    elseif ((tp >= 131) and (tp <= 140)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 13, 0, 180, 0, 2);
    elseif ((tp >= 141) and (tp <= 150)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 14, 0, 180, 0, 2);
    elseif ((tp >= 151) and (tp <= 160)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 15, 0, 180, 0, 2);
    elseif ((tp >= 161) and (tp <= 170)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 16, 0, 180, 0, 2);
    elseif ((tp >= 171) and (tp <= 180)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 17, 0, 180, 0, 2);
    elseif ((tp >= 181) and (tp <= 190)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 18, 0, 180, 0, 2);
    elseif ((tp >= 191) and (tp <= 199)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV1, 19, 0, 180, 0, 2);



--        AFTERMATH LV2

    elseif ((tp >= 200) and (tp <= 210)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 24, 0, 180, 0, 2);
    elseif ((tp >= 211) and (tp <= 219)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 28, 0, 180, 0, 2);
    elseif ((tp >= 221) and (tp <= 229)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 32, 0, 180, 0, 2);
    elseif ((tp >= 231) and (tp <= 239)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 36, 0, 180, 0, 2);
    elseif ((tp >= 241) and (tp <= 249)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 40, 0, 180, 0, 2);
    elseif ((tp >= 251) and (tp <= 259)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 44, 0, 180, 0, 2);
    elseif ((tp >= 261) and (tp <= 269)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 48, 0, 180, 0, 2);
    elseif ((tp >= 271) and (tp <= 279)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 52, 0, 180, 0, 2);
    elseif ((tp >= 281) and (tp <= 289)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 56, 0, 180, 0, 2);
    elseif ((tp >= 291) and (tp <= 299)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV2, 59, 0, 180, 0, 2);


--        AFTERMATH LV3

        elseif ((tp == 300)) then
            player:addStatusEffect(EFFECT_AFTERMATH_LV3, 45, 0, 120, 0, 1);

            end
        end
    end
    return tpHits, extraHits, criticalHit, damage;
end