-----------------------------------
-- Area: Port Bastok
-- NPC: Zoby Quhyo
-- Only sells when Bastok controlls Elshimo Lowlands
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
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
    RegionOwner = GetRegionOwner(ELSHIMOLOWLANDS);
    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,ZOBYQUHYO_CLOSED_DIALOG);
    else
        player:showText(npc,ZOBYQUHYO_OPEN_DIALOG);
    
        stock = {
            0x0272,   234,   --Black Pepper
            0x0264,    55,   --Kazham Peppers
            0x1150,    55,   --Kazham Pineapple
            0x0278,   110,   --Kukuru Bean
            0x1126,    36,   --Mithran Tomato
            0x0276,    88,   --Ogre Pumpkin
            0x0583,  1656    --Phalaenopsis
        }
        showShop(player,BASTOK,stock);

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
