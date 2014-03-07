---------------------------------------------------------------------------------------------------
-- func: @kill
-- auth: Forgottenandlost
-- desc: Murders targeted player
--  Sometimes GM jail just isn't enough.
--  TODO: add exp loss amount parameter (default to zero)
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 4,
	parameters = "s"
};

function onTrigger(player, victim)

	if (victim == nil) then
		player:PrintToPlayer( string.format( "Victim named '%s' not found!", victim ) );
		player:PrintToPlayer( "kill <victim>" );
	else
		local targ = GetPlayerByName(victim);
		if (targ ~= nil) then
			targ:setHP(0);
		else
			player:PrintToPlayer( string.format( "Victim named '%s' not found!", victim ) );
		end
	end
end