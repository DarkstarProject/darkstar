-----------------------------------
-- Area: Maze of Shakhrami
-- NPC: Strange Apparatus
-- @pos: 375 20 -259 198
-----------------------------------

package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;

require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/globals/strangeapparatus");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local trade = tradeToStrApp(player, trade);
	if (trade ~= nil) then

		if ( trade == 1) then -- good trade
		
			local drop    = player:getLocalVar("strAppDrop");
			local dropQty = player:getLocalVar("strAppDropQty");

			local docStatus = 0; -- Assistant
			if (hasStrAppDocStatus(player)) then
				docStatus = 1; -- Doctor
			end

			player:startEvent(0x0037, drop, dropQty, INFINITY_CORE, 0, 0, 0, docStatus, 0);
		else -- wrong chip, spawn elemental nm

			spawnElementalNM(player);
			delStrAppDocStatus(player);
			player:messageSpecial(SYS_OVERLOAD);
			player:messageSpecial(YOU_LOST_THE, trade);
		end
	else -- Invalid trade, lose doctor status
		delStrAppDocStatus(player);
		player:messageSpecial(DEVICE_NOT_WORKING);
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local docStatus = 0; -- Assistant
	if (hasStrAppDocStatus(player)) then
		docStatus = 1; -- Doctor
	else
		player:setLocalVar( "strAppPass", 1);
	end

	player:startEvent(0x0035, docStatus, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	player:setLocalVar( "strAppPass", 0); -- Player actually got to the password prompt, otherwise this would still be 1 in onEventFinish()
	if (csid == passwordCSID(player:getZoneID())) then
		local password = getStrAppPass(player,option);

		if ( password ~= nil) then

			if( password == strAppPass(player)) then -- Good password
				player:setLocalVar( "strAppPass", 2);
			else -- Bad password
				player:setLocalVar( "strAppPass", 0);
			end
		end
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	if (csid == 0x0035) then
		if (hasStrAppDocStatus(player) == false) then

			local strAppPass = player:getLocalVar("strAppPass");

			if (strAppPass == 2) then -- Player completed event and entered a valid password
				
				giveStrAppDocStatus(player);

				player:messageSpecial(REGISTRATION_COMPLETE);
				player:messageSpecial(DATA_RECORDED);
				player:messageSpecial(VOICE_HAS_GONE_SILENT);

			elseif (strAppPass ~= 1) then -- Player completed event and entered an invalid password
				
				player:messageSpecial(PASSWORD_ERROR);
				player:messageSpecial(VOICE_HAS_GONE_SILENT);
			end

			player:setLocalVar( "strAppPass", 0);
		end
	elseif (csid == 0x0037) then

		local drop    = player:getLocalVar("strAppDrop");
		local dropQty = player:getLocalVar("strAppDropQty");

		if (drop ~= 0) then

			if( dropQty == 0) then
				dropQty = 1;
			end

			player:addItem(drop, dropQty);

			player:setLocalVar("strAppDrop", 0);
			player:setLocalVar("strAppDropQty", 0);
		end
	end
end;