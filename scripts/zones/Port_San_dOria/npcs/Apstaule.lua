-----------------------------------
-- Area: Port San d'Oria
-- NPC:  Apstaule
-- Not used cutscenes: 541
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
count = trade:getItemCount();
MagicFlyer    = trade:hasItemQty(532,1);
AuctionParcel = trade:hasItemQty(0x0252,1);

    if (MagicFlyer == true and count == 1) then
        FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
        if (FlyerForRegine == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    elseif (AuctionParcel == true and count == 1) then
        TheBrugaireConsortium = player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM);
        if (TheBrugaireConsortium == 1) then
            player:tradeComplete(); 
            player:startEvent(0x021c);
            player:setVar("TheBrugaireConsortium-Parcels", 21);
        end
    end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x21e);
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
end;




