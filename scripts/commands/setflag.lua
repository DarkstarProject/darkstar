---------------------------------------------------------------------------------------------------
-- func: @setflag <flags> <target>
-- desc: set arbitrary flags for testing
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, flags, target)
    if (flags == nil) then
        player:PrintToPlayer("You must enter a number for the flags (hex values work)");
        player:PrintToPlayer( "@setflag <flags> <target>" );
        return;
    end

    if (target == nil) then
        player:setFlag( flags );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setFlag( flags );
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@setflag <flags> <target>" );
        end
    end
end;