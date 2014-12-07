-----------------------------------
--  Area: Al'Taieu
--  NPC:  Rubious Crystal (East Tower)
--  @pos 683.718 -6.250 -222.167 33
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and (player:getVar("PromathiaStatus")==2 or player:getVar("PromathiaStatus")==4 or player:getVar("PromathiaStatus")==6)
     and player:getVar("Ru_aern_3-1KILL")==0 or player:getVar("Ru_aern_3-2KILL")==0 or player:getVar("Ru_aern_3-3KILL")==0)then
        player:messageSpecial(OMINOUS_SHADOW);
        SpawnMob(16912835,180):updateEnmity(player);   
        SpawnMob(16912836,180):updateEnmity(player);
        SpawnMob(16912837,180):updateEnmity(player);   
    elseif(player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("Ru_aern_3-1KILL")==1 and player:getVar("Ru_aern_3-2KILL")==1 and player:getVar("Ru_aern_3-3KILL")==1) then
        if(player:getVar("PromathiaStatus")==3) then
            player:startEvent(0x00A1);
        elseif(player:getVar("PromathiaStatus")==5) then
            player:startEvent(0x00A2);
        elseif(player:getVar("PromathiaStatus")==7)then
            player:startEvent(0x00A3);
        else
            player:messageSpecial(NOTHING_OF_INTEREST); 
        end
    else
        player:messageSpecial(NOTHING_OF_INTEREST); 
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
    
    if(csid == 0x00A1)then
        player:setVar("PromathiaStatus",4);
    elseif(csid == 0x00A2)then	
        player:setVar("PromathiaStatus",6);
    elseif(csid == 0x00A3)then	
        player:setVar("PromathiaStatus",8);
    end
    
end;