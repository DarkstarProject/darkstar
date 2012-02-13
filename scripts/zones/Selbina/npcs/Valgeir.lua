-----------------------------------
-- Area: Selbina
-- NPC: Valgeir
-- involved in his name is his name is valgier quest
-- involved in his name is expertise quest
-- involved in his name is the basics quest
-----------------------------------

--player:startEvent(0x0064);-- his name is valgier quest
--player:startEvent(0x0065); -- i have nothing to say to you
--player:startEvent(0x0066); -- cook something for me quest Expertise
--player:startEvent(0x0067); --found the ingredients quest Expertise
--player:startEvent(0x0068);--still not found ingredients quest Expertise
--player:startEvent(0x0069);-- done cooking quest Expertise
--player:startEvent(0x006a);-- involved in back to basics quest
--player:startEvent(0x006b); -- end back to basics quest ( i think)
--player:startEvent(0x008c);-- i am busy standar dialog

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (player:getQuestStatus(OTHER_AREAS,EXPERTISE)== QUEST_ACCEPTED) then
	count = trade:getItemCount();
	ScreamFungus  = trade:hasItemQty(4447,1);-- 4447 - scream_fungus 4400 - slice_of_land_crab_meat
	LandCrabMeat  = trade:hasItemQty(4400,1); 
    if (ScreamFungus   == true and LandCrabMeat  == true and count == 2) then 
		player:startEvent(0x0067); --found the ingredients quest Expertise
	end;
end;
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

if(false) then --debug
player:addItem(4447,1);
player:addItem(4400,1);
player:addKeyItem(92);

elseif (player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR)==QUEST_ACCEPTED and player:hasKeyItem(90)) then -- if quest accepted and has pizza
	player:startEvent(0x0064);-- his name is valgier quest
elseif(player:getQuestStatus(OTHER_AREAS,EXPERTISE)==QUEST_ACCEPTED and player:getVar("QUEST_EXPERTISE_STATE_var")~=3) then
	if(player:getVar("QUEST_EXPERTISE_STATE_var")==1) then --already asked	
		player:startEvent(0x0068);--still not found ingredients quest Expertise
	elseif(player:getVar("QUEST_EXPERTISE_STATE_var")==2) then --have to wait 24 hours
		Dayspassed=VanadielDayOfTheYear()-player:getVar("QuestExpertiseDayStarted_var");
		TotalHourLeft=24-(VanadielHour()+Dayspassed*24)+player:getVar("QuestExpertiseHourStarted_var");
		if(TotalHourLeft<0) then -- done waiting
			player:startEvent(0x0069);-- done cooking quest Expertise
		else -- have to wait more
			player:startEvent(0x008c);-- i am busy standar dialog
--			player:messageSpecial(GIL_OBTAINED,TotalHourLeft);
		end;
	else
		player:startEvent(0x0066,4447,4400); -- cook something for me quest Expertise  4447 - scream_fungus 4400 - slice_of_land_crab_meat
	end;
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_ACCEPTED and player:hasKeyItem(92)) then -- if quest accepted and has MHAURAN_COUSCOUS 
	player:startEvent(0x006a);-- involved in back to basics quest
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_COMPLETED and 	player:getVar("QuestTheBacisCommentary_var")==1) then 
	player:startEvent(0x006b); -- end commentary the basics quest 
else
	player:startEvent(0x008c);-- i am busy standar dialog	
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
if (csid==0x0064) then
	player:delKeyItem(90); --give pizza to valgier
elseif (csid==0x0066) then
	player:setVar("QUEST_EXPERTISE_STATE_var",1); --already asked	
elseif (csid==0x0067) then  -- found the ingredients
	--wait 24 hours
	player:tradeComplete();
	player:setVar("QUEST_EXPERTISE_STATE_var",2); --already asked
	player:setVar("QuestExpertiseHourStarted_var",VanadielHour());
	player:setVar("QuestExpertiseDayStarted_var",VanadielDayOfTheYear());	
elseif (csid==0x0069) then  -- done the cooking
	player:addKeyItem(91); --give pizza to player
	player:setVar("QUEST_EXPERTISE_STATE_var",3); --done cooking
	player:setVar("QuestExpertiseHourStarted_var",0);
	player:setVar("QuestExpertiseDayStarted_var",0);
elseif (csid==0x006a) then
	player:setVar("QuestTheBacisCommentary_var",1);
	player:delKeyItem(92); --give MHAURAN_COUSCOUS  to valgier	
	player:addItem(4436,1); --4436 - baked_popoto
elseif (csid==0x006b) then
	player:setVar("QuestTheBacisCommentary_var",0);	
end;
end;

