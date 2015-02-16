---------------------------------------------------------------------------------------------------
-- func: @setassistant <player>
-- auth: TeoTwawki
-- desc: give or take Assistant flag on target player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)

	if (target == nil) then
		player:PrintToPlayer( "Must specify player to promote/demote to assistant!" );
		player:PrintToPlayer( "@setassistant <player>" );
		return
	end

	local targ = GetPlayerByName(target);

	if (targ ~= nil) then
		if (targ:getVar("AssistantGM") == 1) then
			targ:setVar("AssistantGM",0);
			player:PrintToPlayer( string.format( " '%s' has been stripped of Community Assistant status", target ) );
			-- Attempt to strip related nameflags...
			if (targ:checkNameFlags(0x02000000)) then
				targ:setFlag(0x02000000);
			end
			if (targ:checkNameFlags(0x00002000)) then
				targ:setFlag(0x00002000);
			end
		else
			targ:setVar("AssistantGM",1);
			-- Check for and set normal GM flags to off, just in case.
			-- This is copypasta from @togglegm so I certainly hope it works this way.
			if (targ:checkNameFlags(0x04000000)) then
				if (targ:checkNameFlags(0x04000000)) then
					targ:setFlag(0x04000000);
				end
				if (targ:checkNameFlags(0x05000000)) then
					targ:setFlag(0x05000000);
				end
				if (targ:checkNameFlags(0x02000000)) then
					targ:setFlag(0x02000000);
				end
			end
			-- And now setting our intended icon and name color.
			targ:setFlag( 0x02002000 );
			player:PrintToPlayer( string.format( " '%s' is now a Community Assistant", target ) );
			targ:PrintToPlayer("You have been granted Community Assistant status.");
		end
	else
		player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
		player:PrintToPlayer( "@setassistant <player>" );
	end

end;