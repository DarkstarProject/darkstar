---------------------------------------------------------------------------------------------------
-- func: @delfewell <amount> <FewellType> <player>
-- auth: Forgottenandlost
-- desc: Removes specified amount and type of Synergy Fewell from player
--       0 = Fire, 1 = Ice, 2 = Wind, 3 = Earth,
--       4 = Lightning, 5 = Water, 6 = Light, 7 = Dark
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "iis"
};

function onTrigger(player,amount,FewellType,target)

	if (amount == nil) then
		player:PrintToPlayer( "You must enter a valid point amount." );
		player:PrintToPlayer( "@delfewell <amount> <FewellType> <player>" );
		return;
	end

	if (FewellType == nil) then
		player:PrintToPlayer( "You must enter a valid Fewell Type." );
		player:PrintToPlayer( "@delfewell <amount> <FewellType> <player>" );
		player:PrintToPlayer( "FewellTypes: 0 = Fire, 1 = Ice, 2 = Wind, 3 = Earth..." );
		player:PrintToPlayer( "...4 = Lightning, 5 = Water, 6 = Light, 7 = Dark" );
		return;
	end

	if (target == nil) then
		player:delFewell(amount, FewellType);
	else
		local targ = GetPlayerByName(target);
		if (targ ~= nil) then
			targ:delFewell(amount, FewellType);
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
			player:PrintToPlayer( "@delfewell <amount> <FewellType> <player>" );
		end
	end
end;