-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Ghatsad
-- Standard Info NPC
-- Involved in quest: No String Attached
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local attachmentStatus = player:getVar("PUP_AttachmentStatus");
	local attachments = player:getVar("PUP_Attachments");
	if (attachmentStatus == 2) then
		if (trade:getSlotCount() == 4) then
			if (trade:getItemQty(661) == 1 and trade:getItemQty(2173) == 1 and trade:getItemQty(2290) == 1 and trade:getItemQty(16422) == 1) then
				player:tradeComplete();
				if (attachments == 0) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2185, 3);
				elseif (attachments == 1) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2186, 3);
				elseif (attachments == 2) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2187, 1);
				end
				player:setVar("PUP_AttachmentStatus", 5)
			end
		elseif (trade:getSlotCount() == 5) then
			if (trade:getItemQty(661) == 1 and trade:getItemQty(2173) == 1 and trade:getItemQty(2290) == 1 and trade:getItemQty(16422) == 1) then
				if (attachments == 0) then
					if (trade:getItemQty(2185) == 3) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 8)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				elseif (attachments == 1) then
					if (trade:getItemQty(2186) == 3) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 8)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				elseif (attachments == 2) then
					if (trade:getItemQty(2187) == 1) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 8)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				end
			end
		end
	elseif (attachmentStatus == 3) then
		if (trade:getSlotCount() == 4) then
			if (trade:getItemQty(718) == 1 and trade:getItemQty(2288) == 1 and trade:getItemQty(879) == 1 and trade:getItemQty(17221) == 1) then
				player:tradeComplete();
				if (attachments == 0) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2185, 3);
				elseif (attachments == 1) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2186, 3);
				elseif (attachments == 2) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2187, 1);
				end
				player:setVar("PUP_AttachmentStatus", 6)
			end
		elseif (trade:getSlotCount() == 5) then
			if (trade:getItemQty(718) == 1 and trade:getItemQty(2288) == 1 and trade:getItemQty(879) == 1 and trade:getItemQty(17221) == 1) then
				if (attachments == 0) then
					if (trade:getItemQty(2185) == 3) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 9)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				elseif (attachments == 1) then
					if (trade:getItemQty(2186) == 3) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 9)
						player:setVar("PUP_AttachmentReady",os.date("%j"));	
					end
				elseif (attachments == 2) then
					if (trade:getItemQty(2187) == 1) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 9)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				end
			end
		end
	elseif (attachmentStatus == 4) then
		if (trade:getSlotCount() == 4) then
			if (trade:getItemQty(823) == 1 and trade:getItemQty(828) == 1 and trade:getItemQty(2289) == 1 and trade:getItemQty(13465) == 1) then
				player:tradeComplete();
				if (attachments == 0) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2185, 3);
				elseif (attachments == 1) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2186, 3);
				elseif (attachments == 2) then
					player:startEvent(624, 0, 0, 0, 0, 0, 2187, 1);
				end
				player:setVar("PUP_AttachmentStatus", 7)
			end
		elseif (trade:getSlotCount() == 5) then
			if (trade:getItemQty(823) == 1 and trade:getItemQty(828) == 1 and trade:getItemQty(2289) == 1 and trade:getItemQty(13465) == 1) then
				if (attachments == 0) then
					if (trade:getItemQty(2185) == 3) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 10)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				elseif (attachments == 1) then
					if (trade:getItemQty(2186) == 3) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 10)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				elseif (attachments == 2) then
					if (trade:getItemQty(2187) == 1) then
						player:tradeComplete();
						player:startEvent(625);
						player:setVar("PUP_AttachmentStatus", 10)
						player:setVar("PUP_AttachmentReady",os.date("%j"));
					end
				end		
			end
		end
	elseif (attachmentStatus == 5) then
		if (attachments == 0) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2185) == 3) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 8)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		elseif (attachments == 1) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2186) == 3) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 8)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		elseif (attachments == 2) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2187) == 1) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 8)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		end
	elseif (attachmentStatus == 6) then
		if (attachments == 0) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2185) == 3) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 9)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		elseif (attachments == 1) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2186) == 3) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 9)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		elseif (attachments == 2) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2187) == 1) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 9)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		end
	elseif (attachmentStatus == 7) then
		if (attachments == 0) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2185) == 3) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 10)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		elseif (attachments == 1) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2186) == 3) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 10)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		elseif (attachments == 2) then
			if (trade:getSlotCount() == 1 and trade:getItemQty(2187) == 1) then
				player:tradeComplete();
				player:startEvent(625);
				player:setVar("PUP_AttachmentStatus", 10)
				player:setVar("PUP_AttachmentReady",os.date("%j"));
			end
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	--cs 620 - new frame - param 6: itemid payment param 7: number of payment param 8: bitpack choices (bit 0 no thanks, bit 1 VE, bit 2 SS, bit 3 SW)
	--cs 621 - new frame (if canceled previous)
	--cs 622 - bring me mats
	--cs 624 - all mats, just need payment
	--cs 625 - thanks, have everything, come back later
	--cs 626 - come back later
	--cs 627 - automaton frame done (param 2: frame)
	--cs 628 - you can customise automaton by changing frame 
	--cs 629 - you can alter automatons abilities and character by equipping attachments (what are these last 2 for?)
	--cs 900 - start soulsoother/spiritreaver
	--cs 901 - start second head
	--cs 902 - start work on chosen head
	--cs 903 - head almost done
	--cs 904 - give coffee
	--cs 905 - head complete
	
	local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
	local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");
	local Automaton = player:hasKeyItem(798);
	local automatonName = player:getAutomatonName();
	local CreationStarted_Day = player:getVar("CreationStarted_Day");
	local currentDay = VanadielDayOfTheYear();
	local CreationReady = ((CreationStarted_Day < currentDay) or (player:getVar("CreationStarted_Year") < VanadielYear()));
	local attachments = player:getVar("PUP_Attachments");
	local attachmentStatus = player:getVar("PUP_AttachmentStatus");
	local unlockedAttachments = player:getVar("PUP_AttachmentUnlock");
	local attachmentTime = player:getVar("PUP_AttachmentReady");
	local attachmentReady = (attachmentTime ~= 0 and attachmentTime ~= tonumber(os.date("%j")));

	--[[
		attachment status:
		0 - none
		1 - declined a new frame
		2 - accepted valoredge
		3 - accepted sharphot
		4 - accepted stormwaker
		5 - paid mats for valoredge
		6 - paid mats for sharpshot
		7 - paid mats for stormwaker
		8 - paid mats+coins for valoredge
		9 - paid mats+coins for sharpshot
		10 - paid mats+coins for stormwaker
	]]

	if (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 2) then
		player:startEvent(0x0106); -- he want you to go to Arrapago
	elseif (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 3) then
		player:startEvent(0x0107); -- reminder to go to Arrapago
	elseif (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 4 and Automaton == true) then
		player:startEvent(0x0108); -- you give the antique automaton to him and need to wait a gameday
	elseif (NoStringsAttached == QUEST_ACCEPTED and NoStringsAttachedProgress == 5 and CreationReady == true) then
		player:startEvent(0x0109); -- you go back for your automaton
	elseif (NoStringsAttached == QUEST_COMPLETED and attachments == 0 and attachmentStatus == 0 and player:getMainJob() == JOB_PUP and player:getMainLvl() >= 10) then
		player:startEventString(620, automatonName, automatonName, automatonName, automatonName, attachments, 0, 0, 0, 0, 2185, 3, unlockedAttachments);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachments == 0 and attachmentStatus == 1) then
		player:startEvent(621, 0, 0, 0, 0, 0, 2185, 3, unlockedAttachments);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachments == 1 and attachmentStatus == 0 and player:getMainJob() == JOB_PUP and player:getMainLvl() >= 20) then
		player:startEventString(620, automatonName, automatonName, automatonName, automatonName, attachments, 0, 0, 0, 0, 2186, 3, unlockedAttachments);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachments == 1 and attachmentStatus == 1) then
		player:startEvent(621, 0, 0, 0, 0, 0, 2186, 3, unlockedAttachments);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachments == 2 and attachmentStatus == 0 and player:getMainJob() == JOB_PUP and player:getMainLvl() >= 30) then
		player:startEventString(620, automatonName, automatonName, automatonName, automatonName, attachments, 0, 0, 0, 0, 2187, 1, unlockedAttachments);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachments == 2 and attachmentStatus == 1) then
		player:startEvent(621, 0, 0, 0, 0, 0, 2187, 1, unlockedAttachments);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus >= 8 and attachmentStatus <= 10 and attachmentReady == false) then
		player:startEvent(626);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus == 8 and attachmentReady == true) then
		player:startEventString(627, automatonName, automatonName, automatonName, automatonName, 0, 1);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus == 9 and attachmentReady == true) then
		player:startEventString(627, automatonName, automatonName, automatonName, automatonName, 0, 2);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus == 10 and attachmentReady == true) then
		player:startEventString(627, automatonName, automatonName, automatonName, automatonName, 0, 3);
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus == 2) then
		if (attachments == 0) then
			player:startEvent(622, 0, 1, 0, 0, 0, 2185, 3);
		elseif (attachments == 1) then
			player:startEvent(622, 0, 1, 0, 0, 0, 2186, 3);
		elseif (attachments == 2) then
			player:startEvent(622, 0, 1, 0, 0, 0, 2187, 1);
		end
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus == 3) then
		if (attachments == 0) then
			player:startEvent(622, 0, 2, 0, 0, 0, 2185, 3);
		elseif (attachments == 1) then
			player:startEvent(622, 0, 2, 0, 0, 0, 2186, 3);
		elseif (attachments == 2) then
			player:startEvent(622, 0, 2, 0, 0, 0, 2187, 1);
		end
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus == 4) then
		if (attachments == 0) then
			player:startEvent(622, 0, 3, 0, 0, 0, 2185, 3);
		elseif (attachments == 1) then
			player:startEvent(622, 0, 3, 0, 0, 0, 2186, 3);
		elseif (attachments == 2) then
			player:startEvent(622, 0, 3, 0, 0, 0, 2187, 1);
		end
	elseif (NoStringsAttached == QUEST_COMPLETED and attachmentStatus >= 5 and attachmentStatus <= 7) then
		if (attachments == 0) then
			player:startEvent(624, 0, 0, 0, 0, 0, 2185, 3);
		elseif (attachments == 1) then
			player:startEvent(624, 0, 0, 0, 0, 0, 2186, 3);
		elseif (attachments == 2) then
			player:startEvent(624, 0, 0, 0, 0, 0, 2187, 1);
		end
	elseif (attachments > 0) then
		local rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(628);
		else
			player:startEvent(629);
		end
	else
		player:startEvent(0x0100);
	end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0106) then
		player:setVar("NoStringsAttachedProgress",3);
	elseif (csid == 0x0108) then
		player:setVar("CreationStarted_Day",VanadielDayOfTheYear());
		player:setVar("CreationStarted_Year",VanadielYear());
		player:setVar("NoStringsAttachedProgress",5);
		player:delKeyItem(798);
	elseif (csid == 0x0109) then
		player:setVar("NoStringsAttachedProgress",6);
		player:setVar("CreationStarted_Day",0);
		player:setVar("CreationStarted_Year",0);
	elseif (csid == 620 or csid == 621) then
		player:setVar("PUP_AttachmentStatus", option+1);
	elseif (csid == 627) then
		local attachments = player:getVar("PUP_Attachments");
		local attachmentStatus = player:getVar("PUP_AttachmentStatus");
		local unlockedAttachments = player:getVar("PUP_AttachmentUnlock");
		if (attachmentStatus == 8) then
			player:unlockAttachment(8225);
			player:unlockAttachment(8194);
			player:setVar("PUP_AttachmentStatus", 0);
			player:setVar("PUP_Attachments", attachments+1);
			player:setVar("PUP_AttachmentUnlock", unlockedAttachments+2);
			player:setVar("PUP_AttachmentReady", 0);
		elseif (attachmentStatus == 9) then
			player:unlockAttachment(8226);
			player:unlockAttachment(8195);
			player:setVar("PUP_AttachmentStatus", 0);
			player:setVar("PUP_Attachments", attachments+1);
			player:setVar("PUP_AttachmentUnlock", unlockedAttachments+4);
			player:setVar("PUP_AttachmentReady", 0);
		elseif (attachmentStatus == 10) then
			player:unlockAttachment(8227);
			player:unlockAttachment(8196);
			player:setVar("PUP_AttachmentStatus", 0);
			player:setVar("PUP_Attachments", attachments+1);
			player:setVar("PUP_AttachmentUnlock", unlockedAttachments+8);
			player:setVar("PUP_AttachmentReady", 0);
		end
	end;
end;