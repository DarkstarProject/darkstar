-----------------------------------
-- Spirits Within
-- Sword weapon skill
-- Spirits Within Sword Weapon Skill
-- TrolandAdded by Troland
-- Skill Level: 175
-- Delivers an unavoidable attack. Damage varies with HP and TP.
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.
-- Element: None
-- Modifiers: HP:
-- 100%TP    200%TP    300%TP
-- 12.5%       50%      100%
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/utils");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)
    local HP = player:getHP();
    local TP = player:getTP();
    local WSC = 0;
    if (TP == 300) then
        WSC = HP * 0.46875;
    elseif (TP >= 200) then
        WSC = HP * ((TP - 200) / (100 / (0.46875 - 0.1875)));
    elseif (TP >= 100) then
        WSC = HP * ((TP - 100) / (100 / (0.1875 - 0.125)));
    end

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        -- Damage calculations changed based on: http://www.bg-wiki.com/bg/Spirits_Within http://www.bluegartr.com/threads/121610-Rehauled-Weapon-Skills-tier-lists?p=6142188&viewfull=1#post6142188
        if (TP == 300) then
        WSC = HP;
        elseif (TP >= 200) then
        WSC = HP * .5
        elseif (TP >= 100) then
        WSC = HP * .125;
        end
    end

    local damage = target:breathDmgTaken(WSC);
    damage = damage * WEAPON_SKILL_POWER
    return 1, 0, false, damage;

end
