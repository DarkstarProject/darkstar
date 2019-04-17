
require("scripts/globals/status")
require("scripts/globals/magic")
cmdprops =
{
    permission = 1,
    parameters = "s"
}


function onTrigger(player)
    local target = player:getCursorTarget()
    if(target == nil) then 
        target = player
    end

    player:PrintToPlayer(string.format("%s:\nINT = %s\nMagic Attack = %s\nMagic Damage = %s\n" ..
    "Magic Crit Hit Rate = %s\nMagic Crit Damage Increase = %s", 
    target:getName(), target:getStat(12), target:getMod(28), target:getMod(dsp.mod.MAGIC_DAMAGE), 
    target:getMod(dsp.mod.MAGIC_CRITHITRATE), target:getMod(dsp.mod.MAGIC_CRIT_DMG_INCREASE)))
end


