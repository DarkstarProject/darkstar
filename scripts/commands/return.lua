---------------------------------------------------------------------------------------------------
-- func: return
-- auth: Forgottenandlost
-- desc: @return <player>
--  Warps GM or target player to their previous zone
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "s"
};

function onTrigger(player, target)
	local ZoneID = 0

	if (target == nil) then
		target = player:getName();
	end

	local targ = GetPlayerByName( target );
	if (targ ~= nil) then
		ZoneID = targ:getPreviousZone();
		if (ZoneID == 0 or == nil) then
			player:PrintToPlayer( "Previous ZoneID was a MogHouse or there was a problem fetching the ID.");
		else
		targ:setPos( 0, 0, 0, 0, ZoneID );
		end
	else
		player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
	end
end