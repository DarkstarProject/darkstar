-----------------------------------------------------------------------
-- func: raise
-- auth: Forgottenandlost
-- desc: @raise <power> <player>
-- Sends raise menu to GM or target player.
-----------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,power,target)

	if (power == nil or power >3) then
		power = 3;
	else
		if (power <1) then
			power = 1;
		end
	end
	
	if (target == nil) then
		player:sendRaise(power);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:sendRaise(power);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
		end
	end
end;