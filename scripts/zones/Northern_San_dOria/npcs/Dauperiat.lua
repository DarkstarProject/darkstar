-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Dauperiat
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Blackmail" quest status
   Black = player:getQuestStatus(SANDORIA,BLACKMAIL);
   --TRADE BLACKMAIL
   if (player:getQuestStatus(SANDORIA,BLACKMAIL) >= 1) then
      count = trade:getItemCount();
      carta = trade:hasItemQty(530, 1);
      gil = trade:getGil();
      if (carta == 1 and count == 1 and gil == 0) then
	player:startEvent(0x0288);
      end
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- "Blackmail" quest status
Black = player:getQuestStatus(SANDORIA, BLACKMAIL);
Key1 = player:hasKeyItem(161);
word = player:hasKeyItem(318);
sanFame = player:getFameLevel(SANDORIA);
sanRank = player:getRank(SANDORIA);
   if (sanFame >= 3 and sanRank >= 3) then
      if (Black == 0 and Key1 == false and word == false) then
         player:startEvent(0x0283);
      elseif (Key1) then  
         player:startEvent(0x0285);
      elseif (Black == 0 and word) then
         player:startEvent(0x0286);
	 player:delKeyItem(295);
      elseif (Black == 1) then
	 player:startEvent(0x0281);
      elseif (Black == 2) then
         player:startEvent(0x0287);
      end
   else
      player:startEvent(0x0282);
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
if (csid == 0x0283) then
	player:addKeyItem(161);
	player:messageSpecial(KEYITEM_OBTAINED);
	player:getQuestStatus(SANDORIA,BLACKMAIL);
                end
       if (csid == 0x0288) then
                if (player:getQuestStatus(SANDORIA,BLACKMAIL) == 1) then
                        player:completeQuest(SANDORIA,BLACKMAIL);
                        player:addFame(SANDORIA,SAN_FAME*30);
                else
                        player:addFame(SANDORIA,SAN_FAME*5);
                end


                player:tradeComplete();
                player:addGil(GIL_RATE*900);
                player:messageSpecial(GIL_OBTAINED,GIL_RATE*900)
		if (csid == 0x028 and option == 1) then
		player:addQuest(SANDORIA,BLACKMAIL);
		end
		end
				end;