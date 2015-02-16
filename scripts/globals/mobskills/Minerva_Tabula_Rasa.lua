---------------------------------------------
--
-- Tabula Rasa (Minerva's custom version)
--
-- Grants a power bonus to regen and helix spells
-- Grants AoE effect to non AoE spells
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local regenbonus = 3 * math.floor((mob:getMainLvl() - 10) / 10);
    local helixbonus = math.floor(mob:getMainLvl() / 4);
    if (mob:getMainJob() ~= JOB_SCH) then
        regenbonus = regenbonus*0.5;
        helixbonus = helixbonus*0.5;
    end

    mob:addStatusEffect(EFFECT_TABULA_RASA,math.floor(helixbonus*1.5),0,180,0,math.floor(regenbonus*1.5));

    return EFFECT_TABULA_RASA;
end;