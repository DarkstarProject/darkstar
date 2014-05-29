---------------------------------------------------------------------------------------------------
-- func: @addcruor <amount> <player>
-- auth: Forgottenandlost
-- desc: Adds the specified amount of Cruor to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player, amount, target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "addcruor <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:addCruor(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:addCruor(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "addcruor <amount> <player>" );
		end
	end
end;