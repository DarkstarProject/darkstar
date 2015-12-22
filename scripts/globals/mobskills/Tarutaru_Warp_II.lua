---------------------------------------------------
-- Tarutaru Warp II
-- End Ark Angel TT teleport
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local t = mob:getSpawnPos();
    local angle = math.random() * 2 * math.pi
    local pos = NearLocation(t, 18.0, angle);
    mob:teleport(pos, battletarget);
    skill:setMsg(0);
    return 0;
end;
