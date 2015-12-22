---------------------------------------------------
-- Eald2 Warp Out
-- End Eald'Narche ZM16 (phase 2) teleport
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local battletarget = mob:getTarget();
    local t = battletarget:getPos();
    t.rot = battletarget:getRotPos();
    local angle = math.random() * math.pi
    local pos = NearLocation(t, 1.5, angle);
    mob:teleport(pos, battletarget);
    skill:setMsg(0);
    return 0;
end;
