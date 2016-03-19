-------------------------------
-- Auth : Thief
-- Skill: Final Heaven
-- Class: H2H Weapon Skill
-- Level: MNK Relic Only
-- Mods : VIT:60%
-- 100%TP     200%TP     300%TP
-- 3.0x        3.0x    3.0x
-- Caestus/Spharai: Temporarily enhances Subtle Blow effect. * +10 Subtle Blow for a short duration after using the weapon skill. (Not implemented)
-------------------------------
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskills");
-------------------------------
function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    -- number of normal hits for ws
    params.numHits = 1;
    -- stat-modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
    params.str_wsc = 0.0;        params.dex_wsc = 0.0;
    params.vit_wsc = 0.6;        params.agi_wsc = 0.0;
    params.int_wsc = 0.0;        params.mnd_wsc = 0.0;
    params.chr_wsc = 0.0;
    -- ftp damage mods (for Damage Varies with TP; lines are calculated in the function params.ftp)
    params.ftp100 = 3.0; params.ftp200 = 3.0; params.ftp300 = 3.0;
    -- critical modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
    params.crit100 = 0.0; params.crit200=0.0; params.crit300=0.0;
    params.canCrit = false;
    -- accuracy modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc) Keep 0 if ws doesn't have accuracy modification.
    params.acc100 = 0.0; params.acc200=0.0; params.acc300=0.0;
    -- attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.vit_wsc = 0.8;
    end

    -- damage = damage * ftp(tp, ftp100, ftp200, ftp300);
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);
    -- TODO: Whoever codes those level 85 weapons with the latent that grants this WS needs to code a check to not give the aftermath effect.
    if (damage > 0) then
        local amDuration = 20 * math.floor(tp/1000);
        player:addStatusEffect(EFFECT_AFTERMATH, 10, 0, amDuration, 0, 1);
    end

    return tpHits, extraHits, criticalHit, damage;
end