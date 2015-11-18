-----------------------------------
--  Area: Mhaura
--  NPC:  Kotan-Purutan
--  Involved in Quest: Overnight Delivery
--  @pos 40.323 -8.999 44.242 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local OvernightDelivery = player:getQuestStatus(WINDURST,OVERNIGHT_DELIVERY);
	local KenapaOvernight = player:getVar("Kenapa_Overnight_var"); -- Variable to track progress for Overnight Delivery
	local KenapaOvernightDay = player:getVar("Kenapa_Overnight_Day_var"); -- Variable to track the day the quest is started.
	local KenapaOvernightHour = player:getVar("Kenapa_Overnight_Hour_var"); -- Variable to track the hour the quest is started.
	local HourOfTheDay = VanadielHour();

	if (OvernightDelivery == QUEST_ACCEPTED and player:hasKeyItem(SMALL_BAG) == false and (KenapaOvernight >= 4 and KenapaOvernight <= 7) and (HourOfTheDay < 6 or HourOfTheDay >= 18)) then
		player:startEvent(0x008d); -- Gives Key Item at correct times of night
	elseif (OvernightDelivery == QUEST_ACCEPTED and player:hasKeyItem(SMALL_BAG) == false and (KenapaOvernight >= 4 and KenapaOvernight <= 7) and (HourOfTheDay >= 6 or HourOfTheDay < 18)) then
		player:startEvent(0x0090); -- Only at night
	elseif (player:hasKeyItem(SMALL_BAG) == true) then
		player:startEvent(0x008e);  -- Reminder Dialogue
	elseif (OvernightDelivery == QUEST_COMPLETED) then
		player:startEvent(0x008f); -- Post quest
	else
		player:startEvent(0x008c); -- Standard
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
	if (csid == 0x008d) then
		player:addKeyItem(SMALL_BAG);
		player:setVar("Kenapa_Overnight_Day_var",VanadielDayOfTheYear());
		player:setVar("Kenapa_Overnight_Hour_var",VanadielHour());
		player:messageSpecial(KEYITEM_OBTAINED,SMALL_BAG);
	end
end;

