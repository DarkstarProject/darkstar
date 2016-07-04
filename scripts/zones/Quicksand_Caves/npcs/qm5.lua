-----------------------------------
-- Area: Quicksand Caves
-- NPC:  ??? (qm5)
-- Involved in Quest: The Missing Piece
-- @pos
--1:770 0 -419
--2:657 0 -537
--3:749 0 -573
--4:451 -16 -739
--5:787 -16 -819
--spawn in npc_list is 770 0 -419
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local TheMissingPiece = player:getQuestStatus(OUTLANDS,THE_MISSING_PIECE);
    local HasAncientFragment = player:hasKeyItem(ANCIENT_TABLET_FRAGMENT);
    local HasAncientTablet = player:hasKeyItem(TABLET_OF_ANCIENT_MAGIC);

    --Need to make sure the quest is flagged the player is no further along in the quest
    
    if (TheMissingPiece == QUEST_ACCEPTED and not(HasAncientTablet or HasAncientFragment or player:getTitle() == ACQUIRER_OF_ANCIENT_ARCANUM)) then
        player:addKeyItem(ANCIENT_TABLET_FRAGMENT);
        player:messageSpecial(KEYITEM_OBTAINED,ANCIENT_TABLET_FRAGMENT);
        
        --move the ??? to a random location
        
        local i = math.random(0,100);
        if (i >= 0 and i < 20) then
            npc:setPos(770,0,-419,0);
        elseif (i >= 20 and i < 40) then
            npc:setPos(657,0,-537,0);
        elseif (i >= 40 and i < 60) then
            npc:setPos(749,0,-573,0);
        elseif (i >= 60 and i < 80) then
            npc:setPos(451,-16,-739,0);
        elseif (i >= 80 and i <= 100) then
            npc:setPos(787,-16,-819,0);
        else
            npc:setPos(787,-16,-819,0);
        end;    
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;
