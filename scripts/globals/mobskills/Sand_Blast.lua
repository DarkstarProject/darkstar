---------------------------------------------------
-- Sand Blast
-- Deals Earth damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 8' cone
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getPool() == 1318) then -- Feeler Anltion
        if (mob:getLocalVar("SAND_BLAST") == 1 and math.random(1,99) > 80) then
            return 0; -- spawn more antlions
        else
            return 1; -- don't more antlions
        end
    end;

    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120));

    if (mob:getPool() == 1318) then -- Feeler Anltion
        mob:setLocalVar("SAND_BLAST",0); -- Used it for the last time!
        if (GetMobAction(mob:getID()+6) == 0) then -- Alastor Antlion
            local alastorAntlion = GetMobByID(mob:getID()+6);
            alastorAntlion:setSpawn(mob:getXPos()+1, mob:getYPos()+1, mob:getZPos()+1); -- Set its spawn location.
            SpawnMob(mob:getID()+6):updateEnmity(target);
        end
    end

    return typeEffect;
end;