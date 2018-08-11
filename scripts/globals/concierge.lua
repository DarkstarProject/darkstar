-----------------------------------
--  NPC: Linkshell_Concierge Helper
-- Working 50%
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

dsp = dsp or {};
dsp.lsconciergetype = dsp.lsconciergetype or {};

------------------------------------
-- Concierge Types
------------------------------------

dsp.lsconciergetype =
{
    EVERYTHING = 0,
    ANYTHING   = 0,
    HARDCORE   = 1,
    CASUAL     = 2,
    HNM        = 3,
    NEWPLAYERS = 4,
    NEW        = 4,
    ASSIST     = 5,
    TRADING    = 6,
    SYNTHESIS  = 6,
    CRAFTING   = 6,
    NOTHING    = 7,
    NONE       = 7,
};


function LinkShellConciergeEventTrigger(player,npc,conciergeNumber,conciergeType)

	-- conciergeNumber should be 0, 1 or 2, used to select which NPC will be "talking" to you
	-- conciergeType defines what text the NPC displays and type it handles in
	-- 0 = Do everything
	-- 1 = Hard-Core battle content
	-- 2 = Casual battle content
	-- 3 = HNM Vanquishing
	-- 4 = Meet other new players
	-- 5 = Assist each other
	-- 6 = Trading (and synthesis)
	-- 7 = Nothing
	
	local myLinkShellID, myLinkShellType = player:getLinkShellID(0); -- get the Linkshell ID (and item type)
	if ((myLinkShellID) and (myLinkShellType > 1)) then
		-- prevent pearls from registering LS
		myLinkShellID = 0x0000 ;
		myLinkShellType = 2 ;
	end	
	
	if (LINKSHELL_CONCIERGE_SHARE == 1) then
		player:startEvent(6100 + conciergeNumber, dsp.lsconciergetype.EVERYTHING , player:getGil(), 0, 0, 0, 0, 0, myLinkShellID);
	else
		player:startEvent(6100 + conciergeNumber, conciergeType, player:getGil(), 0, 0, 0, 0, 0, myLinkShellID);
	end;
end;

function LinkShellConciergeEventUpdate(player,csid,option)
	
	-- local lsCmd = option % 0x00010000 ;
	-- local lsID = (option - lsCmd) / 0x00010000 ;
	return player:lsConciergeUpdate(csid,option,LINKSHELL_CONCIERGE_SHARE);
	
end;

