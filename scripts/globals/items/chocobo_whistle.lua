-----------------------------------------
-- ID: 15533
-- Item: Chocobo Whistle
--
-- Notes: Can't use item below lv 20, no need to adjust duration for that.
--    Can't normally use enchantments when level sync'd below items level so no need to check.
--    Per wiki, can actually obtain without license, but cannot use, so we DO check that.
-----------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if not target:canUseMisc(dsp.zoneMisc.MOUNT) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    elseif not target:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) then
        return dsp.msg.basic.ITEM_UNABLE_TO_USE -- Todo: Verify/correct message, order of message priority.
    end
    return 0
end

function onItemUse(target)
    -- Base duration 30 min, in seconds.
    local duration = 1800 + (target:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

    target:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,0,0,duration,true)
end
