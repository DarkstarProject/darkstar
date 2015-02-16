-----------------------------------
--  Area: Pashhow Marshlands
--  NPC: Suspicious Hume
--  Type: Monstrosity quest starter
--  @pos X Y Z R -491 24 -618 (148)
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	printf("CSID: %u",csid);
	printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	printf("CSID: %u",csid);
	printf("RESULT: %u",option);
end;