---------------------------------------------------------------------------------------------------
-- func: @deltraverserstone <amount> <player>
-- auth: Forgottenandlost
-- desc: Deletes the specified amount of Traverser Stones from the player's stock
--       Players keyitems will not be not changed.
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,amount,target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "deltraverserstone <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:delTstone(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:delTstone(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "deltraverserstone <amount> <player>" );
		end
	end

end;