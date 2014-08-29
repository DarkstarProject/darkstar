---------------------------------------------------------------------------------------------------
-- func: @addtraverserstone <amount> <player>
-- auth: Forgottenandlost
-- desc: Adds the specified amount of Traverser Stones to the player's stock
--       Players keyitems will not be not changed.
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player, amount, target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "addtraverserstone <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:addTstone(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:addTstone(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "addtraverserstone <amount> <player>" );
		end
	end
end