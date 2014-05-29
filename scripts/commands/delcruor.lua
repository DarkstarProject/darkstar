---------------------------------------------------------------------------------------------------
-- func: @delcruor <amount> <player>
-- auth: Forgottenandlost
-- desc: Deletes the specified amount of Cruor from the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,amount,target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "delcruor <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:delCruor(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:delCruor(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "delcruor <amount> <player>" );
		end
	end

end;