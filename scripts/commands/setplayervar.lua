---------------------------------------------------------------------------------------------------
-- func: setplayervar
-- auth: Link
-- desc: Sets a variable on the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ssi"
};

function onTrigger(player, target, variable, value)
    if (target == nil or variable == nil) then
        player:PrintToPlayer("You must enter a valid target name and variable name.");
        return;
    end
    
    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setVar(variable, value);
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end

end