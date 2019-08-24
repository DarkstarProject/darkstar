-----------------------------------
-- Area: Metalworks
--  NPC: Lucius
-- Involved in Mission: Bastok 3-3
-- Involved in Quest: Riding on the Clouds
-- !pos 59.959 -17.39 -42.321 237
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Metalworks/IDs");
require("scripts/globals/trusts")
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 8) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SMILING_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)
	local bastokRank = player:getRank(BASTOK);
	local sandoriaRank = player:getRank(SANDORIA);
	local windurstRank = player:getRank(WINDURST);
	local rank6 = player:getRank(BASTOK) >= 6 and 1 or player:getRank(SANDORIA) >= 6 and 1 or player:getRank(WINDURST) >= 6 and 1 or 0;

    if (player:getCurrentMission(BASTOK) == JEUNO_MISSION and player:getVar("MissionStatus") == 0) then
        player:startEvent(322);
	
	--TRUST VOLKER
	elseif (player:hasKeyItem(dsp.keyItem.BASTOK_TRUST_PERMIT) == true and player:hasSpell(dsp.trust.VOLKER) == false) then			
		if(player:hasSpell(dsp.trust.AYAME) == false) then
			player:startEvent(986,0,0,0,TrustMemory(player),0,0,0,0);
		else
			player:startEvent(986,0,0,0,TrustMemory(player),0,0,0,rank6);
		end
    else
        player:startEvent(320);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 322) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_AMBASSADOR);
	elseif (csid == 986 and option == 2) then
		player:addSpell(dsp.trust.VOLKER, true);
		player:PrintToPlayer("You learned Trust: Volker!", 0xD);
    end

end;

function TrustMemory(player)
	local memories = 0;
	--2 - Darkness Rising (Bastok Mission)
	if (player:hasCompletedMission(BASTOK, DARKNESS_RISING)) then
		memories = memories + 2;
	end
	--4 - Where Two Paths Converge (Bastok Mission)
	if(player:hasCompletedMission(BASTOK, WHERE_TWO_PATHS_CONVERGE)) then
		memories = memories + 4;
	end
	--8 - Light of Judgment (Aht Urhgan Mission)
	if(player:hasCompletedMission(TOAU, LIGHT_OF_JUDGMENT)) then
		memories = memories + 8;
	end
	--16 - Hero's Combat (BCNM)
	--if(playervar for Hero's Combat) then
	--	memories = memories + 16;
	--end
	return memories;
end