-----------------------------------
--  Area: Southern San d'Oria
--   NPC: Varchet
--  Type: NPC
-- @zone: 230
--  @pos: 116.484 -1 91.554
-----------------------------------
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

GAME_WON = 0;
GAME_LOST = 2;
GAME_TIE = 3;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (trade:getGil() == 5) then
	   player:delGil(5);
	   vdie1 = math.random(1,6);
  	   vdie2 = math.random(1,6);
  	   vtotal = vdie1 + vdie2;
  	   pdie1 = math.random(1,6);
  	   pdie2 = math.random(1,6);
  	   ptotal = pdie1 + pdie2;

           if (ptotal > vtotal) then
              player:startEvent(0x0207,vdie1,vdie2,vtotal,pdie1,pdie2,ptotal,GAME_WON);
           elseif (vtotal > ptotal) then
              player:startEvent(0x0207,vdie1,vdie2,vtotal,pdie1,pdie2,ptotal,GAME_LOST);
           elseif (ptotal == vtotal) then
              player:startEvent(0x0207,vdie1,vdie2,vtotal,pdie1,pdie2,ptotal,GAME_TIE);
           else
              printf("Results Varchet's Roll : %u, Player's Roll : %u", vtotal, ptotal);
           end
	else
	    player:startEvent(0x0260);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

        exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);
        
        if (exitTheGambler == QUEST_ACCEPTED) then
           player:startEvent(0x027e);
        else
           player:startEvent(0x020d);
        end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	printf("U CSID: %u",csid);
	printf("U RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	--printf("F CSID: %u",csid);
	--printf("F RESULT: %u",option);
	
	exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);
	npc = player:getEventTarget();
	
	if (csid == 519) then
          if (option == GAME_WON) then
  	    player:addGil(10);
  	    player:messageSpecial(GIL_OBTAINED,10);
  	    if (exitTheGambler == QUEST_ACCEPTED) then
  	      player:completeQuest(SANDORIA,EXIT_THE_GAMBLER);
  	      player:showText(npc,7629);
  	    end
          elseif (option == GAME_TIE) then
            player:addGil(5);
  	    player:messageSpecial(GIL_OBTAINED,5);
  	    player:showText(npc,7622);
          else
            player:showText(npc,7620);
          end
        end
end;

