---------------------------------------------------------------------------------------------------
-- func: setpvp
-- auth: Lautan
-- desc: Sets a players pvp flag.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, value)
    if (target == nil or value == nil) then
        player:PrintToPlayer("You must enter a valid target name and value.");
        return;
    end
    
    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setPVPFlag( value );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end