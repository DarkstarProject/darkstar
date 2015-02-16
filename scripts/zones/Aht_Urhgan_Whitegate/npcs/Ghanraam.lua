-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Ghanraam
--  Type: "Nyzul Weapon/Salvage Armor Storer,"
--  @pos 108.773 -6.999 -51.297 50
-----------------------------------
-----------------------------------
-- Unknown:
-- how to confirm that you want an item returned and trigger the message  "Ghanraam reluctantly returns the {item} to you."
-- how to handle the case when player wants to change the set but has items stored.
----------------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/globals/settings");

--[[ events
0x32E introduction to Salvage armor quest
0x37D introduction to Nyzul relics
0x32F standard menu
0x330 nothing-  one of the currently unsupported Aht Urhgan events?? This should be the trade event.
0x33A "Your armor is being crafted as we speak. Such magnificence takes time."
0x33B "Here is your completed armor. Such masterful work..."
--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	status = player:getVar("GHANRAAM_STATUS");
	set = player:getVar("SALVAGE_SET"); -- which salvage set the player has chosen. 0 = ares, 1 = skadi, 2 = usukane, 3 = marduk, 4 = morrigan, 5=nothing.
	if (status == 0) then
		player:startEvent(0x032E);
	else
		player:startEvent(0x032F);
	end;
end;

function onEventSelection(player,csid,option)
	print("-->",csid, option);
	currentset = player:getVar("SALVAGE_SET");
	if (option == 1) or (option == 3) or (option == 5) or (option == 7) or (option == 9) then -- player wants to change set.
		--param 1: number of the set you had already decided on if param2 is set to 2 or higher. (0-based)
		--param2 = 0 he accepts your choice
		--param2 = setnumber+1 = "that is the set you have already chosen"
		--param2 = 6 triggers the dialog "I believe you already have this armor on your person."
		--param2 = apparently, any other value triggers "I believe you had already decided on..". Using 7 here.
		-- missing: which params make him refuse your request to change a set on the grounds that you already have stored items?
		newset = (option-1)/2;
		if (currentset == 5) then
			player:updateEvent(0,0);
		elseif (currentset == newset) then
			player:updateEvent(newset, newset + 1);
		else
			player:updateEvent(currentset, 11);
		end;
	elseif (option == 2) or (option == 4) or (option == 6) or (option == 8) or (option == 10) then -- player has confirmed set change
		player:updateEvent(0,0,0,0,0,0,0,0); -- without this event update, the event will just revert back to the menu.
	elseif (option == 11) then -- player is asking for armor back
		-- param 1: a bitmask for the first page of items. (contains 8 items, head )
		---  1: level 15 head,   2: level 25 head,  4: level 35 head,
		---  8: level 15 body,  16: level 25 body, 32: level 35 body
		--- 64: level 15 hands,128: level 25 hands 256: switches off "next option"
		-- param 2: a bitmask for the second page of items. (contains 7 items). Next highest bit switches of the "previous" option
		-- param 3: gear set. 1 = ares, 2 = skadi, 3 = usukane, 4 = marduk, 5 = morrigan.
		-- param 4: a flag that says that there are item stored in the gallery. > 0 seems to suffice.
		player:updateEvent(255,127,currentset + 1,1);
		--print("looking at armor to be returned");
	elseif (option >= 12) and (option <= 26) then -- player has confirmed he wants armor back.
		--print("player has decided to ask for armor back.");

		--this update should activate the text "Ghanraam reluctantly returns the {item} to you." but I could find no
		-- parameters that triggered this.

		player:updateEvent(0,0,0,0,0,0,0,0); -- this doesn't work
	elseif (option == 27) then -- player is asking for weapon back
		player:updateEvent(255,255,15,1); -- first 3 params appear to be bitmasks (8 weapons at a time.) Next highest unused bit switches off next and previous options.
	end;
end;


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
print("CSID:",csid);
print("RESULT:",option);
	if (csid == 0x32E) then
		player:setVar("GHANRAAM_STATUS",1);
		player:setVar("SALVAGE_SET", 5); -- no set chosen yet.
	elseif (csid == 0x32F) then
		if (option == 1) or (option == 3) or (option == 5) or (option == 7) or (option == 9) then -- player has chosen a set.
			player:setVar("SALVAGE_SET", (option-1)/2 ); --1: ares, 3: skadi, 5: usukane, 7: marduk, 9: morrigan.
		elseif (option == 2) or (option == 4) or (option == 6) or (option == 8) or (option == 10) then -- player has changed set to
			player:setVar("SALVAGE_SET", (option-2)/2 ); -- 2: ares, 4: skadi, 6: usukane, 8: marduk, 10: morrigan.
		end;
	end;
end;
