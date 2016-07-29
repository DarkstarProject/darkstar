---------------------------------------------------------------------------------------------------
-- func: setplayerlevel
-- desc: Sets the target players level.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, level)
    if (target == nil) then
        target = player:getName();
    end

    if (level == nil or level < 1 or level > 99) then
        player:PrintToPlayer("You must enter a valid level between 1 and 99.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setLevel( level );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end