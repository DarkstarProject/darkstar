------------------------
--    Myrkr     --
------------------------
require("scripts/globals/aftermath")
require("scripts/globals/status")
require("scripts/globals/weaponskills")

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    -- Apply aftermath
    dsp.aftermath.addStatusEffect(player, tp, dsp.slot.MAIN, dsp.aftermath.type.EMPYREAN)

    local ftpmp = fTP(tp, 0.2, 0.4, 0.6)
    return 1, 0, false, ftpmp * player:getMaxMP()
end