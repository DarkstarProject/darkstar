-----------------------------------
-- Area: Port San d'Oria
-- NPC: Nimia
-- Only sells when San d'Oria controlls Elshimo Lowlands
-- Working 100%
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(ELSHIMOLOWLANDS);

    if (RegionOwner ~= NATION_SANDORIA) then 
        player:showText(npc,NIMIA_CLOSED_DIALOG);
    else
        player:showText(npc,NIMIA_OPEN_DIALOG);
    
        local stock =
        {
            0x0264,55,  -- Kazham Peppers
            0x1150,55,  -- Kazham Pineapple
            0x1126,36,  -- Mithran Tomato
            0x0272,234, -- Black Pepper
            0x0276,88,  -- Ogre Pumpkin
            0x0278,110, -- Kukuru Bean
            0x0583,1656 -- Phalaenopsis
        }
        showShop(player,SANDORIA,stock);
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
end;
