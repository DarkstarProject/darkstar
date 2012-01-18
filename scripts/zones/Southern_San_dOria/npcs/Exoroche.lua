-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Exoroche
-- Involved in Quests: Father and Son, A Boy's Dream
-- @zone 230
-- @pos 72 -1 60
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

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
	
	-- "Father and Son" Event Dialogs
	if(player:getQuestStatus(SANDORIA,FATHER_AND_SON) == QUEST_ACCEPTED) then
		player:startEvent(0x021e);
	elseif(player:getVar("aBoysDreamCS") == 2) then 
		player:startEvent(0x0032);
	elseif(player:getVar("aBoysDreamCS") >= 7) then 
		player:startEvent(0x0020);
	else
		player:startEvent(0x004c);
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
	if(csid == 0x021e) then
		player:setVar("QuestfatherAndSonVar",1);
	elseif(csid == 0x0032) then
		player:setVar("aBoysDreamCS",3);
	elseif(csid == 0x0020 and player:getVar("aBoysDreamCS") == 7) then
		player:setVar("aBoysDreamCS",8);
	end
end;