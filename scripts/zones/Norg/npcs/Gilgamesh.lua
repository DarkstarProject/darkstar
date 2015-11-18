-----------------------------------
-- Area: Norg
-- NPC:  Gilgamesh
-- @pos 122.452 -9.009 -12.052 252
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getCurrentMission(BASTOK) == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 2) then
		if (trade:hasItemQty(1160,1) and trade:getItemCount() == 1) then -- Frag Rock
			player:startEvent(0x0063); -- Bastok Mission 6-2
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local ZilartMission = player:getCurrentMission(ZILART);
	
	if (ZilartMission == KAZAMS_CHIEFTAINESS) then
		player:startEvent(0x0007);
	elseif (ZilartMission == THE_TEMPLE_OF_UGGALEPIH) then
		player:startEvent(0x0008);
	elseif (ZilartMission == HEADSTONE_PILGRIMAGE) then
		player:startEvent(0x0009);
	elseif (ZilartMission == RETURN_TO_DELKFUTTS_TOWER) then
		player:startEvent(0x000d);
	elseif (ZilartMission == ROMAEVE) then
		player:startEvent(0x000b);
	elseif (ZilartMission == THE_MITHRA_AND_THE_CRYSTAL) then
		player:startEvent(0x00aa);
	elseif (ZilartMission == ARK_ANGELS) then
		player:startEvent(0x00ab);
    elseif (ZilartMission == THE_CELESTIAL_NEXUS) then
        player:startEvent(0x00ad);
    elseif (ZilartMission == AWAKENING) then
        player:startEvent(0x00b1);
	end
	
end;

--0x00af  0x0000  0x0002  0x0003  0x0004  0x0007  0x0008  0x0009  0x000a  0x0062  0x0063  0x001d  0x000c  
--0x000d  0x0092  0x009e  0x00a4  0x00a9  0x00aa  0x00ab  0x00ac  0x00ad  0x00b0  0x00b1  0x00e8  0x00e9  
--0x00ea
-- 0x0062  0x0063 mission bastok
-- 0x000c parle de kuzotz ? parle de bijoux aussi
-- 0x000a parle de zitah

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x0063) then
		player:tradeComplete();
		player:setVar("MissionStatus",3);
	end
	
end;