function LinkShellConciergeEventFinish(player,csid,option)

	local lsCmd = option % 0x00000008 ;
	local lsOptions = (option - lsCmd) / 0x00000008 ;
	local myLinkShellID, myLinkShellType = player:getLinkShellID(0); -- get the Linkshell ID (and item type)

	if (option == 0x40000000) then
		-- do nothing (canceled/exit dialog normally) 
		return 0 ;
	elseif (lsCmd == 1) then
		-- option 1 when "selling" pearls (is always LinkShell #1 that is used)
		
		player:PrintToPlayer(string.format("LSCon-Finish: CSID is %u   Option is: %u -> Finished selling pearls - %u", csid,option,lsOptions), 4 );
		
		local vLang = 0 ; -- What we'll use for None/Other
		local vLangFlags = lsOptions % 0x20 ; -- J E _ _ O
		lsOptions = bit.rshift(lsOptions, 5);
	
		local vCount = (lsOptions % 0x10); -- pearl count
		lsOptions = bit.rshift(lsOptions, 4);
		
		local vDays = (lsOptions % 0x10); -- Everyday, weekends, weekdays, mon..sun
		lsOptions = bit.rshift(lsOptions, 4);
		
		local vTimeZone = lsOptions % 0x4 ; -- none, JP, US, EU
		lsOptions = bit.rshift(lsOptions, 2);
		
		local vTimeOfDay = lsOptions % 0x8 ; -- morning, afternoon, evening, night, dawn
		lsOptions = bit.rshift(lsOptions, 2);
		
		if (vLangFlags == 0x01) then
			vLang = 1 ;
			-- player:PrintToPlayer("LSCon-Finish: Japanese",4);
		elseif (vLangFlags == 0x02) then
			vLang = 2 ;
			-- player:PrintToPlayer("LSCon-Finish: English",4);
		elseif (vLangFlags == 0x10) then
			vLang = 0 ;
			-- player:PrintToPlayer("LSCon-Finish: Other Language",4);
		else
			vLang = 0 ;
			player:PrintToPlayer(string.format("LSCon-Finish: Unknown Language Flags Combination: %u", vLangFlags));
		end

		-- player:PrintToPlayer(string.format("LSCon-Finish: LanguageFlags %u", vLangFlags), 4 );
		-- player:PrintToPlayer(string.format("LSCon-Finish: Language %u", vLang), 4 );
		-- player:PrintToPlayer(string.format("LSCon-Finish: PearlCount %u", vCount), 4 );
		-- player:PrintToPlayer(string.format("LSCon-Finish: Days %u", vDays), 4 );
		-- player:PrintToPlayer(string.format("LSCon-Finish: TimeZone %u", vTimeZone), 4 );
		-- player:PrintToPlayer(string.format("LSCon-Finish: TimeOfDay %u", vTimeOfDay), 4 );
		
		if (myLinkShellID) then
			-- player:PrintToPlayer(string.format("LSCon-Finish: Linkshell registration not implemented yet -- CSID: %u -- option: %u", csid,option) ,4);
			local addResult = 0 ;
			-- addResult = 99 ; -- Already registered
			addResult = player:lsConciergeRegister(myLinkShellID, player:getEventTarget():getID(), vLang, vCount, vDays, vTimeZone, vTimeOfDay, LINKSHELL_CONCIERGE_SHARE);
			
			if (addResult == 1) then
				player:delGil(500); -- The 500 gil is hard-coded into the dialog, so making this variable doesn't make much sense, you still could change it however, but the client only checks for 500 on-hand
			end
			
			return addResult ;
		else
			-- normally the client won't allow you to select adding a listing if you are not a shell or sack holder
			-- so technically you shouldn't be able to get here without a LS in slot 1
			player:PrintToPlayer(string.format("LSCon-Finish: You must have a linkshell equipped in slot 1 to register"));
			return 0xFF ;
		end
		
		--player:PrintToPlayer(string.format("LSCon-Finish: Pearls: %u", vCount) ,4);
		--player:PrintToPlayer(string.format("LSCon-Finish: Active Days: %u", vDays) ,4);
		--player:PrintToPlayer(string.format("LSCon-Finish: TimeZone: %u", vTimeZone) ,4);
		--if (vTimeZone > 0) then
		--	player:PrintToPlayer(string.format("LSCon-Finish: TimeOfDay: %u", vTimeOfDay) ,4);
		--end
		--if (lsOptions > 0) then
		--	player:PrintToPlayer(string.format("LSCon-Finish: _restbits: %u", lsOptions) ,4);
		--end
		
	elseif (lsCmd == 2) then
		-- option 2 when a pearl is "bought"
		return 2 ;
		-- player:PrintToPlayer(string.format("LSCon-Finish: CSID is %u   Option is: %u -> Finished getting new pearl", csid,option) ,4);
	elseif (lsCmd == 3) then
		-- option 3 when current listing is canceled by owner
		-- player:PrintToPlayer(string.format("LSCon-Finish: CSID is %u   Option is: %u -> Finished canceling listed LinkShell (by owner)", csid,option) ,4);
		-- returns 3 on success, 0xFF on fails
		return player:lsConciergeCancel(myLinkShellID,player:getEventTarget():getID());
	else
		player:PrintToPlayer(string.format("LSCon-Finish: Unknown Data:  CSID is %u   Option is: %u ", csid,option) ,4);
	end
	
	return 0xFF ;
end;
