-----------------------------------
-- Area:  Temple of Uggalepih
-- NPC:   Stone Picture Frame
-- Notes: Opens door to Den of Rancor using Painbrush of Souls
-- @pos -52.239 -2.089 10.000 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local X = player:getXPos();
	local Z = player:getZPos();
	local DoorToRancor = 17428989;

	if(X < -60) then
		if(Z < -6) then -- SW frame
			if(player:hasKeyItem(FINAL_FANTASY)) then
				player:startEvent(0x0032,FINAL_FANTASY);
			else
				player:messageSpecial(PAINTBRUSH_OFFSET + 31); -- This is a frame for a painting.
			end
		elseif(Z < 5)  then
			player:messageSpecial(PAINTBRUSH_OFFSET + 14); -- It is a picture of an old mage carrying a staff.
		else
			player:messageSpecial(PAINTBRUSH_OFFSET + 13); -- It is a picture of a small group of three men and women.
		end
	else
		if(Z <-5) then -- SE picture
			player:messageSpecial(PAINTBRUSH_OFFSET + 12); -- It is a painting of a beautiful landscape.
		elseif(Z > -5 and Z < 5) then
			if(GetNPCByID(DoorToRancor):getAnimation() == 8) then
				player:messageSpecial(PAINTBRUSH_OFFSET + 23,PAINTBRUSH_OF_SOULS); -- The <KEY_ITEM> begins to twitch. The canvas is graced with the image from your soul.
			elseif(player:hasKeyItem(PAINTBRUSH_OF_SOULS) and X >= -53.2 and Z <= 0.1 and Z >= -0.1) then -- has paintbrush of souls + close enough
				player:messageSpecial(PAINTBRUSH_OFFSET + 17,PAINTBRUSH_OF_SOULS);
				player:setVar("started_painting",os.time());
				player:startEvent(0x003C,PAINTBRUSH_OF_SOULS);
			elseif(player:hasKeyItem(PAINTBRUSH_OF_SOULS)) then
				player:messageSpecial(PAINTBRUSH_OFFSET + 15,PAINTBRUSH_OF_SOULS);
			else
				player:messageSpecial(PAINTBRUSH_OFFSET, PAINTBRUSH_OF_SOULS); -- When the paintbrush of souls projects the deepest, darkest corner of your soul...
			end
		else
			player:messageSpecial(PAINTBRUSH_OFFSET + 11); -- It is a painting of a sublime-looking woman.
		end
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	local DoorToRancor = 17428989;

	if(csid == 0x0032) then
		-- Soon !
	elseif(csid == 0x003C) then
		time_elapsed = os.time() - player:getVar("started_painting");
		if(time_elapsed >= 30) then
			player:messageSpecial(PAINTBRUSH_OFFSET + 22); -- You succeeded in projecting the image in your soul to the blank canvas. The door to the Rancor Den has opened!<Prompt>
			GetNPCByID(DoorToRancor):openDoor(45); -- Open the door to Den of Rancor for 45 sec
		else
			player:messageSpecial(PAINTBRUSH_OFFSET + 21); -- You were unable to fill the canvas with an image from your soul.
		end
		player:setVar("started_painting",0);
	end

end;