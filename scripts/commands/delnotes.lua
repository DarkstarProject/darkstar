---------------------------------------------------------------------------------------------------
-- func: @delnotes <amount> <player>
-- auth: Forgottenandlost
-- desc: Deletes the specified amount of Allied Notes from the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player, amount, target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "delnotes <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:delAlliedNotes(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:delAlliedNotes(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "delnotes <amount> <player>" );
		end
	end

end;