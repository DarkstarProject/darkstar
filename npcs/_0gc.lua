-----------------------------------
--  Area: Promyvion Holla
--   NPC: Memory Flux
-- @zone: 16
--  @pos 99 -1 -140
-----------------------------------

--------------------------	---------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
     if (player:getQuestStatus(JEUNO,SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED and player:hasKeyItem(PROMYVION_HOLLA_SLIVER) == false)  then 
		player:addKeyItem(PROMYVION_HOLLA_SLIVER);
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
    end
end;