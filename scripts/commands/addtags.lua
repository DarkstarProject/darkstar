---------------------------------------------------------------------------------------------------
-- func: @addtags <amount> <player>
-- auth: Forgottenandlost
-- desc: Adds the specified amount of Imperial ID (assault) tags to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player, amount, target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "addtags <amount> <player>" );
		return;
	end

	if (target == nil) then
		player:addTags(amount);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:addTags(amount);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "addtags <amount> <player>" );
		end
	end
end;