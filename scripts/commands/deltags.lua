---------------------------------------------------------------------------------------------------
-- func: @deltags <amount> <player>
-- auth: Forgottenandlost
-- desc: Deletes the specified amount of Imperial ID (assault) tags from the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,amount,target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "deltags <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:deltags(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:deltags(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "deltags <amount> <player>" );
		end
	end

end;