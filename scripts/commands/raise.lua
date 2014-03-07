-----------------------------------------------------------------------
-- [Command name]: @raise
-- [Author      ]: forgottenandlost
-- [Description ]: @raise <power> <player>
--           Sends raise menu to target player.
-----------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,power,target)

	if (power == nil) then
		power = 3;
	else
		if (power <1 or power >3) then
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
			player:PrintToPlayer( "You must enter a valid Player's Name." );
		end
	end
end;