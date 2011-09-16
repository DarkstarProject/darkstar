-----------------------------------
-- Area: Port Bastok
-- NPC: Yazan
-- Starts Quests: Bite the Dust (100%)
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
BatFang = trade:hasItemQty(1015,1);
BiteDust = player:getQuestStatus(BASTOK,BITE_THE_DUST);

	if (BiteDust >= 1 and BatFang == true and count == 1) then
		player:tradeComplete();
		player:startEvent(0x00c1);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

BiteDust = player:getQuestStatus(BASTOK,BITE_THE_DUST);
BiteDustVar = player:getVar("BiteTheDustVar");

	if (BiteDust == 0) then
		player:startEvent(0x00bf);
	elseif (BiteDust == 1 and BiteDustVar == 1) then
		player:startEvent(0x00c0);
	else
		player:startEvent(0x00be);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x00bf) then
		player:addQuest(BASTOK,BITE_THE_DUST);
		player:setVar("BiteTheDustVar",1);
	elseif (csid == 0x00c1) then
			BiteDustVar = player:getVar("BiteTheDustVar");
			if (BiteDustVar == 1) then
				player:completeQuest(BASTOK,BITE_THE_DUST);
				player:setTitle(108)
				player:setVar("BiteTheDustVar",2);
				player:addFame(BASTOK,BAS_FAME*120);
			else
				player:addFame(BASTOK,BAS_FAME*8);
			end
			player:addGil(GIL_RATE*350);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
	end
	
end;