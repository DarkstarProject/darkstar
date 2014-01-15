-----------------------------------
-- Area: Bastok Markets
-- NPC: Pavel
-- Involved in Quest: Stamp Hunt
-- @pos -349.798 -10.002 -181.296 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end

    local StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);
    local stampCount = player:getVar("StampHunt_Event");
	local checkStamp = testflag(tonumber(stampCount),0x1);
	
	local WildcatBastok = player:getVar("WildcatBastok");
	
	if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,14) == false) then
		player:startEvent(0x01af);
    elseif (StampHunt == 1 and checkStamp == false) then
        player:setVar("StampHunt_Event",stampCount+0x1);
        player:startEvent(0x00e3);
    else
        player:startEvent(0x0080);
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

	if (csid == 0x01af) then
		player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",14,true);
    end

end;




