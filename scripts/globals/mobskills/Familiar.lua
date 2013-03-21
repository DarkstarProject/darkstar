---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    -- if(mob:getHPP() <= 50 and mob:getPet() ~= nil) then
        -- return 0;
    -- end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    -- local pet = mob:getPet();

    -- pet:addHP();
    skill:setMsg(MSG_USES);

    return 0;
end;
