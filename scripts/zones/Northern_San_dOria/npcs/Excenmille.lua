-----------------------------------
-- Area: Northern San d'Oria
--   NPC: Excenmille
-- Type: Ballista Pursuivant
-- !pos -229.344 6.999 22.976 231
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/trusts");
require("scripts/globals/titles");


function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    TrustSandoria = player:getQuestStatus(SANDORIA,TRUST_SANDORIA);
	TrustBastok   = player:getQuestStatus(BASTOK,TRUST_BASTOK);
	TrustWindurst = player:getQuestStatus(WINDURST,TRUST_WINDURST);
	local Level = player:getMainLvl();
	local rank3 = player:getRank(BASTOK) >= 3 and 1 or player:getRank(SANDORIA) >= 3 and 1 or player:getRank(WINDURST) >= 3 and 1 or 0;

	
	--TRUST
	if (Level >= 5 and TrustSandoria == QUEST_ACCEPTED and (TrustBastok == QUEST_COMPLETED or TrustWindurst == QUEST_COMPLETED)) then
		if (player:hasKeyItem(dsp.keyItem.RED_INSTITUTE_CARD) == true and player:hasSpell(dsp.trust.EXCENMILLE) == false) then
			player:startEvent(897,0,0,0,TrustMemory(player),0,0,0,rank3);	
		end
	elseif (Level >= 5 and TrustSandoria == QUEST_ACCEPTED) then
		if (player:hasKeyItem(dsp.keyItem.RED_INSTITUTE_CARD) == true and player:hasSpell(dsp.trust.EXCENMILLE) == false) then
			player:startEvent(893,0,0,0,TrustMemory(player),0,0,0,rank3);
		elseif (player:hasSpell(dsp.trust.EXCENMILLE) == true and player:getVar("SandoriaFirstTrust") == 1) then
			player:startEvent(894);
		elseif (player:getVar("SandoriaFirstTrust") == 2) then
			player:startEvent(895);
		end
		
	--TRUST END	
	elseif(TrustSandoria == QUEST_COMPLETED and player:hasSpell(dsp.trust.CURILLA) == false) then
		player:startEvent(896,0,0,0,0,0,0,0,rank3);
	else
		player:startEvent(29);
	end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
	--TRUST
	if (csid == 893) then
		player:addSpell(dsp.trust.EXCENMILLE, true);
		player:addVar("SandoriaFirstTrust", 1);
		player:PrintToPlayer("You learned Trust: Excenmille!", 0xD);
	elseif (csid == 895) then
		player:messageSpecial(ID.text.KEYITEM_LOST,dsp.keyItem.RED_INSTITUTE_CARD);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.SAN_DORIA_TRUST_PERMIT);
		player:setVar("SandoriaFirstTrust", 0);
		player:addTitle(dsp.title.THE_TRUSTWORTHY);
		player:completeQuest(SANDORIA,TRUST_SANDORIA);
		player:delKeyItem(dsp.keyItem.RED_INSTITUTE_CARD);
		player:addKeyItem(dsp.keyItem.SAN_DORIA_TRUST_PERMIT);
		player:PrintToPlayer("You are now able to call multiple alter egos.", 0xD);
    elseif (csid == 897) then
		player:addSpell(dsp.trust.EXCENMILLE, true);
		player:PrintToPlayer("You learned Trust: Excenmille!", 0xD);
		player:completeQuest(SANDORIA,TRUST_SANDORIA);
		player:delKeyItem(dsp.keyItem.RED_INSTITUTE_CARD);
		player:addKeyItem(dsp.keyItem.SAN_DORIA_TRUST_PERMIT);
		player:messageSpecial(ID.text.KEYITEM_LOST,dsp.keyItem.RED_INSTITUTE_CARD);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.SAN_DORIA_TRUST_PERMIT);
    end
end;


function TrustMemory(player)
	local memories = 0;
	--2 - BALLISTA_LICENSE
	if (player:hasKeyItem(dsp.keyItem.BALLISTA_LICENSE)) then
		memories = memories + 2;
	end
	--4 - Chocobo racing
	--if() then
	--	memories = memories + 4;
	--end
	--8 - CLAWS_OF_THE_GRIFFON
	if(player:hasCompletedMission(WOTG, CLAWS_OF_THE_GRIFFON)) then
		memories = memories + 8;
	end
	--16 - BLOOD_OF_HEROES
	if(player:hasCompletedQuest(WOTG, BLOOD_OF_HEROES)) then
		memories = memories + 16;
	end
	return memories;
end
