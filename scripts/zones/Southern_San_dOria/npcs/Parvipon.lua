-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Parvipon
--	The Merchant's Bidding
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)

count = trade:getItemCount();
RabbitHide = trade:hasItemQty(856,3);
	
	if (RabbitHide == true and count == 3) then
		TheMerchantsBidding = player:getQuestStatus(SANDORIA,THE_MERCHANT_S_BIDDING);
		if (TheMerchantsBidding ~= 0) then 
			player:tradeComplete();
			player:addGil(GIL_RATE*120);
			player:addFame(SANDORIA,SAN_FAME*15);
			player:completeQuest(SANDORIA,THE_MERCHANT_S_BIDDING);
			player:startEvent(0x59);
		end
	end
-- "Flyers for Regine" conditional script
count = trade:getItemCount();
MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);

	if (MagicFlyer == true and count == 1) then
		FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
		if (FlyerForRegine == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

TheMerchantsBidding = player:getQuestStatus(SANDORIA,THE_MERCHANT_S_BIDDING);

	if (TheMerchantsBidding == 0) then
		player:startEvent(0x5A);
	else
		player:startEvent(0x58);
	end

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
	if ((csid == 0x5A) and (option == 1)) then
		player:addQuest(SANDORIA,THE_MERCHANT_S_BIDDING);
	elseif (csid == 0x59) then
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*120);
	end
end;