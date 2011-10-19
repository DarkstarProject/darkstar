-----------------------------------
--	Area: Port San d'Oria
--	NPC:  Fontoumant
--	Starts the quest "The Brugaire Consortium"
--	Involved inf Riding on the Clouds
--	0x0231  0x0230  0x0219  0x022e  0x0260  0x0261  0x0262
--	Working ?% 
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

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

TheBrugaireConsortium = player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM);

	if (TheBrugaireConsortium == 0) then
		player:startEvent(0x01fd);
	elseif (TheBrugaireConsortium == 1) then
	
		questState = player:getVar("TheBrugaireConsortium-Parcels");
		
		if (questState == 11) then
			player:startEvent(0x01ff);
		elseif (questState == 21) then
			player:startEvent(0x0200);
		elseif (questState == 31) then
			player:startEvent(0x0203);
		end
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

	if (csid == 0x01fd and option == 0) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x0251);
			player:messageSpecial(ITEM_OBTAINED,0x0251);
			player:addQuest(SANDORIA,THE_BRUGAIRE_CONSORTIUM)
			player:setVar("TheBrugaireConsortium-Parcels",10)
		else
			player:startEvent(0x0219);
		end
	elseif (csid == 0x01ff) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x0252);
			player:messageSpecial(ITEM_OBTAINED,0x0252);
			player:setVar("TheBrugaireConsortium-Parcels",20);
		else
			player:startEvent(0x0219);
		end
	elseif (csid == 0x0200) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x0253);
			player:messageSpecial(ITEM_OBTAINED,0x0253);
			player:setVar("TheBrugaireConsortium-Parcels",30);
		else
			player:startEvent(0x0219);
		end
	elseif (csid == 0x0203) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x3001);
			player:messageSpecial(ITEM_OBTAINED,0x3001);
			player:setTitle(COURIER_EXTRAORDINAIRE);
			player:completeQuest(SANDORIA,THE_BRUGAIRE_CONSORTIUM);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:setVar("TheBrugaireConsortium-Parcels",0);
		else
			player:startEvent(0x0219);
		end
	end

end;




