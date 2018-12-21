---------------------------------------------
--  Torrent
--  Description: Removes all Equipment
--  Type: Magical Enfeebling
--  Ignore Shadows, Single target
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    for i = dsp.slot.MAIN, dsp.slot.BACK do 
        target:unequipItem(i)
    end
    skill:setMsg(dsp.msg.basic.NONE)
    return 0
end
