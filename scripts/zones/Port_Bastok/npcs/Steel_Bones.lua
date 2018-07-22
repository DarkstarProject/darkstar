-----------------------------------
-- Area: Port Bastok
--  NPC: Steel Bones
-- Standard Info NPC
-- Involved in Quest: Guest of Hauteur
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local GuestofHauteur = player:getQuestStatus(BASTOK,GUEST_OF_HAUTEUR);
    local itemEquipped = player:getEquipID(dsp.slot.MAIN);

    if (GuestofHauteur == QUEST_ACCEPTED and player:getVar("GuestofHauteur_Event") ~= 1 and (itemEquipped == 17045 or itemEquipped == 17426)) then -- Maul / Replica Maul
        player:startEvent(57);
    else
        player:startEvent(29);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 57 and GuestofHauteur == 1) then
        player:setVar("GuestofHauteur_Event",1)
        player:addKeyItem(dsp.ki.LETTERS_FROM_DOMIEN);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LETTERS_FROM_DOMIEN);
    end

end;