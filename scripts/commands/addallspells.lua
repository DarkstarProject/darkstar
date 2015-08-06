---------------------------------------------------------------------------------------------------
-- func: addallspells
-- desc: Adds all valid spells to the given target. If no target; then to the current player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:addAllSpells();
    else
        local targ = GetPlayerByName(target);
        if (targ == nil) then
            player:PrintToPlayer(string.format( "Player named '%s' not found!", target ));
        else
            targ:addAllSpells();
        end
    end
end