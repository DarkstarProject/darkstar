---------------------------------------------------------------------------------------------------
-- func: @addnotes <amount> <player>
-- auth: Forgottenandlost
-- desc: Adds the specified amount of Allied Notes to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player, amount, target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "addnotes <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:addAlliedNotes(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:addAlliedNotes(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "addnotes <amount> <player>" );
		end
	end

end;