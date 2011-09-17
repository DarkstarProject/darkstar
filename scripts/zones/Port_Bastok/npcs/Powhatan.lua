-----------------------------------
-- Area: Port Bastok
-- NPC: Powhatan
-- Starts & Ends Quest: Welcome to Bastok
-- Starts & Ends Quest: Guest of Hauteur
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 WelcometoBastok = player:getQuestStatus(BASTOK,WELCOME_TO_BASTOK);
 GuestofHauteur = player:getQuestStatus(BASTOK,GUEST_OF_HAUTEUR);

	if (WelcometoBastok ~= 2 or GuestofHauteur ~= 2) then

		wtbStatus = player:getVar("WelcometoBastok_Event");
 		gohStatus = player:getVar("GuestofHauteur_Event");
		questKeyItem = player:hasKeyItem(LETTERS_FROM_DOMIEN);
		pFame = player:getFameLevel(BASTOK);		
		
		if (WelcometoBastok == 0) then
			player:startEvent(0x32);
		elseif (WelcometoBastok == 1 and wtbStatus == 0) then
			player:startEvent(0x33);
		elseif (WelcometoBastok == 1 and wtbStatus == 1) then
			player:startEvent(0x35);
		elseif (pFame >= 3 and GuestofHauteur == 0 and WelcometoBastok == 2) then
			player:startEvent(0x37);
		elseif (GuestofHauteur == 1 and gohStatus == 0) then
			player:startEvent(0x38);
		elseif (GuestofHauteur == 1 and gohStatus == 1 and questKeyItem == true) then
			player:startEvent(0x3a);
		else
			player:messageSpecial(POWHATAN_DIALOG_1);		
		end
	else
		player:messageSpecial(POWHATAN_DIALOG_1);
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

	if (csid == 0x32 and option == 0) then
		player:addQuest(BASTOK,WELCOME_TO_BASTOK);
	elseif (csid == 0x35) then
		player:completeQuest(BASTOK,WELCOME_TO_BASTOK);
		player:addFame(BASTOK,BAS_FAME*80);
		player:setTitle(BASTOK_WELCOMING_COMMITTEE);
		player:addItem(SPATHA);
		player:messageSpecial(ITEM_OBTAINED,SPATHA);
        player:setVar("WelcomeToBastok_Event",0);
    elseif (csid == 0x37 and option == 0) then
		player:addQuest(BASTOK,GUEST_OF_HAUTEUR);
	elseif (csid == 0x3a) then
		player:completeQuest(BASTOK,GUEST_OF_HAUTEUR);
		player:addFame(BASTOK,BAS_FAME*80);
		player:setTitle(BASTOK_WELCOMING_COMMITTEE);
		player:addItem(TARGE);
		player:messageSpecial(ITEM_OBTAINED,TARGE);
		player:delKeyItem(LETTERS_FROM_DOMIEN);
        player:setVar("GuestofHauteur_Event",0);
	end
end;
