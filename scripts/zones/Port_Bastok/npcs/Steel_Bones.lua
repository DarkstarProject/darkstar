-----------------------------------
-- Area: Port Bastok
-- NPC: Steel Bones
-- Standard Info NPC
-- Involved in Quest: Guest of Hauteur
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

  GuestofHauteur = player:getQuestStatus(BASTOK,GUEST_OF_HAUTEUR);
  questStatus = player:getVar("GuestofHauteur_Event");
  itemEquipped = player:getEquipID(0);

  if (GuestofHauteur == 1 and questStatus ~= 1 and (itemEquipped == MAUL or itemEquipped == REPLICA_MAUL)) then
    player:startEvent(0x39);
  else
  	player:startEvent(0x01d);
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

    if (csid == 0x39 and GuestofHauteur == 1) then
        player:setVar("GuestofHauteur_Event",1)
        player:addKeyItem(LETTERS_FROM_DOMIEN);
        player:messageSpecial(KEYITEM_OBTAINED,LETTERS_FROM_DOMIEN);        
    end
end;




