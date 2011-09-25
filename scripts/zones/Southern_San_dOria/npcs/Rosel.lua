-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Rosel
--  Starts Quest: Rosel The Armorer
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	
	-- "Rosel the Armorer" quest status var
	RoselTheArmorer = player:getQuestStatus(SANDORIA,ROSEL_THE_ARMORER);
	-- var to skip the Rosel the Armorer CS if player already talked and refuse to help him the first time
	skipRoselTheArmorerCS = player:getVar("RefuseRoselTheArmorerQuest");
	
	-- Rosel the Armorer eventId selection
	if ( skipRoselTheArmorerCS == 1 and RoselTheArmorer == 0) then
		player:startEvent(0x020c);
	elseif (RoselTheArmorer == 0) then
		player:startEvent(0x020b);
	elseif(RoselTheArmorer == 1 and player:hasKeyItem(119)) then
		player:startEvent(0x020c);
	elseif (RoselTheArmorer == 1 and player:hasKeyItem(119) == false) then
		player:addGil(200);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:setTitle(ENTRANCE_DENIED);
		player:completeQuest(SANDORIA,ROSEL_THE_ARMORER);
		player:startEvent(0x020f);
		player:setVar("RefuseRoselTheArmorerQuest",0);
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

	-- Rosel the Armorer, get quest and receipt for prince
	if (csid == 0x020b and option == 0) then
		player:addKeyItem(119);
		player:messageSpecial(6406,119); -- KEYITEM_OBTAINED MSG
		player:addQuest(SANDORIA, ROSEL_THE_ARMORER);
	else 
		player:setVar("RefuseRoselTheArmorerQuest",1); -- used to skip CS if already seen, but declined quest.
	end;
	
	-- Rosel the Armorer, if player refused quest on opening CS with rosel, they can still get it here.
	if (csid == 0x020c and option == 0) then
		player:addKeyItem(119);
		player:messageSpecial(6406,119); -- KEYITEM_OBTAINED MSG
		player:addQuest(SANDORIA, ROSEL_THE_ARMORER);
	end;
	
	-- Rosel the Armorer, finished quest, recieve 200gil
	if (csid == 0x020f) then
		player:messageSpecial(6404, 200); -- GIL_OBTAINED MSG
	end;
end;