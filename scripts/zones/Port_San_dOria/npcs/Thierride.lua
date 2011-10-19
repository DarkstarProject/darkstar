-----------------------------------
-- Area: Port San d'Oria
-- NPC:  Thierride
-- Used in Quests: The Brugaire Consortium; Her Memories: Old Bean.
-- Starts Quests:  A Taste For Meat 
-- Not used cutscenes: 524  527  521  526  528  529  534  792  793  794
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
count = trade:getItemCount();
MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
PubParcel  = trade:hasItemQty(0x0253,1);

	if (MagicFlyer == true and count == 1) then
		FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
		if (FlyerForRegine == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	elseif (PubParcel == true and count == 1) then
		TheBrugaireConsortium = player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM);
		if (TheBrugaireConsortium == 1) then
			player:tradeComplete(); 
			player:startEvent(0x021b);
			player:setVar("TheBrugaireConsortium-Parcels", 31);	
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--player:startEvent();
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
end;




