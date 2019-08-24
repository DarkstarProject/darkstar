-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit,
--                            Lure of the Wildcat (San d'Oria), Old Wounds
-- !pos 27 0.1 0.1 233
-----------------------------------
local ID = require("scripts/zones/Chateau_dOraguille/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/wsquest")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

local wsQuest = dsp.wsquest.savage_blade

function onTrade(player,npc,trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest,player,trade)

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    end

end

function onTrigger(player,npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest,player)
    local mLvL = player:getMainLvl()
    local mJob = player:getMainJob()
    local theGeneralSecret = player:getQuestStatus(SANDORIA,THE_GENERAL_S_SECRET)
    local envelopedInDarkness = player:getQuestStatus(SANDORIA,ENVELOPED_IN_DARKNESS)
    local peaceForTheSpirit = player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT)
    local WildcatSandy = player:getVar("WildcatSandy")
	local rank3 = player:getRank(BASTOK) >= 3 and 1 or player:getRank(SANDORIA) >= 3 and 1 or player:getRank(WINDURST) >= 3 and 1 or 0;

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,15) == false) then
        player:startEvent(562)
    elseif (theGeneralSecret == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(55) -- Start Quest "The General's Secret"
    elseif (mJob == dsp.job.RDM and mLvL >= AF2_QUEST_LEVEL and player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_COMPLETED and envelopedInDarkness == QUEST_AVAILABLE) then
        player:startEvent(94) -- Start Quest "Enveloped in Darkness"
    elseif (player:hasKeyItem(dsp.ki.OLD_POCKET_WATCH) and player:hasKeyItem(dsp.ki.OLD_BOOTS) == false) then
        player:startEvent(93)
    elseif (player:hasKeyItem(dsp.ki.OLD_BOOTS) and player:getVar("needs_crawler_blood") == 0) then
        player:startEvent(101)
    elseif (player:getVar("needs_crawler_blood") == 1) then
        player:startEvent(117)
    elseif (mJob == dsp.job.RDM and mLvL >= AF2_QUEST_LEVEL and envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(109) -- Start Quest "Peace for the Spirit"
    elseif (peaceForTheSpirit == QUEST_ACCEPTED) then
        player:startEvent(108) -- Standard dialog during Peace of the spirit
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and (player:getVar("peaceForTheSpiritCS") >= 2 and player:getVar("peaceForTheSpiritCS") <= 4)) then
        player:startEvent(113)
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and player:getVar("peaceForTheSpiritCS") == 5) then
        player:startEvent(51)
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)) then
        player:startEvent(53)
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)) then
        player:startEvent(54)
    elseif (envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(114) -- Standard dialog after Enveloped in darkness
    elseif (peaceForTheSpirit == QUEST_COMPLETED) then
        player:startEvent(52) -- Standard dialog after Peace of the spirit
	elseif (player:hasKeyItem(dsp.ki.SAN_DORIA_TRUST_PERMIT) == true and player:hasSpell(dsp.trust.CURILLA) == false) then			
		player:startEvent(573,0,0,0,TrustMemory(player),0,0,0,rank3); -- TRUST
	else
        player:startEvent(530) -- Standard dialog
    end

end

function onEventFinish(player,csid,option)
    if (csid == 55 and option == 1) then
        player:addQuest(SANDORIA,THE_GENERAL_S_SECRET)
        player:addKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CURILLAS_BOTTLE_EMPTY)
    elseif (csid == 54) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16409) -- Lynx Baghnakhs
        else
            player:delKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)
            player:addItem(16409)
            player:messageSpecial(ID.text.ITEM_OBTAINED,16409) -- Lynx Baghnakhs
            player:addFame(SANDORIA,30)
            player:completeQuest(SANDORIA,THE_GENERAL_S_SECRET)
        end
    elseif (csid == 94 and option == 1) then
        player:addQuest(SANDORIA,ENVELOPED_IN_DARKNESS)
        player:addKeyItem(dsp.ki.OLD_POCKET_WATCH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.OLD_POCKET_WATCH)
    elseif (csid == 109 and option == 1) then
        player:addQuest(SANDORIA,PEACE_FOR_THE_SPIRIT)
        player:setVar("needs_crawler_blood",0)
    elseif (csid == 101) then
        player:setVar("needs_crawler_blood",1)
    elseif (csid == 562) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",15,true)
	
	--TRUST
	elseif (csid == 573 and option == 2) then
		player:addSpell(dsp.trust.CURILLA, true);
		player:PrintToPlayer("You learned Trust: Curilla!", 0xD);
    else
        dsp.wsquest.handleEventFinish(wsQuest,player,csid,option,ID.text.SAVAGE_BLADE_LEARNED)
    end
end

function TrustMemory(player)
	local memories = 0;
	--2 - PEACE_FOR_THE_SPIRIT
	if(player:hasCompletedQuest(SANDORIA, PEACE_FOR_THE_SPIRIT)) then
		memories = memories + 2;
	end
	--4 - OLD_WOUNDS
	if(player:hasCompletedQuest(SANDORIA, OLD_WOUNDS)) then
		memories = memories + 4;
	end
	--8 - THE_HEIR_TO_THE_LIGHT
	if(player:hasCompletedMission(SANDORIA,THE_HEIR_TO_THE_LIGHT)) then
		memories = memories + 8;
	end
	--16 - Heroine's Combat BCNM
	--if(playervar for Heroine's Combat) then
	--	memories = memories + 16;
	--end
	--32 - FIT_FOR_A_PRINCE
	if(player:hasCompletedQuest(SANDORIA, FIT_FOR_A_PRINCE)) then
		memories = memories + 32;
	end
	return memories;
end