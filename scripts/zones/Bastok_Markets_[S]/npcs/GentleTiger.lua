----------------------------------
--  Area: Bastok Markets [S]
--  NPC:  GentleTiger
--  Type: Quest
--  @pos -203	-9	1
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bastok_Markets_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local onSabbatical = player:getQuestStatus(CRYSTAL_WAR,ON_SABBATICAL);
    local onSabbaticalProgress = player:getVar("OnSabbatical");
    if (onSabbatical == QUEST_ACCEPTED) then
        if (onSabbaticalProgress == 1 ) then
            player:startEvent(46);
        else
            player:startEvent(47);
        end
    end

end;

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
    if (csid == 46) then
        player:setVar("OnSabbatical", 2);
    end
end;

