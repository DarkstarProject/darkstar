---------------------------------------------------------------------------------------------------
-- func: @pos <x> <y> <z> <optional zone> <optional target>
-- desc: Sets the players position. If none is given, prints out the position instead.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        target = player:getName();
		player:PrintToPlayer( string.format( "No target found, here is your position!", target ) );
    end

    local targ = GetPlayerByName( target );
	
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        return
    end

    
    targ:showPosition();
end;