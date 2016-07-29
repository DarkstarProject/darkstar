-----------------------------------
--      Area: Southern San d'Oria
--      NPC: Pourette
--      Only sells when San d'Oria controlls Derfland Region
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

        RegionOwner = GetRegionOwner(DERFLAND);

        if (RegionOwner ~= SANDORIA) then
                player:showText(npc,POURETTE_CLOSED_DIALOG);
        else
                player:showText(npc,POURETTE_OPEN_DIALOG);
               
                stock = {0x1100,128,  --Derfland Pear
                                 0x0269,142,  --Ginger
                                 0x11c1,62,       --Gysahl Greens
                                 0x0584,1656, --Olive Flower
                                 0x0279,14,       --Olive Oil
                                 0x03b7,110}  --Wijnruit

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


