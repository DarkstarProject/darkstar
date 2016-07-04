-----------------------------------
--      Area: Southern San d'Oria
--      NPC: Corua
--      Only sells when San d'Oria controlls Ronfaure Region
--      @ zone 230
--      @pos -66 2 -11
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    else
        onHalloweenTrade(player,trade,npc);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

        RegionOwner = GetRegionOwner(RONFAURE);
-- player:startEvent(0x0351) - are you the chicks owner
        if (RegionOwner ~= SANDORIA) then
                player:showText(npc,CORUA_CLOSED_DIALOG);
        else
                player:showText(npc,CORUA_OPEN_DIALOG);
               
                stock = {0x1125,29,             -- San d'Orian Carrot
                                 0x114f,69,             -- San d'Orian Grape
                                 0x027f,110,    -- Chestnut
                                 0x0262,55}             -- San d'Orian Flour
                                 
                showShop(player,SANDORIA,stock);
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
end;



