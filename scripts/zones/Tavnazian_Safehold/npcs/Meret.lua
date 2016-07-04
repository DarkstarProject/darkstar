-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Meret
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Tavnazian_Safehold/TextIDs");

--Meret     24A 586 recompense
local Sin_of_Indulgence=1915;
local FUTSUNO_MITAMA=17810;
local Sin_of_Indolence=1914;       
local AUREOLE=18245;
local Sin_of_Invidiousness=1916;       
local RAPHAEL_ROD=18398;
local Sin_of_Indignation=1913;       
local NINURTA_SASH=15458;
local Sin_of_Insolence=1917;       
local MARS_RING=15548;
local Sin_of_Infatuation=1918;       
local BELLONA_RING=15549;
local Sin_of_Intemperance=1919;       
local MINERVA_RING =15550;
local Aura_of_Adulation=1911;        
local NOVIO_EARRING=14808;
local Aura_of_Voracity=1912;       
local NOVIA_EARRING =14809;
local Vice_of_Antipathy=1901;       
local MERCIFUL_CAPE=15471; 
local Vice_of_Avarice=1902;       
local ALTRUISTIC_CAPE=15472;
local Vice_of_Aspersion=1903;        
local ASTUTE_CAPE=15473; 
    
--------------------------------------  
local AERN_ORGAN=1786;
local EUVHI_ORGAN=1818;
local HPEMDE_ORGAN=1787;
local PHUABO_ORGAN=1784;
local XZOMIT_ORGAN=1785;
local YOVRA_ORGAN=1788;
local LUMINON_Chip=1819;
local LUMINIAN_Tissue=1783;
local VIRTUE_STONE_POUCH=5410;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local reward = 0;
    local item = 0;
    local NameOfScience = player:getQuestStatus(OTHER_AREAS,IN_THE_NAME_OF_SCIENCE);

    if (NameOfScience == QUEST_COMPLETED and trade:getItemCount()==1) then
        if (trade:hasItemQty(Sin_of_Indulgence,1)) then
            item = Sin_of_Indulgence; reward = FUTSUNO_MITAMA;
        elseif (trade:hasItemQty(Sin_of_Indolence,1)) then       
            item = Sin_of_Indolence; reward = AUREOLE;
        elseif (trade:hasItemQty(Sin_of_Invidiousness,1)) then  
            item = Sin_of_Invidiousness;reward = RAPHAEL_ROD;
        elseif (trade:hasItemQty(Sin_of_Indignation,1)) then       
            item = Sin_of_Indignation;reward = NINURTA_SASH;
        elseif (trade:hasItemQty(Sin_of_Insolence,1)) then  
            item = Sin_of_Insolence;reward = MARS_RING;
        elseif (trade:hasItemQty(Sin_of_Infatuation,1)) then       
            item = Sin_of_Infatuation; reward = BELLONA_RING;
        elseif (trade:hasItemQty(Sin_of_Intemperance,1)) then       
            item = Sin_of_Intemperance; reward = MINERVA_RING;
        elseif (trade:hasItemQty(Aura_of_Adulation,1)) then       
            item = Aura_of_Adulation;reward = NOVIO_EARRING;
        elseif (trade:hasItemQty(Aura_of_Voracity,1)) then  
            item = Aura_of_Voracity;reward = NOVIA_EARRING; 
        elseif (trade:hasItemQty(Vice_of_Antipathy,1)) then  
            item = Vice_of_Antipathy;reward = MERCIFUL_CAPE; 
        elseif (trade:hasItemQty(Vice_of_Avarice,1)) then       
            item = Vice_of_Avarice;reward = ALTRUISTIC_CAPE;
        elseif (trade:hasItemQty(Vice_of_Aspersion,1)) then       
            item = Vice_of_Aspersio;reward = ASTUTE_CAPE;
    
  --------------virtue stones------------------------  
        elseif (trade:hasItemQty(AERN_ORGAN,1)) then
            item =AERN_ORGAN; reward = VIRTUE_STONE_POUCH;
        elseif (trade:hasItemQty(EUVHI_ORGAN,1)) then
            item =EUVHI_ORGAN; reward = VIRTUE_STONE_POUCH;
        elseif (trade:hasItemQty(HPEMDE_ORGAN,1)) then
            item =HPEMDE_ORGAN; reward = VIRTUE_STONE_POUCH;
        elseif (trade:hasItemQty(PHUABO_ORGAN,1)) then
            item =PHUABO_ORGAN; reward = VIRTUE_STONE_POUCH;
        elseif (trade:hasItemQty(XZOMIT_ORGAN,1)) then
            item =XZOMIT_ORGAN; reward = VIRTUE_STONE_POUCH;
        elseif ( trade:hasItemQty(YOVRA_ORGAN,1)) then
            item =YOVRA_ORGAN; reward = VIRTUE_STONE_POUCH;
        elseif (trade:hasItemQty(LUMINON_Chip,1)) then
            item =LUMINON_Chip; reward = VIRTUE_STONE_POUCH;
        elseif (trade:hasItemQty(LUMINIAN_Tissue,1)) then
            item =LUMINIAN_Tissue; reward = VIRTUE_STONE_POUCH;
        end
    
        if (reward > 0) then
            player:startEvent(0x024A,item,reward);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local NameOfScience = player:getQuestStatus(OTHER_AREAS,IN_THE_NAME_OF_SCIENCE);
    local rnd= math.random();
    if (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) then
        if (NameOfScience == QUEST_COMPLETED) then
            if (rnd < 0.5) then
                player:startEvent(0x0246);
            else
                player:startEvent(0x0247);
            end
        else
            player:startEvent(0x0249);
        end       
    else
        player:startEvent(0x0248);
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
    if (csid == 0x024A) then
        if (player:getFreeSlotsCount()==0 or (option ~= VIRTUE_STONE_POUCH and player:hasItem(option)==true)) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,option); 
        else
        player:tradeComplete();
        player:addItem(option);
        player:messageSpecial(ITEM_OBTAINED,option); -- Item 
        end
    end
end;